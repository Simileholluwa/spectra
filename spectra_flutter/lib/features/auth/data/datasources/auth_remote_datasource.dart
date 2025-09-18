import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/auth/auth.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';

abstract interface class AuthRemoteDatabase {
  Future<bool> createAccountRequest({
    required String email,
    required String password,
    required String username,
  });

  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> resetUserPassword({
    required String email,
    required String verificationCode,
    required String newPassword,
  });

  Future<User> validateCreateAccount({
    required String email,
    required String code,
    required String password,
    required User user,
  });

  Future<bool> checkValidUsername({
    required String username,
  });

  Future<bool> initiatePasswordReset({
    required String email,
  });

  Future<String?> checkIfNewUser({
    required String email,
  });

  Future<void> logout();

  Future<bool> uploadProfileImage({
    required String imagePath,
  });
}

class AuthRemoteDatabaseImpl implements AuthRemoteDatabase {
  AuthRemoteDatabaseImpl({
    required Client client,
    required SessionManager sessionManager,
    required EmailAuthController auth,
    required AuthLocalDatasource localDatabase,
  })  : _client = client,
        _auth = auth,
        _sessionManager = sessionManager,
        _localDatabase = localDatabase;

  final Client _client;
  final SessionManager _sessionManager;
  final EmailAuthController _auth;
  final AuthLocalDatasource _localDatabase;

  @override
  Future<String?> checkIfNewUser({required String email}) async {
    try {
      final result = await _client.user.checkIfNewUser(
        email,
      );

      if (result == null) {
        return null;
      }
      return result;
    } on SocketException catch (_) {
      throw const ServerException(
          message: 'Failed to connect to server. Please try again.');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<bool> resetUserPassword({
    required String email,
    required String verificationCode,
    required String newPassword,
  }) async {
    try {
      final result = await _auth.resetPassword(
        email,
        verificationCode,
        newPassword,
      );
      if (!result) {
        throw const ServerException(
          message: 'Incorrect verification code.',
        );
      }
      return result;
    } on TimeoutException catch (_) {
      throw const ServerException(message: 'Request timed out.');
    } on SocketException catch (_) {
      throw const ServerException(
          message: 'Failed to connect to server. Please try again.');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _client.modules.auth.email.authenticate(
        email,
        password,
      );
      if (!result.success && result.failReason != null) {
        final failReason = result.failReason!.index;
        switch (failReason) {
          case 0:
            throw const ServerException(
              message: 'Your password is incorrect.',
            );
          case 1:
            throw const ServerException(
              message: 'Unable to create user',
            );
          case 2:
            throw const ServerException(
              message: 'Internal server error',
            );
          case 3:
            throw const ServerException(
              message: 'Too many failed attempts.',
            );
          case 4:
            throw const ServerException(
              message: 'Your account has been blocked',
            );
          default:
            throw const ServerException(
              message: 'Something went wrong.',
            );
        }
      }

      if (result.userInfo == null) {
        throw const ServerException(message: 'No user found.');
      }

      if (result.key == null || result.keyId == null) {
        throw const ServerException(
            message: 'Authententication keys not found');
      }

      await _sessionManager.registerSignedInUser(
        result.userInfo!,
        result.keyId!,
        result.key!,
      );

      await _sessionManager.refreshSession();

      final user = await _client.user.getUser(result.userInfo!.userName!);
      if (user == null) {
        throw const ServerException(
          message: 'User record not found',
        );
      }
      await _localDatabase.saveUser(
        user: user,
      );
      return user;
    } on TimeoutException catch (_) {
      throw const ServerException(message: 'Request timed out.');
    } on SocketException catch (_) {
      throw const ServerException(
          message: 'Failed to connect to server. Please try again.');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<bool> createAccountRequest({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      log('$username, $email, $password');
      final result = await _auth.createAccountRequest(
        username,
        email,
        password,
      );

      if (!result) {
        throw const ServerException(
          message: 'Failed to create account. Please try again.',
        );
      }
      return result;
    } on SocketException catch (_) {
      throw const ServerException(
          message: 'Failed to connect to server. Please try again.');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<User> validateCreateAccount({
    required String email,
    required String code,
    required String password,
    required User user,
  }) async {
    try {
      final result = await _auth.validateAccount(
        email,
        code,
      );
      if (result == null) {
        throw const ServerException(
          message: 'Incorrect verification code',
        );
      }

      final newRecord = user.copyWith(
        userId: result.id!,
        email: email,
      );

      final savedRecord = await _client.user.saveUser(newRecord);
      await _localDatabase.saveUser(
        user: savedRecord,
      );

      final signedInUser = await signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (signedInUser == null) {
        throw const ServerException(
          message: 'Failed to sign in user',
        );
      }

      return signedInUser;
    } on TimeoutException catch (_) {
      throw const ServerException(message: 'Request timed out.');
    } on SocketException catch (_) {
      throw const ServerException(
          message: 'Failed to connect to server. Please try again.');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<void> logout() async {
    try {
      final result = await _sessionManager.signOutDevice();
      await _sessionManager.refreshSession();
      if (!result) {
        throw const ServerException(
          message: 'Failed to sign out',
        );
      }
      await _localDatabase.removeUser();
    } on SocketException catch (_) {
      throw const ServerException(
          message: 'Failed to connect to server. Please try again.');
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<bool> uploadProfileImage({required String imagePath}) async {
    try {
      final file = File(imagePath);
      final List<int> fileBytes = await file.readAsBytes();
      final byteData = ByteData.view(Uint8List.fromList(fileBytes).buffer);
      final result = await _sessionManager.uploadUserImage(byteData);
      if (!result) {
        throw const ServerException(
          message: 'Failed to upload image',
        );
      }
      return result;
    } on TimeoutException catch (_) {
      throw const ServerException(message: 'Request timed out.');
    } on SocketException catch (_) {
      throw const ServerException(
          message: 'Failed to connect to server. Please try again.');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<bool> initiatePasswordReset({
    required String email,
  }) async {
    try {
      final result = await _auth.initiatePasswordReset(
        email,
      );
      if (!result) {
        throw const ServerException(
          message: 'Failed to send validation code',
        );
      }

      return result;
    } on SocketException catch (_) {
      throw const ServerException(
          message: 'Failed to connect to server. Please try again.');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<bool> checkValidUsername({required String username}) async {
    try {
      final result = await _client.user.checkValidUsername(
        username,
      );

      return result;
    } on SocketException catch (_) {
      throw const ServerException(
          message: 'Failed to connect to server. Please try again.');
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }
}
