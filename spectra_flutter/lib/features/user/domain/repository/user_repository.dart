import 'package:fpdart/fpdart.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> getUser({
    required String username,
  });

  Future<Either<Failure, ArtworkList>> getUserArtworks({
    required String username,
    required int limit,
    required int page,
    required String sortBy,
    required bool sortDescending,
  });

  Future<Either<Failure, ArtworkList>> getUserLikedArtworks({
    required String username,
    required int limit,
    required int page,
    required bool sortDescending,
  });

  Future<Either<Failure, ArtworkList>> getUserDownloadedArtworks({
    required String username,
    required int limit,
    required int page,
    required bool sortDescending,
  });
}
