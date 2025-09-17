import 'package:flutter/material.dart';
import 'package:spectra_client/spectra_client.dart';

class PromptWidget extends StatelessWidget {
  const PromptWidget({
    super.key,
    required this.artwork,
  });

  final Artwork artwork;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        const Text(
          'Prompt',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SelectableText(
          artwork.prompt!,
        ),
      ],
    );
  }
}
