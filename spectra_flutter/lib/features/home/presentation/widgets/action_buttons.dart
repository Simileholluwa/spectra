// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:spectra_client/spectra_client.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    super.key,
    this.isLeft = false,
    this.isRight = false,
    this.iconSize = 24,
    required this.onTap,
    required this.icon,
    required this.isActive,
  });

  final bool isLeft;
  final bool isRight;
  final VoidCallback onTap;
  final IconData icon;
  final bool isActive;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 38,
        padding: const EdgeInsets.symmetric(horizontal: 3),
        decoration: BoxDecoration(
          color: isActive
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.only(
            topLeft: isLeft ? const Radius.circular(8) : Radius.zero,
            topRight: isRight ? const Radius.circular(8) : Radius.zero,
            bottomLeft: isLeft ? const Radius.circular(8) : Radius.zero,
            bottomRight: isRight ? const Radius.circular(8) : Radius.zero,
          ),
          border: Border.all(
            color: Theme.of(context).dividerColor,
            width: .5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Icon(
            icon,
            color: isActive
                ? Colors.white
                : Theme.of(context).colorScheme.onSurface,
            size: iconSize,
          ),
        ),
      ),
    );
  }
}
