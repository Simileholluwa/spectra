import 'package:fpdart/fpdart.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/home/home.dart';

class AddReplyUsecase implements UseCase<ArtworkComment, ArtworkComment> {
  AddReplyUsecase({
    required ArtworkRepository repository,
  }) : _repository = repository;

  final ArtworkRepository _repository;

  @override
  Future<Either<Failure, ArtworkComment>> call(ArtworkComment params) async {
    return await _repository.addReply(
      reply: params,
    );
  }
}
