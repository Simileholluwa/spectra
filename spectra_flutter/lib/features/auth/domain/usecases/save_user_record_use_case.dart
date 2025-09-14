import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/auth/auth.dart';
import 'package:fpdart/fpdart.dart';

class SaveUserUseCase implements UseCase<void, SaveUserParams> {
  SaveUserUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;
  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, void>> call(SaveUserParams params) async {
    final result = await _authRepository.saveUser(
      user: params.user,
    );
    return result;
  }
}

class SaveUserParams {
  SaveUserParams(
      this.user,
      );
  final User user;
}
