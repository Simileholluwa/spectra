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
    String? userId,
  ) async {
    // Fetch the authenticated user
    final intUserId = int.tryParse(userId ?? '');
    int? id;
    if (intUserId == null) {
      final authInfo = await session.authenticated;
      if (authInfo == null) return null;
      id = authInfo.userId;
    } else {
      id = intUserId;
    }

    // Fetch the user record from the local database
    var cacheKey = 'UserData-$id';
    var user = await session.caches.localPrio.get<User>(
      cacheKey,
    );

    // If the user record is not in the cache, fetch it from the database
    if (user == null) {
      user = await User.db.findFirstRow(
        session,
        where: (row) => row.id.equals(id),
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
}
