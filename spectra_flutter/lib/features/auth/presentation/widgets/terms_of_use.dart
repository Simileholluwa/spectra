import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TermsAndConditions extends ConsumerWidget {
  const TermsAndConditions({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authProvider);
    final authNotifier = ref.watch(authProvider.notifier);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4),
          child: SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(
              value: authState.acceptTerms,
              onChanged: (value) {
                authNotifier.toggleAcceptTerms(value!);
              },
            ),
          ),
        ),
        const SizedBox(
          width: TSizes.sm,
        ),
        Flexible(
          child: Text.rich(
            maxLines: 3,
            softWrap: true,
            TextSpan(
              children: [
                TextSpan(
                  text: 'I agree to ',
                ),
                TextSpan(
                  text: 'Privacy Policy',
                  style: TextStyle(
                    color: TColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: ' and ',
                ),
                TextSpan(
                  text: 'Terms of use.',
                  style: TextStyle(
                    color: TColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
