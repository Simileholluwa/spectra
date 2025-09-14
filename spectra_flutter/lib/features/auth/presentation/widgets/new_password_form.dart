// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/auth/auth.dart';
import 'package:go_router/go_router.dart';

class NewPasswordForm extends ConsumerWidget {
  const NewPasswordForm({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.read(authProvider.notifier);
    final authState = ref.read(authProvider);
    return Form(
      key: authState.newPasswordFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: TSizes.spaceBtwSections,
        ),
        child: Column(
          children: [
            AppPasswordField(
              textController: authState.newAccountPasswordController,
              validator: TValidator.validatePassword,
              onChanged: (password) {
                authNotifier.setNewPassword(
                  authState.newAccountPasswordController.text.trim(),
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
                      authState.newPasswordFormKey.currentState!.validate();
                  if (!isValid) return;
                  final success = await authNotifier.resetPassword();
                  if (success) {
                    context.go('/auth');
                  }
                },
                child: const Text(
                  'Continue',
                ),
              ).withLoading(
                loading: ref.watch(resetPasswordLoadingProvider),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
