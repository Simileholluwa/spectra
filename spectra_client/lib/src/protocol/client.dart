/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:spectra_client/src/protocol/artwork_list.dart' as _i3;
import 'package:spectra_client/src/protocol/filters.dart' as _i4;
import 'package:spectra_client/src/protocol/tags_list.dart' as _i5;
import 'package:spectra_client/src/protocol/models_list.dart' as _i6;
import 'package:spectra_client/src/protocol/artwork_with_user_state.dart'
    as _i7;
import 'package:spectra_client/src/protocol/artwork_comment.dart' as _i8;
import 'package:spectra_client/src/protocol/artwork_comment_list.dart' as _i9;
import 'package:spectra_client/src/protocol/artwork_comment_with_user_state.dart'
    as _i10;
import 'package:spectra_client/src/protocol/artwork_updates.dart' as _i11;
import 'package:spectra_client/src/protocol/artwork_comment_updates.dart'
    as _i12;
import 'package:spectra_client/src/protocol/artwork.dart' as _i13;
import 'package:spectra_client/src/protocol/presigned_url_response.dart'
    as _i14;
import 'package:spectra_client/src/protocol/presigned_url_request.dart' as _i15;
import 'package:spectra_client/src/protocol/user.dart' as _i16;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i17;
import 'protocol.dart' as _i18;

/// {@category Endpoint}
class EndpointArtwork extends _i1.EndpointRef {
  EndpointArtwork(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'artwork';

  _i2.Future<_i3.ArtworkList> getArtworks(
    _i4.ArtworkFilter? filter, {
    required int limit,
    required int page,
    required String sortBy,
    required bool sortDescending,
  }) =>
      caller.callServerEndpoint<_i3.ArtworkList>(
        'artwork',
        'getArtworks',
        {
          'filter': filter,
          'limit': limit,
          'page': page,
          'sortBy': sortBy,
          'sortDescending': sortDescending,
        },
      );

  _i2.Future<void> toggleLike(int artworkId) => caller.callServerEndpoint<void>(
        'artwork',
        'toggleLike',
        {'artworkId': artworkId},
      );

  _i2.Future<void> updateDownloadsCount(int artworkId) =>
      caller.callServerEndpoint<void>(
        'artwork',
        'updateDownloadsCount',
        {'artworkId': artworkId},
      );

  _i2.Future<void> updateViewsCount(int artworkId) =>
      caller.callServerEndpoint<void>(
        'artwork',
        'updateViewsCount',
        {'artworkId': artworkId},
      );

  _i2.Future<_i5.TagsList> getTags({
    required int limit,
    required int page,
    required String search,
    required bool sortDescending,
    required String sortBy,
  }) =>
      caller.callServerEndpoint<_i5.TagsList>(
        'artwork',
        'getTags',
        {
          'limit': limit,
          'page': page,
          'search': search,
          'sortDescending': sortDescending,
          'sortBy': sortBy,
        },
      );

  _i2.Future<_i6.ModelsList> getModels({
    required int limit,
    required int page,
    required String search,
    required bool sortDescending,
    required String sortBy,
  }) =>
      caller.callServerEndpoint<_i6.ModelsList>(
        'artwork',
        'getModels',
        {
          'limit': limit,
          'page': page,
          'search': search,
          'sortDescending': sortDescending,
          'sortBy': sortBy,
        },
      );

  _i2.Future<_i7.ArtworkWithUserState> getArtwork(int artworkId) =>
      caller.callServerEndpoint<_i7.ArtworkWithUserState>(
        'artwork',
        'getArtwork',
        {'artworkId': artworkId},
      );

  _i2.Future<_i8.ArtworkComment> addComment(_i8.ArtworkComment comment) =>
      caller.callServerEndpoint<_i8.ArtworkComment>(
        'artwork',
        'addComment',
        {'comment': comment},
      );

  _i2.Future<_i3.ArtworkList> getRelatedArtworks(
    int artworkId,
    List<String> tagNames,
    List<String> modelNames, {
    required int limit,
    required int page,
  }) =>
      caller.callServerEndpoint<_i3.ArtworkList>(
        'artwork',
        'getRelatedArtworks',
        {
          'artworkId': artworkId,
          'tagNames': tagNames,
          'modelNames': modelNames,
          'limit': limit,
          'page': page,
        },
      );

  _i2.Future<_i9.ArtworkCommentList> getComments(
    int artworkId,
    int? parentId, {
    required int limit,
    required int page,
    required String sortBy,
    required bool sortDescending,
  }) =>
      caller.callServerEndpoint<_i9.ArtworkCommentList>(
        'artwork',
        'getComments',
        {
          'artworkId': artworkId,
          'parentId': parentId,
          'limit': limit,
          'page': page,
          'sortBy': sortBy,
          'sortDescending': sortDescending,
        },
      );

  _i2.Future<_i10.ArtworkCommentWithUserState> getComment(int commentId) =>
      caller.callServerEndpoint<_i10.ArtworkCommentWithUserState>(
        'artwork',
        'getComment',
        {'commentId': commentId},
      );

  _i2.Future<void> likeComment(int commentId) =>
      caller.callServerEndpoint<void>(
        'artwork',
        'likeComment',
        {'commentId': commentId},
      );

  _i2.Future<_i8.ArtworkComment> addReply(_i8.ArtworkComment reply) =>
      caller.callServerEndpoint<_i8.ArtworkComment>(
        'artwork',
        'addReply',
        {'reply': reply},
      );

  _i2.Future<void> deleteComment(int commentId) =>
      caller.callServerEndpoint<void>(
        'artwork',
        'deleteComment',
        {'commentId': commentId},
      );

  _i2.Stream<_i11.ArtworkUpdates> artworkUpdates(int artworkId) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i11.ArtworkUpdates>,
          _i11.ArtworkUpdates>(
        'artwork',
        'artworkUpdates',
        {'artworkId': artworkId},
        {},
      );

  _i2.Stream<_i12.ArtworkCommentUpdates> artworkCommentUpdates(int commentId) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i12.ArtworkCommentUpdates>,
          _i12.ArtworkCommentUpdates>(
        'artwork',
        'artworkCommentUpdates',
        {'commentId': commentId},
        {},
      );

  _i2.Stream<_i8.ArtworkComment> newArtworkCommentUpdates() =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i8.ArtworkComment>,
          _i8.ArtworkComment>(
        'artwork',
        'newArtworkCommentUpdates',
        {},
        {},
      );
}

/// {@category Endpoint}
class EndpointAssets extends _i1.EndpointRef {
  EndpointAssets(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'assets';

  _i2.Future<String?> getUploadDescription(String path) =>
      caller.callServerEndpoint<String?>(
        'assets',
        'getUploadDescription',
        {'path': path},
      );

  _i2.Future<bool> verifyUpload(String path) => caller.callServerEndpoint<bool>(
        'assets',
        'verifyUpload',
        {'path': path},
      );
}

/// {@category Endpoint}
class EndpointSendEmail extends _i1.EndpointRef {
  EndpointSendEmail(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'sendEmail';

  _i2.Future<bool> sendEmail(
    String email,
    String code,
    String text,
    String? username,
    bool isEmailVerification,
  ) =>
      caller.callServerEndpoint<bool>(
        'sendEmail',
        'sendEmail',
        {
          'email': email,
          'code': code,
          'text': text,
          'username': username,
          'isEmailVerification': isEmailVerification,
        },
      );
}

/// {@category Endpoint}
class EndpointUpload extends _i1.EndpointRef {
  EndpointUpload(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'upload';

  _i2.Future<_i13.Artwork?> saveArt(_i13.Artwork artWork) =>
      caller.callServerEndpoint<_i13.Artwork?>(
        'upload',
        'saveArt',
        {'artWork': artWork},
      );

  _i2.Future<String> createUploadToken() => caller.callServerEndpoint<String>(
        'upload',
        'createUploadToken',
        {},
      );

  _i2.Future<List<_i14.PresignedUrlResponse>> getPresignedUrl(
          List<_i15.PresignedUrlRequest> files) =>
      caller.callServerEndpoint<List<_i14.PresignedUrlResponse>>(
        'upload',
        'getPresignedUrl',
        {'files': files},
      );

  _i2.Stream<_i13.Artwork> newArtworkUpdates() => caller
          .callStreamingServerEndpoint<_i2.Stream<_i13.Artwork>, _i13.Artwork>(
        'upload',
        'newArtworkUpdates',
        {},
        {},
      );
}

/// {@category Endpoint}
class EndpointUser extends _i1.EndpointRef {
  EndpointUser(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'user';

  _i2.Future<_i16.User> saveUser(_i16.User user) =>
      caller.callServerEndpoint<_i16.User>(
        'user',
        'saveUser',
        {'user': user},
      );

  _i2.Future<_i16.User?> getUser(String username) =>
      caller.callServerEndpoint<_i16.User?>(
        'user',
        'getUser',
        {'username': username},
      );

  _i2.Future<String?> checkIfNewUser(String email) =>
      caller.callServerEndpoint<String?>(
        'user',
        'checkIfNewUser',
        {'email': email},
      );

  _i2.Future<bool> checkValidUsername(String username) =>
      caller.callServerEndpoint<bool>(
        'user',
        'checkValidUsername',
        {'username': username},
      );

  _i2.Future<_i3.ArtworkList> getUserArtworks(
    String username, {
    required int limit,
    required int page,
    required String sortBy,
    required bool sortDescending,
  }) =>
      caller.callServerEndpoint<_i3.ArtworkList>(
        'user',
        'getUserArtworks',
        {
          'username': username,
          'limit': limit,
          'page': page,
          'sortBy': sortBy,
          'sortDescending': sortDescending,
        },
      );

  _i2.Future<_i3.ArtworkList> getUserLikedArtworks(
    String username, {
    required int limit,
    required int page,
    required bool sortDescending,
  }) =>
      caller.callServerEndpoint<_i3.ArtworkList>(
        'user',
        'getUserLikedArtworks',
        {
          'username': username,
          'limit': limit,
          'page': page,
          'sortDescending': sortDescending,
        },
      );

  _i2.Future<_i3.ArtworkList> getUserDownloadedArtworks(
    String username, {
    required int limit,
    required int page,
    required bool sortDescending,
  }) =>
      caller.callServerEndpoint<_i3.ArtworkList>(
        'user',
        'getUserDownloadedArtworks',
        {
          'username': username,
          'limit': limit,
          'page': page,
          'sortDescending': sortDescending,
        },
      );
}

class Modules {
  Modules(Client client) {
    auth = _i17.Caller(client);
  }

  late final _i17.Caller auth;
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i18.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    artwork = EndpointArtwork(this);
    assets = EndpointAssets(this);
    sendEmail = EndpointSendEmail(this);
    upload = EndpointUpload(this);
    user = EndpointUser(this);
    modules = Modules(this);
  }

  late final EndpointArtwork artwork;

  late final EndpointAssets assets;

  late final EndpointSendEmail sendEmail;

  late final EndpointUpload upload;

  late final EndpointUser user;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'artwork': artwork,
        'assets': assets,
        'sendEmail': sendEmail,
        'upload': upload,
        'user': user,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
