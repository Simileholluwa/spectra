import 'package:fpdart/fpdart.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/user/user.dart';

class ToggleFollowUsecase implements UseCase<void, String> {
  ToggleFollowUsecase({
    required UserRepository repository,
  }) : _repository = repository;

  final UserRepository _repository;

  @override
  Future<Either<Failure, void>> call(
    String params,
  ) async {
    return _repository.toggleFollow(
      username: params,
    );
  }
}
