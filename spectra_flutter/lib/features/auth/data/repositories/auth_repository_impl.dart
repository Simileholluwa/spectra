import 'dart:async';
import 'dart:io';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/auth/auth.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required AuthRemoteDatabaseImpl remoteDatabase,
    required AuthLocalDatasourceImpl localDatabase,
  })  : _remoteDatabase = remoteDatabase,
        _localDatabase = localDatabase;
  final AuthRemoteDatabaseImpl _remoteDatabase;
  final AuthLocalDatasourceImpl _localDatabase;

  @override
  Future<Either<Failure, String?>> checkIfNewUser({
    required String email,
  }) async {
    try {
      final result = await _remoteDatabase.checkIfNewUser(email: email);
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> resetUserPassword({
    required String email,
    required String verificationCode,
    required String newPassword,
  }) async {
    try {
      final result = await _remoteDatabase.resetUserPassword(
        email: email,
        verificationCode: verificationCode,
        newPassword: newPassword,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, User?>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _remoteDatabase.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> createAccountRequest({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      final result = await _remoteDatabase.createAccountRequest(
        email: email,
        password: password,
        username: username,
      );
      return Right(result);
    } on SocketException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, User>> validateCreateAccount({
    required String email,
    required String code,
    required String password,
    required User user,
  }) async {
    try {
      final result = await _remoteDatabase.validateCreateAccount(
        email: email,
        code: code,
        password: password,
        user: user,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      final result = await _remoteDatabase.logout();
      return Right(result);
    } catch (e) {
      return Left(
        Failure(
          message: e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> uploadProfileImage({
    required String imagePath,
  }) async {
    try {
      final result = await _remoteDatabase.uploadProfileImage(
        imagePath: imagePath,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> initiatePasswordReset({
    required String email,
  }) async {
    try {
      final result = await _remoteDatabase.initiatePasswordReset(
        email: email,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Either<Failure, User> getUser() {
    try {
      final result = _localDatabase.getUser();
      return Right(result!);
    } on CacheException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> saveUser(
      {required User user}) async {
    try {
      final result = await _localDatabase.saveUser(
        user: user,
      );
      return Right(result);
    } on CacheException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }
  
  @override
  Future<Either<Failure, bool>> checkValidUsername({required String username}) async {
    try {
      final result = await _remoteDatabase.checkValidUsername(
        username: username,
      );
      return Right(result);
    } on CacheException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }
}
