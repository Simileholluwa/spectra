import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';
import 'package:spectra_server/src/generated/protocol.dart';

class UserEndpoint extends Endpoint {
  Future<User> saveUser(Session session, User user) async {
    final savedUser = await User.db.insertRow(
      session,
      user.copyWith(
        interests: [],
        likedArtworks: [],
      ),
    );

    return savedUser;
  }

  Future<User?> getUser(
    Session session,
    String username,
  ) async {
    var cacheKey = 'UserData-$username';
    var user = await session.caches.localPrio.get<User>(
      cacheKey,
    );

    if (user == null) {
      user = await User.db.findFirstRow(
        session,
        where: (row) => row.username.equals(username),
        include: User.include(
          user: UserInfo.include(),
        ),
      );
      if (user != null) {
        await session.caches.localPrio.put(
          cacheKey,
          user,
          lifetime: Duration(
            days: 1,
          ),
        );
      }
    }

    return user;
  }

  Future<String?> checkIfNewUser(Session session, String email) async {
    // Check if the user already exists in the database
    var user = await User.db.findFirstRow(
      session,
      where: (user) => user.email.equals(email),
    );

    // If the user does not exist, return null
    if (user == null) return null;

    // If the user already exists, return the username
    return user.username;
  }

  Future<bool> checkValidUsername(Session session, String username) async {
    final user = await User.db.findFirstRow(
      session,
      where: (user) => user.username.equals(username),
    );

    return user == null;
  }

  Future<ArtworkList> getUserArtworks(
    Session session,
    String username, {
    int limit = 50,
    int page = 1,
    String sortBy = 'createdAt',
    bool sortDescending = true,
  }) async {
    final count = await Artwork.db.count(
      session,
      where: (row) =>
          row.mediaType.notEquals(null) & row.user.username.equals(username),
    );

    final results = await Artwork.db.find(
      session,
      limit: limit,
      offset: (page - 1) * limit,
      include: Artwork.include(
        user: User.include(
          user: UserInfo.include(),
        ),
        tags: ArtworkTags.includeList(
          include: ArtworkTags.include(
            tag: Tag.include(),
          ),
        ),
      ),
      where: (row) =>
          row.mediaType.notEquals(null) & row.user.username.equals(username),
      orderBy: (row) {
        switch (sortBy) {
          case 'likes':
            return row.likes;
          case 'views':
            return row.views;
          case 'downloads':
            return row.downloads;
          case 'createdAt':
          default:
            return row.createdAt;
        }
      },
      orderDescending: sortDescending,
    );

    final user = await session.authenticated;
    final userId = user?.userId;
    Set<int> likedIds = {};
    Set<int> downloadedIds = {};

    if (userId != null && results.isNotEmpty) {
      final artworkIds = results.map((a) => a.id!).toList();
      final userLikes = await ArtworkLikes.db.find(
        session,
        where: (t) =>
            t.likedById.equals(userId) &
            t.artworkId.inSet(
              artworkIds.toSet(),
            ),
      );

      final userDownloads = await ArtworkDownloads.db.find(
        session,
        where: (t) =>
            t.downloadedById.equals(userId) &
            t.artworkId.inSet(
              artworkIds.toSet(),
            ),
      );

      likedIds = userLikes.map((l) => l.artworkId).toSet();
      downloadedIds = userDownloads.map((d) => d.artworkId).toSet();
    }

    final enrichedResults = results.map((a) {
      return ArtworkWithUserState(
        artwork: a,
        isLiked: likedIds.contains(a.id),
        isDownloaded: downloadedIds.contains(a.id),
      );
    }).toList();

    return ArtworkList(
      results: enrichedResults,
      limit: limit,
      count: count,
      page: page,
      numPages: (count / limit).ceil(),
      canLoadMore: page * limit < count,
    );
  }

  Future<ArtworkList> getUserLikedArtworks(
    Session session,
    String username, {
    int limit = 50,
    int page = 1,
    bool sortDescending = true,
  }) async {
    final count = await ArtworkLikes.db.count(
      session,
      where: (row) => row.likedBy.username.equals(username),
    );

    final likeResults = await ArtworkLikes.db.find(
      session,
      limit: limit,
      offset: (page - 1) * limit,
      include: ArtworkLikes.include(
        artwork: Artwork.include(
          user: User.include(
            user: UserInfo.include(),
          ),
          tags: ArtworkTags.includeList(
            include: ArtworkTags.include(
              tag: Tag.include(),
            ),
          ),
        ),
      ),
      where: (row) => row.likedBy.username.equals(username),
      orderBy: (row) => row.dateCreated,
      orderDescending: sortDescending,
    );

    final results = likeResults.map((l) => l.artwork!).toList();
    final user = await session.authenticated;
    final userId = user?.userId;
    Set<int> likedIds = {};
    Set<int> downloadedIds = {};

    if (userId != null && results.isNotEmpty) {
      final artworkIds = results.map((a) => a.id!).toList();
      final userLikes = await ArtworkLikes.db.find(
        session,
        where: (t) =>
            t.likedById.equals(userId) &
            t.artworkId.inSet(
              artworkIds.toSet(),
            ),
      );

      final userDownloads = await ArtworkDownloads.db.find(
        session,
        where: (t) =>
            t.downloadedById.equals(userId) &
            t.artworkId.inSet(
              artworkIds.toSet(),
            ),
      );

      likedIds = userLikes.map((l) => l.artworkId).toSet();
      downloadedIds = userDownloads.map((d) => d.artworkId).toSet();
    }

    final enrichedResults = results.map((a) {
      return ArtworkWithUserState(
        artwork: a,
        isLiked: likedIds.contains(a.id),
        isDownloaded: downloadedIds.contains(a.id),
      );
    }).toList();

    return ArtworkList(
      results: enrichedResults,
      limit: limit,
      count: count,
      page: page,
      numPages: (count / limit).ceil(),
      canLoadMore: page * limit < count,
    );
  }

  Future<ArtworkList> getUserDownloadedArtworks(
    Session session,
    String username, {
    int limit = 50,
    int page = 1,
    bool sortDescending = true,
  }) async {
    final count = await ArtworkDownloads.db.count(
      session,
      where: (row) => row.downloadedBy.username.equals(username),
    );

    final downloadResults = await ArtworkDownloads.db.find(
      session,
      limit: limit,
      offset: (page - 1) * limit,
      include: ArtworkDownloads.include(
        artwork: Artwork.include(
          user: User.include(
            user: UserInfo.include(),
          ),
          tags: ArtworkTags.includeList(
            include: ArtworkTags.include(
              tag: Tag.include(),
            ),
          ),
        ),
      ),
      where: (row) => row.downloadedBy.username.equals(username),
      orderBy: (row) => row.dateCreated,
      orderDescending: sortDescending,
    );

    final results = downloadResults.map((l) => l.artwork!).toList();
    final user = await session.authenticated;
    final userId = user?.userId;
    Set<int> likedIds = {};
    Set<int> downloadedIds = {};

    if (userId != null && results.isNotEmpty) {
      final artworkIds = results.map((a) => a.id!).toList();
      final userLikes = await ArtworkLikes.db.find(
        session,
        where: (t) =>
            t.likedById.equals(userId) &
            t.artworkId.inSet(
              artworkIds.toSet(),
            ),
      );

      final userDownloads = await ArtworkDownloads.db.find(
        session,
        where: (t) =>
            t.downloadedById.equals(userId) &
            t.artworkId.inSet(
              artworkIds.toSet(),
            ),
      );

      likedIds = userLikes.map((l) => l.artworkId).toSet();
      downloadedIds = userDownloads.map((d) => d.artworkId).toSet();
    }

    final enrichedResults = results.map((a) {
      return ArtworkWithUserState(
        artwork: a,
        isLiked: likedIds.contains(a.id),
        isDownloaded: downloadedIds.contains(a.id),
      );
    }).toList();

    return ArtworkList(
      results: enrichedResults,
      limit: limit,
      count: count,
      page: page,
      numPages: (count / limit).ceil(),
      canLoadMore: page * limit < count,
    );
  }
}
