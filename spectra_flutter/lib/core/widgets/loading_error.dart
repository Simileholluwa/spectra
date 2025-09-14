import 'package:flutter/material.dart';
import 'package:spectra_flutter/core/core.dart';

class LoadingError extends StatelessWidget {
  const LoadingError({
    super.key,
    required this.errorMessage,
    required this.showRefresh,
    required this.onRefresh,
  });

  final String? errorMessage;
  final bool showRefresh;
  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 10,
      children: [
        Text(
          'OOPS!',
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).hintColor,
                fontSize: 30,
              ),
          textAlign: TextAlign.center,
        ),
        Text(
          errorMessage ??
              'Something went wrong while fetching the requested data. Please try again.',
          style: TextStyle(
            color: Theme.of(context).hintColor,
          ),
          textAlign: TextAlign.center,
        ),
        if (showRefresh)
          SizedBox(
            height: 1,
          ),
        if (showRefresh)
          SizedBox(
            width: 250,
            child: FilledButton(
              onPressed: onRefresh,
              child: Text(
                'Retry',
              ),
            ).withLoading(
              loading: false,
            ),
          ),
      ],
    );
  }
}
