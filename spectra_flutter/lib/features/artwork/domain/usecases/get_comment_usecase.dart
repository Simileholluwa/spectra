import 'package:fpdart/fpdart.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/artwork/artwork.dart';

class GetCommentUsecase implements UseCase<ArtworkCommentWithUserState, int> {
  GetCommentUsecase({
    required ArtworkRepository repository,
  }) : _repository = repository;

  final ArtworkRepository _repository;

  @override
  Future<Either<Failure, ArtworkCommentWithUserState>> call(int params) async {
    return await _repository.getComment(
      commentId: params,
    );
  }
}
