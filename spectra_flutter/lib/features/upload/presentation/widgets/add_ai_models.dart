import 'package:spectra_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spectra_flutter/features/upload/upload.dart';

Future<bool?> addAiModels({
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
                      'Models or Platforms',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    GestureDetector(
                      onTap: () {
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
                      'Give users more context about your artwork by inputting the models or platforms you used. Press enter to confirm your entry.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (state.models.isNotEmpty)
                      SingleChildScrollView(
                        padding: const EdgeInsets.only(right: 5, bottom: 16),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          spacing: 10,
                          children: state.models.map((item) {
                            return Chip(
                              label: Padding(
                                padding: const EdgeInsets.only(bottom: 4.0),
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              onDeleted: () {
                                notifier.removeModel(item);
                              },
                            );
                          }).toList(),
                        ),
                      ),
                    Form(
                      key: formKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: [
                          AppTextField(
                            textController: state.modelInputController,
                            prefixIcon: Iconsax.tag5,
                            textCapitalization: TextCapitalization.none,
                            textInputAction: TextInputAction.newline,
                            textInputType: TextInputType.multiline,
                            hintText: 'Enter AI model or platform name',
                            maxLines: null,
                            validator: (value) {
                              return null;
                            },
                            onChanged: (value) {
                              notifier.addModelOnTextChanged(value ?? '');
                            },
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
