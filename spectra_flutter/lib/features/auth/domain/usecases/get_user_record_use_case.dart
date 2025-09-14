import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/auth/auth.dart';
import 'package:fpdart/fpdart.dart';

class GetUserUseCase implements NotFutureUseCase<User?, NoParams> {
  GetUserUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;
  final AuthRepository _authRepository;

  @override
  Either<Failure, User?> call(NoParams params) {
    final result = _authRepository.getUser();
    return result;
  }
}

