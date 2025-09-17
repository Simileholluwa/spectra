import 'package:fpdart/fpdart.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/artwork/artwork.dart';

class ArtworkCommentUsecase
    implements UseCase<ArtworkComment, ArtworkCommentParams> {
  ArtworkCommentUsecase({required ArtworkRepository artworkRepository})
      : _artworkRepository = artworkRepository;
  final ArtworkRepository _artworkRepository;

  @override
  Future<Either<Failure, ArtworkComment>> call(
      ArtworkCommentParams params) async {
    final result = await _artworkRepository.addComment(
      comment: params.comment,
    );
    return result;
  }
}

class ArtworkCommentParams {
  ArtworkCommentParams(
    this.comment,
  );
  final ArtworkComment comment;
}
