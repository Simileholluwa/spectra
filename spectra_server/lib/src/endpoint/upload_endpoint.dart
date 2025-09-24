import 'dart:async';
import 'dart:convert';
import 'package:dotenv/dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';
import 'package:spectra_server/src/generated/protocol.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

const tokenExpiry = Duration(minutes: 15);

class UploadEndpoint extends Endpoint {
  var env = DotEnv(includePlatformEnvironment: true)..load();
  Future<Artwork?> saveArt(
    Session session,
    Artwork artWork,
  ) async {
    return await session.db.transaction(
      (transaction) async {
        try {
          final user = await authUser(session);
          final savedArtWork = await addArtwork(
            session,
            artWork.copyWith(
              userId: user.userId,
            ),
            user,
          );
          await updateUser(
            session,
            user.copyWith(
              artworksCount: user.artworksCount! + 1,
            ),
          );
          unawaited(
            addTags(
              session,
              artWork.tagNames!,
              savedArtWork.id!,
            ),
          );
          unawaited(
            addModels(
              session,
              artWork.modelNames!,
              savedArtWork.id!,
            ),
          );
          return savedArtWork;
        } catch (e) {
          session.log(
            'Error occurred while uploading artwork: $e',
            level: LogLevel.error,
            stackTrace: StackTrace.current,
          );
          throw ServerSideException(
            message: 'An error occurred while processing the request: $e',
          );
        }
      },
    );
  }

  @doNotGenerate
  Future<void> addTags(
    Session session,
    List<String> tagNames,
    int artworkId,
  ) async {
    for (final name in tagNames) {
      var existingTag = await Tag.db.findFirstRow(
        session,
        where: (row) => row.name.equals(name),
      );

      Tag tag;
      if (existingTag != null) {
        tag = existingTag;
      } else {
        tag = await Tag.db.insertRow(
          session,
          Tag(name: name),
        );
      }

      final existingRelation = await ArtworkTags.db.findFirstRow(
        session,
        where: (row) =>
            row.artworkId.equals(artworkId) & row.tagId.equals(tag.id!),
      );

      if (existingRelation == null) {
        await ArtworkTags.db.insertRow(
          session,
          ArtworkTags(
            artworkId: artworkId,
            tagId: tag.id!,
          ),
        );

        await Tag.db.updateRow(
          session,
          tag.copyWith(
            usageCount: (tag.usageCount ?? 0) + 1,
          ),
        );
      }
    }
  }

  @doNotGenerate
  Future<void> addModels(
    Session session,
    List<String> modelNames,
    int artworkId,
  ) async {
    for (final name in modelNames) {
      var existingModel = await Model.db.findFirstRow(
        session,
        where: (row) => row.name.equals(name),
      );

      Model model;
      if (existingModel != null) {
        model = existingModel;
      } else {
        model = await Model.db.insertRow(
          session,
          Model(name: name),
        );
      }

      final existingRelation = await ArtworkModels.db.findFirstRow(
        session,
        where: (row) =>
            row.artworkId.equals(artworkId) & row.modelId.equals(model.id!),
      );

      if (existingRelation == null) {
        await ArtworkModels.db.insertRow(
          session,
          ArtworkModels(
            artworkId: artworkId,
            modelId: model.id!,
          ),
        );

        await Model.db.updateRow(
          session,
          model.copyWith(
            usageCount: (model.usageCount ?? 0) + 1,
          ),
        );
      }
    }
  }

  Future<String> createUploadToken(Session session) async {
    final user = await authUser(session);
    final userId = user.userId;
    final jwt = JWT({
      'sub': userId.toString(),
      'iat': DateTime.now().millisecondsSinceEpoch,
    });

    return jwt.sign(
      SecretKey(
        env['UPLOAD_SECRET']!,
      ),
      expiresIn: tokenExpiry,
    );
  }

  Future<List<PresignedUrlResponse>> getPresignedUrl(
    Session session,
    List<PresignedUrlRequest> files,
  ) async {
    final response = await http.post(
      Uri.parse(
        'http://localhost:8000/api/presigned_url',
      ),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({"files": files}),
    );
    final data = jsonDecode(response.body);
    if (response.statusCode != 200) {
      throw ServerSideException(
        message: data.toString(),
      );
    }
    return List<PresignedUrlResponse>.from(
      data.map(
        (x) => PresignedUrlResponse.fromJson(x),
      ),
    );
  }

  @doNotGenerate
  Future<User> authUser(
    Session session,
  ) async {
    final authInfo = await session.authenticated;
    if (authInfo == null) {
      throw ServerSideException(
        message: 'You must be logged in',
      );
    }

    var cacheKey = 'UserData-${authInfo.userId}';
    var userRecord = await session.caches.localPrio.get<User>(cacheKey);

    if (userRecord == null) {
      userRecord = await User.db.findFirstRow(
        session,
        where: (row) => row.userId.equals(authInfo.userId),
        include: User.include(
          user: UserInfo.include(),
        ),
      );
      if (userRecord != null) {
        await session.caches.localPrio.put(
          cacheKey,
          userRecord,
          lifetime: Duration(
            days: 1,
          ),
        );
        return userRecord;
      }
    }
    if (userRecord == null) {
      throw ServerSideException(message: 'User not found');
    }
    return userRecord;
  }

  Stream<Artwork> newArtworkUpdates(Session session) async* {
    yield* session.messages.createStream<Artwork>('new_artwork');
  }

  @doNotGenerate
  Future<Artwork> addArtwork(
    Session session,
    Artwork artwork,
    User user,
  ) async {
    final saved = await Artwork.db.insertRow(
      session,
      artwork,
    );
    await session.messages.postMessage(
      'new_artwork',
      saved.copyWith(
        user: user,
      ),
    );
    return saved;
  }

  @doNotGenerate
  Future<void> updateUser(Session session, User user) async {
    await User.db.updateRow(session, user);
  }
}
