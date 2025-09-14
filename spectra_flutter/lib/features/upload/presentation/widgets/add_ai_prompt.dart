import 'package:spectra_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spectra_flutter/features/upload/upload.dart';

Future<bool?> addAIPrompt({
  required BuildContext context,
}) {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      final formKey = GlobalKey<FormState>();
      return Consumer(
        builder: (context, ref, _) {
          final state = ref.watch(uploadProvider);
          final notifier = ref.watch(uploadProvider.notifier);
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 8,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Add AI Prompt',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    GestureDetector(
                      onTap: () {
                        notifier.setPrompt(
                          state.promptController.text.trim(),
                        );
                        context.pop();
                      },
                      child: Text(
                        'Done',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: TColors.primary,
                            ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                const Divider(
                  height: 0,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: TSizes.sm,
                    ),
                    Text(
                      'Type or paste the prompt used to generate your artwork.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Form(
                      key: formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: [
                          AppTextField(
                            textController: state.promptController,
                            textCapitalization: TextCapitalization.sentences,
                            hintText: 'Enter or paste your AI prompt',
                            validator: (value) {
                              return null;
                            },
                            textInputAction: TextInputAction.newline,
                            textInputType: TextInputType.multiline,
                            showPrefixIcon: false,
                            maxLines: 7,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
