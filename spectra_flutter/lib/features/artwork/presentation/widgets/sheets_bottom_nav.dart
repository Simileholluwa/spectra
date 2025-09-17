import 'package:flutter/material.dart';

class SheetsBottomNav extends StatelessWidget {
  const SheetsBottomNav({
    super.key,
    required this.onClearPressed,
    required this.onApplyPressed,
  });

  final VoidCallback onClearPressed;
  final VoidCallback onApplyPressed;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Row(
      spacing: 15,
      children: [
        Expanded(
          child: SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: onClearPressed,
              child: Text(
                'Reset',
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: SizedBox(
            height: 50,
            child: FilledButton(
              onPressed: onApplyPressed,
              child: Text(
                'Apply Filter',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
