import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/auth/auth.dart';
import 'package:fpdart/fpdart.dart';

class CheckIfNewUserUseCase implements UseCase<String?, CheckIfNewUserParams> {
  CheckIfNewUserUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;
  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, String?>> call(CheckIfNewUserParams params) async {
    final result = await _authRepository.checkIfNewUser(
      email: params.email,
    );
    return result;
  }
}

class CheckIfNewUserParams {
  CheckIfNewUserParams(
      this.email,
      );
  final String email;
}
