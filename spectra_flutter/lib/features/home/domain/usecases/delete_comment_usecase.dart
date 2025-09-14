import 'package:fpdart/fpdart.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/home/home.dart';

class DeleteCommentUsecase implements UseCase<void, int> {
  DeleteCommentUsecase({
    required ArtworkRepository repository,
  }) : _repository = repository;

  final ArtworkRepository _repository;

  @override
  Future<Either<Failure, void>> call(int params) async {
    return await _repository.deleteComment(
      commentId: params,
    );
  }
}
