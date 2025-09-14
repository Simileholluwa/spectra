import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/auth/auth.dart';
import 'package:fpdart/fpdart.dart';

class ValidateCreateAccountUseCase
    implements UseCase<User, ValidateCreateAccountParams> {
  ValidateCreateAccountUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;
  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, User>> call(
      ValidateCreateAccountParams params) async {
    final result = await _authRepository.validateCreateAccount(
      email: params.email,
      code: params.code,
      password: params.password,
      user: params.user,
    );
    return result;
  }
}

class ValidateCreateAccountParams {
  ValidateCreateAccountParams({
    required this.code,
    required this.email,
    required this.password,
    required this.user,
  });
  final String code;
  final String email;
  final String password;
  final User user;
}
