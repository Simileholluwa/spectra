import 'package:fpdart/fpdart.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/user/user.dart';

class GetUserUsecase implements UseCase<User, String> {
  GetUserUsecase({
    required UserRepository repository,
  }) : _repository = repository;

  final UserRepository _repository;

  @override
  Future<Either<Failure, User>> call(
    String params,
  ) async {
    return _repository.getUser(
      username: params,
    );
  }
}
