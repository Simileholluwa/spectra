import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/auth/auth.dart';
import 'package:fpdart/fpdart.dart';

class CreateAccountRequestUseCase implements UseCase<bool, CreateAccountRequestParams> {
  CreateAccountRequestUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;
  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, bool>> call(CreateAccountRequestParams params) async {
    final result = await _authRepository.createAccountRequest(
      email: params.email,
      password: params.password,
      username: params.username,
    );
    return result;
  }
}

class CreateAccountRequestParams {
  CreateAccountRequestParams({
    required this.password,
    required this.email,
    required this.username,
  });
  final String password;
  final String email;
  final String username;
}
