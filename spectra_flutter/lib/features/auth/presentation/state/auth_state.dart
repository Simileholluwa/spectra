// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';

class AuthState {
  final String email;
  final String password;
  final String verificationCode;
  final String newPassword;
  final String passwordResetCode;
  final String newAccountPassword;
  final String resetPasswordEmail;
  final bool acceptTerms;
  final String username;
  final List<String> interests;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController verificationCodeController;
  final TextEditingController newPasswordController;
  final TextEditingController passwordResetCodeController;
  final TextEditingController newAccountPasswordController;
  final TextEditingController resetPasswordEmailController;
  final TextEditingController usernameController;
  final GlobalKey<FormState> emailFormKey;
  final GlobalKey<FormState> passwordFormKey;
  final GlobalKey<FormState> createAccountFormKey;
  final GlobalKey<FormState> validateCreateAccountFormKey;
  final GlobalKey<FormState> resetPasswordFormKey;
  final GlobalKey<FormState> passwordResetVerificationFormKey;
  final GlobalKey<FormState> newPasswordFormKey;
  

  AuthState({
    required this.email,
    required this.password,
    required this.verificationCode,
    required this.newPassword,
    required this.passwordResetCode,
    required this.newAccountPassword,
    required this.resetPasswordEmail,
    required this.acceptTerms,
    required this.username,
    required this.interests,
    required this.emailController,
    required this.passwordController,
    required this.verificationCodeController,
    required this.newPasswordController,
    required this.passwordResetCodeController,
    required this.newAccountPasswordController,
    required this.resetPasswordEmailController,
    required this.usernameController,
    required this.emailFormKey,
    required this.passwordFormKey,
    required this.createAccountFormKey,
    required this.validateCreateAccountFormKey,
    required this.resetPasswordFormKey,
    required this.passwordResetVerificationFormKey,
    required this.newPasswordFormKey,
  });

  AuthState copyWith({
    String? email,
    String? password,
    String? verificationCode,
    String? newPassword,
    String? passwordResetCode,
    String? newAccountPassword,
    String? resetPasswordEmail,
    bool? acceptTerms,
    String? username,
    List<String>? interests,
    TextEditingController? emailController,
    TextEditingController? passwordController,
    TextEditingController? verificationCodeController,
    TextEditingController? newPasswordController,
    TextEditingController? passwordResetCodeController,
    TextEditingController? newAccountPasswordController,
    TextEditingController? resetPasswordEmailController,
    TextEditingController? usernameController,
    GlobalKey<FormState>? emailFormKey,
    GlobalKey<FormState>? passwordFormKey,
    GlobalKey<FormState>? createAccountFormKey,
    GlobalKey<FormState>? validateCreateAccountFormKey,
    GlobalKey<FormState>? resetPasswordFormKey,
    GlobalKey<FormState>? passwordResetVerificationFormKey,
    GlobalKey<FormState>? newPasswordFormKey,
  }) {
    return AuthState(
      email: email ?? this.email,
      password: password ?? this.password,
      verificationCode: verificationCode ?? this.verificationCode,
      newPassword: newPassword ?? this.newPassword,
      passwordResetCode: passwordResetCode ?? this.passwordResetCode,
      newAccountPassword: newAccountPassword ?? this.newAccountPassword,
      resetPasswordEmail: resetPasswordEmail ?? this.resetPasswordEmail,
      acceptTerms: acceptTerms ?? this.acceptTerms,
      username: username ?? this.username,
      interests: interests ?? this.interests,
      emailController: emailController ?? this.emailController,
      passwordController: passwordController ?? this.passwordController,
      verificationCodeController: verificationCodeController ?? this.verificationCodeController,
      newPasswordController: newPasswordController ?? this.newPasswordController,
      passwordResetCodeController: passwordResetCodeController ?? this.passwordResetCodeController,
      newAccountPasswordController: newAccountPasswordController ?? this.newAccountPasswordController,
      resetPasswordEmailController: resetPasswordEmailController ?? this.resetPasswordEmailController,
      usernameController: usernameController ?? this.usernameController,
      emailFormKey: emailFormKey ?? this.emailFormKey,
      passwordFormKey: passwordFormKey ?? this.passwordFormKey,
      createAccountFormKey: createAccountFormKey ?? this.createAccountFormKey,
      validateCreateAccountFormKey: validateCreateAccountFormKey ?? this.validateCreateAccountFormKey,
      resetPasswordFormKey: resetPasswordFormKey ?? this.resetPasswordFormKey,
      passwordResetVerificationFormKey: passwordResetVerificationFormKey ?? this.passwordResetVerificationFormKey,
      newPasswordFormKey: newPasswordFormKey ?? this.newPasswordFormKey,
    );
  }

  factory AuthState.empty() {
    return AuthState(
      email: '',
      password: '',
      verificationCode: '',
      newPassword: '',
      passwordResetCode: '',
      newAccountPassword: '',
      resetPasswordEmail: '',
      acceptTerms: false,
      username: '',
      interests: [],
      emailController: TextEditingController(),
      passwordController: TextEditingController(),
      verificationCodeController: TextEditingController(),
      newPasswordController: TextEditingController(),
      passwordResetCodeController: TextEditingController(),
      newAccountPasswordController: TextEditingController(),
      resetPasswordEmailController: TextEditingController(),
      usernameController: TextEditingController(),
      emailFormKey: GlobalKey<FormState>(),
      passwordFormKey: GlobalKey<FormState>(),
      createAccountFormKey: GlobalKey<FormState>(),
      validateCreateAccountFormKey: GlobalKey<FormState>(),
      resetPasswordFormKey: GlobalKey<FormState>(),
      passwordResetVerificationFormKey: GlobalKey<FormState>(),
      newPasswordFormKey: GlobalKey<FormState>(),
    );
  }
}
