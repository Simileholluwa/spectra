import 'package:fpdart/fpdart.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/user/user.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({
    required UserRemoteDatasource remoteDatasource,
  }) : _remoteDatasource = remoteDatasource;

  final UserRemoteDatasource _remoteDatasource;

  @override
  Future<Either<Failure, UserWithState>> getUser({
    required String username,
  }) async {
    try {
      final result = await _remoteDatasource.getUser(
        username: username,
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
  Future<Either<Failure, void>> toggleFollow({
    required String username,
  }) async {
    try {
      final result = await _remoteDatasource.toggleFollow(
        username: username,
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
  Future<Either<Failure, ArtworkList>> getUserArtworks({
    required String username,
    required int limit,
    required int page,
    required String sortBy,
    required bool sortDescending,
  }) async {
    try {
      final result = await _remoteDatasource.getUserArtworks(
        username: username,
        limit: limit,
        page: page,
        sortBy: sortBy,
        sortDescending: sortDescending,
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
  Future<Either<Failure, ArtworkList>> getUserLikedArtworks({
    required String username,
    required int limit,
    required int page,
    required bool sortDescending,
  }) async {
    try {
      final result = await _remoteDatasource.getUserLikedArtworks(
        username: username,
        limit: limit,
        page: page,
        sortDescending: sortDescending,
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
  Future<Either<Failure, ArtworkList>> getUserDownloadedArtworks({
    required String username,
    required int limit,
    required int page,
    required bool sortDescending,
  }) async {
    try {
      final result = await _remoteDatasource.getUserDownloadedArtworks(
        username: username,
        limit: limit,
        page: page,
        sortDescending: sortDescending,
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
}
