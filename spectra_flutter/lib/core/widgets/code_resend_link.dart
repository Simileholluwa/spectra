import 'package:spectra_flutter/features/auth/auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class AppResendLink extends ConsumerWidget {
  const AppResendLink({
    required this.onTap,
    super.key,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final countdownState = ref.watch(countdownTimerProvider);

    String formatTime(int seconds) {
      final minutes = (seconds ~/ 60).toString().padLeft(2, '0');
      final remainingSeconds = (seconds % 60).toString().padLeft(2, '0');
      return '$minutes:$remainingSeconds';
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Text(
            "Didn't receive code?",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).hintColor,
                ),
          ),
        ),
        const SizedBox(
          width: TSizes.xs,
        ),
        ref.watch(initiateResendPasswordResetLoadingProvider)
            ? LoadingAnimationWidget.discreteCircle(
                color: TColors.primary,
                size: 12,
              )
            : GestureDetector(
                onTap: countdownState.isCountingDown ? null : onTap,
                child: Text(
                  countdownState.isCountingDown
                      ? 'Retry in ${formatTime(countdownState.secondsRemaining)}'
                      : 'Resend',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: countdownState.isCountingDown
                            ? Theme.of(context).disabledColor
                            : TColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
      ],
    );
  }
}
