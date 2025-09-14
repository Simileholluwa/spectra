//ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/auth/auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
part 'auth_services_provider.g.dart';

@riverpod
AuthLocalDatasourceImpl authLocalDatasource(Ref ref) {
  return AuthLocalDatasourceImpl(
    prefs: ref.read(localStorageProvider),
  );
}

@riverpod
AuthRemoteDatabaseImpl authRemoteDatabase(Ref ref) {
  return AuthRemoteDatabaseImpl(
    client: ref.read(clientProvider),
    sessionManager: ref.read(sessionProvider),
    auth: ref.read(authEmailProvider),
    localDatabase: ref.read(authLocalDatasourceProvider),
  );
}

@riverpod
AuthRepositoryImpl authRepository(Ref ref) {
  return AuthRepositoryImpl(
    remoteDatabase: ref.read(
      authRemoteDatabaseProvider,
    ), 
    localDatabase: ref.read(authLocalDatasourceProvider),
  );
}

@riverpod
CreateAccountRequestUseCase createAccountRequest(Ref ref) {
  return CreateAccountRequestUseCase(
    authRepository: ref.read(authRepositoryProvider),
  );
}

@riverpod
UserSignInUseCase userSignIn(Ref ref) {
  return UserSignInUseCase(
    authRepository: ref.read(authRepositoryProvider),
  );
}

@riverpod
InitiatePasswordResetUseCase initiatePasswordReset(
    Ref ref) {
  return InitiatePasswordResetUseCase(
    authRepository: ref.read(authRepositoryProvider),
  );
}

@riverpod
CheckIfNewUserUseCase checkIfNewUser(Ref ref) {
  return CheckIfNewUserUseCase(
    authRepository: ref.read(authRepositoryProvider),
  );
}

@riverpod
LogoutUseCase logOut(Ref ref) {
  return LogoutUseCase(
    authRepository: ref.read(authRepositoryProvider),
  );
}

@riverpod
ValidateCreateAccountUseCase validateCreateAccount(
    Ref ref) {
  return ValidateCreateAccountUseCase(
    authRepository: ref.read(authRepositoryProvider),
  );
}

@riverpod
UploadProfileImageUseCase uploadProfileImage(Ref ref) {
  return UploadProfileImageUseCase(
    authRepository: ref.read(authRepositoryProvider),
  );
}

@riverpod
ResetUserPasswordUseCase resetUserPassword(Ref ref) {
  return ResetUserPasswordUseCase(
    authRepository: ref.read(authRepositoryProvider),
  );
}

@riverpod
SaveUserUseCase saveUserRecord(Ref ref) {
  return SaveUserUseCase(
    authRepository: ref.read(authRepositoryProvider),
  );
}

@riverpod
GetUserUseCase getUserRecord(Ref ref) {
  return GetUserUseCase(
    authRepository: ref.read(authRepositoryProvider),
  );
}

@riverpod
CheckValidUsernameUseCase checkValidUsername(Ref ref) {
  return CheckValidUsernameUseCase(
    authRepository: ref.read(authRepositoryProvider),
  );
}
