import 'package:spectra_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spectra_flutter/features/upload/upload.dart';

Future<bool?> addTags({
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
                      'Add tags',
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
                      'Tags makes it easy to find and categorize your art. Simply type a comma to confirm your tag entry.',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if (state.tags.isNotEmpty)
                      SingleChildScrollView(
                        padding: const EdgeInsets.only(right: 5, bottom: 16),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          spacing: 10,
                          children: state.tags.map((item) {
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
                                notifier.removeTag(item);
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
                            textController: state.tagInputController,
                            prefixIcon: Iconsax.tag5,
                            textCapitalization: TextCapitalization.none,
                            hintText: 'Enter tag name',
                            maxLines: null,
                            validator: (value) {
                              return null;
                            },
                            textInputAction: TextInputAction.newline,
                            textInputType: TextInputType.multiline,
                            onChanged: (value) {
                              notifier.addTagOnTextChanged(value ?? '');
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
