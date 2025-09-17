import 'package:fpdart/fpdart.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/artwork/artwork.dart';

class ArtworkRepositoryImpl implements ArtworkRepository {
  ArtworkRepositoryImpl({
    required ArtworkRemoteDatasource remoteDatasource,
  }) : _remoteDatasource = remoteDatasource;

  final ArtworkRemoteDatasource _remoteDatasource;

  @override
  Future<Either<Failure, ArtworkList>> getArtworks({
    required int page,
    required int limit,
    required ArtworkFilter? filter,
    required String sortBy,
    required bool sortDescending,
  }) async {
    try {
      final response = await _remoteDatasource.getArtworks(
        filter: filter,
        page: page,
        limit: limit,
        sortBy: sortBy,
        sortDescending: sortDescending,
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ArtworkList>> getRelatedArtworks({
    required int artworkId,
    required List<String> tagNames,
    required List<String> modelNames,
    required int page,
    required int limit,
  }) async {
    try {
      final response = await _remoteDatasource.getRelatedArtworks(
        artworkId: artworkId,
        modelNames: modelNames,
        tagNames: tagNames,
        page: page,
        limit: limit,
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> toggleLike({
    required int artworkId,
  }) async {
    try {
      final response = await _remoteDatasource.toggleLike(
        artworkId: artworkId,
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> updateDownloadsCount({
    required int artworkId,
  }) async {
    try {
      final response = await _remoteDatasource.updateDownloadsCount(
        artworkId: artworkId,
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> updateViewsCount({
    required int artworkId,
  }) async {
    try {
      final response = await _remoteDatasource.updateViewsCount(
        artworkId: artworkId,
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, TagsList>> getTags({
    required int page,
    required int limit,
    required String sortBy,
    required bool sortDescending,
    required String query,
  }) async {
    try {
      final response = await _remoteDatasource.getTags(
        page: page,
        limit: limit,
        sortBy: sortBy,
        sortDescending: sortDescending,
        query: query,
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ModelsList>> getModels({
    required int page,
    required int limit,
    required String sortBy,
    required bool sortDescending,
    required String query,
  }) async {
    try {
      final response = await _remoteDatasource.getModels(
        page: page,
        limit: limit,
        sortBy: sortBy,
        sortDescending: sortDescending,
        query: query,
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ArtworkWithUserState>> getArtwork({
    required int artworkId,
  }) async {
    try {
      final response = await _remoteDatasource.getArtwork(
        artworkId: artworkId,
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ArtworkComment>> addComment({
    required ArtworkComment comment,
  }) async {
    try {
      final response = await _remoteDatasource.addComment(
        comment: comment,
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ArtworkCommentList>> getComments({
    required int artworkId,
    required int? parentId,
    required int page,
    required int limit,
    required String sortBy,
    required bool sortDescending,
  }) async {
    try {
      final response = await _remoteDatasource.getComments(
        artworkId: artworkId,
        parentId: parentId,
        page: page,
        limit: limit,
        sortBy: sortBy,
        sortDescending: sortDescending,
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> likeComment({
    required int commentId,
  }) async {
    try {
      final response = await _remoteDatasource.likeComment(
        commentId: commentId,
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ArtworkComment>> addReply({
    required ArtworkComment reply,
  }) async {
    try {
      final response = await _remoteDatasource.addReply(
        reply: reply,
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> deleteComment({
    required int commentId,
  }) async {
    try {
      final response = await _remoteDatasource.deleteComment(
        commentId: commentId,
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, ArtworkCommentWithUserState>> getComment({
    required int commentId,
  }) async {
    try {
      final response = await _remoteDatasource.getComment(
        commentId: commentId,
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }
}
