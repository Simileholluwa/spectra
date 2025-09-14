import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/auth/auth.dart';
import 'package:fpdart/fpdart.dart';

class UserSignInUseCase implements UseCase<User?, UserSignInParams> {
  UserSignInUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;
  final AuthRepository _authRepository;

  @override
  Future<Either<Failure, User?>> call(UserSignInParams params) async {
    final result = await _authRepository.signInWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
    return result;
  }
}

class UserSignInParams {
  UserSignInParams(
    this.email,
    this.password,
  );
  final String password;
  final String email;
}
