import 'package:fpdart/fpdart.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/artwork/artwork.dart';

class LikeCommentUsecase implements UseCase<void, int> {
  LikeCommentUsecase({
    required ArtworkRepository repository,
  }) : _repository = repository;

  final ArtworkRepository _repository;

  @override
  Future<Either<Failure, void>> call(int params) async {
    return await _repository.likeComment(
      commentId: params,
    );
  }
}
