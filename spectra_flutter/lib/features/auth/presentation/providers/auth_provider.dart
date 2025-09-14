// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'dart:async';

import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/auth/auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

Timer? _debounce;

@Riverpod(keepAlive: true)
class Auth extends _$Auth {
  @override
  AuthState build() {
    ref.watch(sessionProvider).addListener(() {});
    return AuthState.empty();
  }

  void setEmail(String email) {
    state = state.copyWith(email: email);
  }

  void addInterest(String interest) {
    state = state.copyWith(interests: [...state.interests, interest]);
  }

  void removeInterest(String interest) {
    state = state.copyWith(
      interests: state.interests.where((i) => i != interest).toList(),
    );
  }

  void clearInterests() {
    state = state.copyWith(interests: []);
  }

  void setPassword(String password) {
    state = state.copyWith(password: password);
  }

  void setNewAccountPassword(String password) {
    state = state.copyWith(newAccountPassword: password);
  }

  void setUsername(String username) {
    state = state.copyWith(username: username);
  }

  void setVerificationCode(String code) {
    state = state.copyWith(verificationCode: code);
  }

  void setResetPasswordEmail(String email) {
    state = state.copyWith(resetPasswordEmail: email);
  }

  void setPasswordResetCode(String code) {
    state = state.copyWith(passwordResetCode: code);
  }

  void setNewPassword(String password) {
    state = state.copyWith(newPassword: password);
  }

  void toggleAcceptTerms(bool value) {
    state = state.copyWith(acceptTerms: value);
  }

  Future<bool> logout() async {
    final logOutUseCase = ref.read(logOutProvider);
    final result = await logOutUseCase(
      NoParams(),
    );
    return result.fold((error) {
      TToastMessages.errorToast(error.message);
      return false;
    }, (r) {
      return true;
    });
  }

  Future<User?> signInWithEmailAndPassword() async {
    final signInUseCase = ref.read(userSignInProvider);
    ref.read(signInLoadingProvider.notifier).setValue(true);
    final result = await signInUseCase(
      UserSignInParams(
        state.email,
        state.password,
      ),
    );
    ref.read(signInLoadingProvider.notifier).setValue(false);
    return result.fold((error) {
      TToastMessages.errorToast(error.message);
      return null;
    }, (user) {
      return user;
    });
  }

  Future<void> checkValidUsername(String ussername) async {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () async {
      final checkUsernameUseCase = ref.read(checkValidUsernameProvider);
      ref.read(checkingValidUsernameProvider.notifier).setValue(true);
      final result = await checkUsernameUseCase(
        CheckValidUsernameParams(
          ussername,
        ),
      );
      ref.read(checkingValidUsernameProvider.notifier).setValue(false);
      result.fold((_) {
        ref.watch(validUsernameProvider.notifier).setValue(false);
        return;
      }, (r) {
        if (r) {
          ref.watch(validUsernameProvider.notifier).setValue(false);
          return;
        }
        ref.watch(validUsernameProvider.notifier).setValue(true);
        return;
      });
    });
  }

  Future<bool?> checkIfNewUser() async {
    final newUserUseCase = ref.read(checkIfNewUserProvider);
    ref.read(checkEmailLoadingProvider.notifier).setValue(true);
    final result = await newUserUseCase(
      CheckIfNewUserParams(
        state.email,
      ),
    );
    ref.read(checkEmailLoadingProvider.notifier).setValue(false);
    return result.fold((error) {
      TToastMessages.errorToast(error.message);
      return null;
    }, (username) {
      if (username != null) {
        setUsername(username);
        return false;
      } else {
        return true;
      }
    });
  }

  Future<bool> createAccountRequest() async {
    final createAccountRequest = ref.read(createAccountRequestProvider);
    if (!state.acceptTerms) {
      TToastMessages.errorToast(
        'Read and accept privacy policy and terms of use.',
      );
      return false;
    }
    ref.read(createAccountLoadingProvider.notifier).setValue(true);
    final result = await createAccountRequest(
      CreateAccountRequestParams(
        password: state.newAccountPassword,
        email: state.email,
        username: state.username,
      ),
    );
    ref.read(createAccountLoadingProvider.notifier).setValue(false);
    return result.fold((error) {
      TToastMessages.errorToast(error.message);
      return false;
    }, (r) {
      TToastMessages.successToast(
        'A verification code has been sent to your email.',
      );
      return true;
    });
  }

  Future<bool> validateCreateAccount() async {
    final validateAccount = ref.read(validateCreateAccountProvider);

    ref.read(validatCreateAccountLoadingProvider.notifier).setValue(true);
    final user = User(
      userId: 0,
      username: state.username,
      interests: state.interests,
    );
    final result = await validateAccount(
      ValidateCreateAccountParams(
        code: state.verificationCode,
        email: state.email,
        password: state.newAccountPassword,
        user: user,
      ),
    );
    ref.read(validatCreateAccountLoadingProvider.notifier).setValue(false);
    return result.fold((error) {
      TToastMessages.errorToast(error.message);
      return false;
    }, (r) {
      TToastMessages.successToast(
        'Great! Your account has been created.',
      );
      return true;
    });
  }

  Future<bool> initiatePasswordRequest() async {
    final initiatePasswordReset = ref.read(initiatePasswordResetProvider);
    ref.read(initiatePasswordResetLoadingProvider.notifier).setValue(true);
    final result = await initiatePasswordReset(
      InitiatePasswordResetParams(
        state.resetPasswordEmail,
      ),
    );
    ref.read(initiatePasswordResetLoadingProvider.notifier).setValue(false);
    return result.fold((error) {
      TToastMessages.errorToast(error.message);
      return false;
    }, (r) {
      TToastMessages.successToast(
        'Password reset code has been sent to your email',
      );
      return true;
    });
  }

  Future<void> resendPasswordResetCode({
    required String email,
  }) async {
    final initiatePasswordReset = ref.read(initiatePasswordResetProvider);
    ref
        .read(initiateResendPasswordResetLoadingProvider.notifier)
        .setValue(true);
    final result = await initiatePasswordReset(
      InitiatePasswordResetParams(
        email,
      ),
    );
    ref
        .read(initiateResendPasswordResetLoadingProvider.notifier)
        .setValue(false);
    result.fold((error) {
      TToastMessages.errorToast(error.message);
      ref.read(countdownTimerProvider.notifier).resetTimer();
      return;
    }, (r) {
      TToastMessages.successToast(
        'Password reset code has been sent to your email',
      );
      ref.read(countdownTimerProvider.notifier).startCountdown();
    });
  }

  Future<bool> resetPassword() async {
    final resetPasswordUseCase = ref.read(resetUserPasswordProvider);
    ref.read(resetPasswordLoadingProvider.notifier).setValue(true);
    final result = await resetPasswordUseCase(
      ResetUserPasswordParams(
        state.resetPasswordEmail,
        state.newPassword,
        state.passwordResetCode,
      ),
    );
    ref.read(resetPasswordLoadingProvider.notifier).setValue(false);
    return result.fold(
      (error) {
        TToastMessages.errorToast(error.message);
        return false;
      },
      (r) {
        return true;
      },
    );
  }
}
