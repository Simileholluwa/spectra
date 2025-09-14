// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/auth/auth.dart';

class CreateAccountForm extends ConsumerWidget {
  const CreateAccountForm({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.watch(authProvider.notifier);
    final authState = ref.watch(authProvider);
    final validUsernameLoading = ref.watch(checkingValidUsernameProvider);
    final validUsername = ref.watch(validUsernameProvider);
    return Form(
      key: authState.createAccountFormKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: TSizes.defaultSpace,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 15,
              children: [
                AppTextField(
                  textController: authState.usernameController,
                  prefixIcon: Iconsax.user,
                  hintText: 'Username',
                  validator: (value) => TValidator.validateUsername(
                    value,
                    validUsernameLoading,
                    validUsername,
                  ),
                  onChanged: (value) {
                    authNotifier.setUsername(
                      value!.trim(),
                    );
                    if (value.trim().length >= 3 && value.trim().length <= 15) {
                      authNotifier.checkValidUsername(
                        value.trim(),
                      );
                    }
                  },
                  errorStyle: validUsernameLoading
                      ? Theme.of(context).textTheme.labelMedium!.copyWith(
                            color: TColors.primary,
                          )
                      : null,
                ),
                AppPasswordField(
                  textController: authState.passwordController,
                  validator: TValidator.validatePassword,
                  onChanged: (value) {
                    authNotifier.setNewAccountPassword(
                      authState.passwordController.text.trim(),
                    );
                  },
                ),
                const TermsAndConditions(),
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            SizedBox(
              height: 60,
              width: double.maxFinite,
              child: FilledButton(
                onPressed: validUsernameLoading
                    ? () {}
                    : () async {
                        final isValid = authState
                            .createAccountFormKey.currentState!
                            .validate();
                        if (!isValid) return;
                        final result =
                            await authNotifier.createAccountRequest();
                        if (result) {
                          context.push(
                            '/auth/createAccount/validateCreateAccount',
                          );
                        }
                      },
                child: const Text(
                  'Continue',
                ),
              ).withLoading(
                loading: ref.watch(
                  createAccountLoadingProvider,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
