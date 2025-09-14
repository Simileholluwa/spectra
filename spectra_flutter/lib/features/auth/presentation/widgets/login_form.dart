// ignore_for_file: use_build_context_synchronously
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends ConsumerWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.watch(authProvider.notifier);
    final authState = ref.read(authProvider);
    return Form(
      key: authState.passwordFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: TSizes.spaceBtwSections,
        ),
        child: Column(
          children: [
            AppPasswordField(
              textController: authState.passwordController,
              validator: (value) => TValidator.validateEmptyText(
                'Password',
                value,
              ),
              hintText: 'Enter your password',
              onChanged: (value) => authNotifier.setPassword(
                authState.passwordController.text.trim(),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwInputFields,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    context.push(
                      '/auth/forgotPassword',
                    );
                  },
                  child: Text(
                    'Forgot password?',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: TColors.primary,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            SizedBox(
              height: 60,
              child: FilledButton(
                onPressed: () async {
                  final isValid =
                      authState.passwordFormKey.currentState!.validate();
                  if (!isValid) return;
                  final user = await authNotifier.signInWithEmailAndPassword();
                  if (user != null) {
                    context.go('/home');
                    ref.invalidate(authProvider);
                  } else {
                    return;
                  }
                },
                child: const Text(
                  'Sign in',
                ),
              ).withLoading(
                loading: ref.watch(signInLoadingProvider),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
