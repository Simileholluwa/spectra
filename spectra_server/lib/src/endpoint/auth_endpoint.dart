import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';
import 'package:spectra_server/src/generated/protocol.dart';

class MyAuthenticationEndpoint extends Endpoint {
  Future<AuthenticationResponse> registerUser(
    Session session,
    String email,
    String password,
    String username,
  ) async {
    UserInfo? userInfo;
    userInfo = await Users.findUserByEmail(session, email);
    if (userInfo == null) {
      userInfo = UserInfo(
        userIdentifier: email,
        userName: name,
        email: email,
        blocked: false,
        created: DateTime.now().toUtc(),
        scopeNames: [],
      );
      userInfo = await Users.createUser(session, userInfo, 'email');
    } else {
      throw ServerSideException(
        message: 'User already exists',
      );
    }

    if (userInfo == null) {
      throw ServerSideException(
          message: 'Could not create user. Please try again');
    }

    var authToken = await UserAuthentication.signInUser(
      session,
      userInfo.id!,
      'email',
    );

    return AuthenticationResponse(
      success: true,
      keyId: authToken.id,
      key: authToken.key,
      userInfo: userInfo,
    );
  }
}
