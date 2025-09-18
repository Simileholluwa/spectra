import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';

abstract class UserRemoteDatasource {
  Future<User> getUser({
    required String username,
  });

  Future<ArtworkList> getUserArtworks({
    required String username,
    required int limit,
    required int page,
    required String sortBy,
    required bool sortDescending,
  });

  Future<ArtworkList> getUserLikedArtworks({
    required String username,
    required int limit,
    required int page,
    required bool sortDescending,
  });

  Future<ArtworkList> getUserDownloadedArtworks({
    required String username,
    required int limit,
    required int page,
    required bool sortDescending,
  });
}

class UserRemoteDatasourceImpl implements UserRemoteDatasource {
  UserRemoteDatasourceImpl({
    required Client client,
  }) : _client = client;

  final Client _client;

  @override
  Future<User> getUser({
    required String username,
  }) async {
    try {
      final user = await _client.user.getUser(
        username,
      );
      if (user == null) {
        throw ServerSideException(
          message: 'User not found',
        );
      }
      return user;
    } on ServerSideException catch (e) {
      throw ServerException(
        message: e.message,
      );
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<ArtworkList> getUserArtworks({
    required String username,
    required int limit,
    required int page,
    required String sortBy,
    required bool sortDescending,
  }) async {
    try {
      final result = await _client.user.getUserArtworks(
        username,
        limit: limit,
        page: page,
        sortBy: sortBy,
        sortDescending: sortDescending,
      );
      return result;
    } on ServerSideException catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<ArtworkList> getUserLikedArtworks({
    required String username,
    required int limit,
    required int page,
    required bool sortDescending,
  }) async {
    try {
      final result = await _client.user.getUserLikedArtworks(
        username,
        limit: limit,
        page: page,
        sortDescending: sortDescending,
      );
      return result;
    } on ServerSideException catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<ArtworkList> getUserDownloadedArtworks({
    required String username,
    required int limit,
    required int page,
    required bool sortDescending,
  }) async {
    try {
      final result = await _client.user.getUserDownloadedArtworks(
        username,
        limit: limit,
        page: page,
        sortDescending: sortDescending,
      );
      return result;
    } on ServerSideException catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }
}
