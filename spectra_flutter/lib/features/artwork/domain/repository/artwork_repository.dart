import 'package:fpdart/fpdart.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';

abstract class ArtworkRepository {
  Future<Either<Failure, ArtworkList>> getArtworks({
    required int page,
    required int limit,
    required ArtworkFilter? filter,
    required String sortBy,
    required bool sortDescending,
  });
  Future<Either<Failure, ArtworkList>> getRelatedArtworks({
    required int artworkId,
    required List<String> tagNames,
    required List<String> modelNames,
    required int page,
    required int limit,
  });
  Future<Either<Failure, void>> updateDownloadsCount({
    required int artworkId,
  });
  Future<Either<Failure, void>> updateViewsCount({
    required int artworkId,
  });
  Future<Either<Failure, void>> toggleLike({
    required int artworkId,
  });
  Future<Either<Failure, TagsList>> getTags({
    required int page,
    required int limit,
    required String sortBy,
    required bool sortDescending,
    required String query,
  });
  Future<Either<Failure, ModelsList>> getModels({
    required int page,
    required int limit,
    required String sortBy,
    required bool sortDescending,
    required String query,
  });
  Future<Either<Failure, ArtworkWithUserState>> getArtwork({
    required int artworkId,
  });
  Future<Either<Failure, ArtworkComment>> addComment({
    required ArtworkComment comment,
  });
  Future<Either<Failure, ArtworkCommentList>> getComments({
    required int artworkId,
    required int? parentId,
    required int page,
    required int limit,
    required String sortBy,
    required bool sortDescending,
  });
  Future<Either<Failure, void>> likeComment({
    required int commentId,
  });
  Future<Either<Failure, ArtworkComment>> addReply({
    required ArtworkComment reply,
  });
  Future<Either<Failure, void>> deleteComment({
    required int commentId,
  });
  Future<Either<Failure, ArtworkCommentWithUserState>> getComment({
    required int commentId,
  });
}
