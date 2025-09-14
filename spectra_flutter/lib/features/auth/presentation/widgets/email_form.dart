// ignore_for_file: use_build_context_synchronously

import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class EmailForm extends ConsumerWidget {
  const EmailForm({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.watch(authProvider.notifier);
    final authState = ref.watch(authProvider);

    return Form(
      key: authState.emailFormKey,
      child: Padding(
        padding: const EdgeInsets.only(
          top: TSizes.defaultSpace,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextField(
              textController: authState.emailController,
              prefixIcon: Iconsax.message,
              hintText: 'your-email@domain.com',
              validator: TValidator.validateEmail,
              textInputType: TextInputType.emailAddress,
              maxLines: 1,
              onChanged: (value) {
                authNotifier.setEmail(
                  authState.emailController.text.toLowerCase(),
                );
              },
            ),
            const SizedBox(
              height: TSizes.defaultSpace,
            ),
            SizedBox(
              height: 60,
              child: FilledButton(
                onPressed: () async {
                  final isValid =
                      authState.emailFormKey.currentState!.validate();
                  if (!isValid) return;
                  final newUser = await authNotifier.checkIfNewUser();
                  if (newUser == null) return;
                  if (!newUser) {
                    context.push(
                      '/auth/login',
                    );
                  } else {
                    context.push(
                      '/auth/createAccount',
                    );
                  }
                },
                child: const Text(
                  'Continue',
                ),
              ).withLoading(
                loading: ref.watch(checkEmailLoadingProvider),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
