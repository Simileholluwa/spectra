import 'package:fpdart/fpdart.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';

abstract class AuthRepository {
  Future<Either<Failure, bool>> createAccountRequest({
    required String email,
    required String password,
    required String username,
  });

  Future<Either<Failure, User>> validateCreateAccount({
    required String email,
    required String code,
    required String password,
    required User user,
  });

  Future<Either<Failure, User?>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, bool>> resetUserPassword({
    required String email,
    required String verificationCode,
    required String newPassword,
  });

  Future<Either<Failure, bool>> initiatePasswordReset({
    required String email,
  });

  Future<Either<Failure, String?>> checkIfNewUser({
    required String email,
  });

  Future<Either<Failure, bool>> uploadProfileImage({
    required String imagePath,
  });

  Future<Either<Failure, void>> logout();

  Future<Either<Failure, void>> saveUser({
    required User user,
  });

  Either<Failure, User> getUser();

  Future<Either<Failure, bool>> checkValidUsername({
    required String username,
  });
}
