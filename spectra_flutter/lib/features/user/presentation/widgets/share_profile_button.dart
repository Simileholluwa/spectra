import 'package:flutter/material.dart';

class ShareProfileButton extends StatelessWidget {
  const ShareProfileButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(
            Theme.of(context).textTheme.bodyMedium!.color,
          ),
        ),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 4,
          ),
          child: Text(
            'Share profile',
            style: TextStyle(
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
