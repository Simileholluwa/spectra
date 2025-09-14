// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/auth/auth.dart';

class ResetPasswordForm extends ConsumerWidget {
  const ResetPasswordForm({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.read(authProvider.notifier);
    final authState = ref.read(authProvider);
    return Form(
      key: authState.resetPasswordFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: TSizes.spaceBtwSections,
        ),
        child: Column(
          children: [
            AppTextField(
              textController: authState.resetPasswordEmailController,
              prefixIcon: Iconsax.message,
              hintText: 'your-email@domain.com',
              validator: TValidator.validateEmail,
              textInputType: TextInputType.emailAddress,
              onChanged: (email) {
                authNotifier.setResetPasswordEmail(
                  authState.resetPasswordEmailController.text.trim(),
                );
              },
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            SizedBox(
              height: 60,
              child: FilledButton(
                onPressed: () async {
                  final isValid =
                      authState.resetPasswordFormKey.currentState!.validate();
                  if (!isValid) return;
                  final initiated =
                      await authNotifier.initiatePasswordRequest();
                  if (initiated) {
                    context.push(
                      '/auth/forgotPassword/verifyPasswordReset',
                    );
                  }
                },
                child: const Text(
                  'Continue',
                ),
              ).withLoading(
                loading: ref.watch(initiatePasswordResetLoadingProvider),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
