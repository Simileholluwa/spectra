// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/auth/auth.dart';

class ValidateCreateAccountForm extends ConsumerWidget {
  const ValidateCreateAccountForm({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authNotifier = ref.read(authProvider.notifier);
    final authState = ref.read(authProvider);
    return Form(
      key: authState.validateCreateAccountFormKey,
      child: Column(
        children: [
          Pinput(
            length: 6,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            controller: authState.verificationCodeController,
            validator: TValidator.validateOTP,
            obscureText: true,
            keyboardType: TextInputType.text,
            onChanged: (code) {
              authNotifier.setVerificationCode(
                authState.verificationCodeController.text.trim(),
              );
            },
            obscuringWidget: const Icon(
              Icons.circle,
              size: 15,
            ),
            errorTextStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.error,
                ),
            defaultPinTheme: PinTheme(
              width: 60,
              height: 60,
              textStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontWeight: FontWeight.w900,
                  ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.surface,
              ),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwSections,
          ),
          SizedBox(
            height: 60,
            child: FilledButton(
              onPressed: () async {
                final validated = await authNotifier.validateCreateAccount();
                if (validated) {
                  context.go(
                    '/home',
                  );
                }
              },
              child: const Text(
                'Continue',
              ),
            ).withLoading(
              loading: ref.watch(validatCreateAccountLoadingProvider),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          AppResendLink(
            onTap: () {
              authNotifier.createAccountRequest();
            },
          ),
        ],
      ),
    );
  }
}
