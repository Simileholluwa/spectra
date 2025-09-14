import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/auth/auth.dart';
import 'package:fpdart/fpdart.dart';

class CheckValidUsernameUseCase implements UseCase<bool, CheckValidUsernameParams> {
  CheckValidUsernameUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;
  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, bool>> call(CheckValidUsernameParams params) async {
    final result = await _authRepository.checkValidUsername(
      username: params.username,
    );
    return result;
  }
}

class CheckValidUsernameParams {
  CheckValidUsernameParams(
      this.username,
      );
  final String username;
}
