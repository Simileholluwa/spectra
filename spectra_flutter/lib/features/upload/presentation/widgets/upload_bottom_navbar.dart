import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/upload/upload.dart';

class UploadBottomNavbar extends ConsumerWidget {
  const UploadBottomNavbar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(uploadProvider);
    final notifier = ref.watch(uploadProvider.notifier);
    return Container(
      padding: const EdgeInsets.fromLTRB(
        15,
        10,
        15,
        5,
      ),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Theme.of(context).dividerColor,
            width: .5,
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 10,
        children: [
          GestureDetector(
            onTap: () {
              notifier.toggleAgreement();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 10,
              children: [
                SizedBox(
                  height: 24,
                  width: 24,
                  child: Checkbox(
                    value: state.isAgreementChecked,
                    onChanged: (value) {
                      notifier.toggleAgreement();
                    },
                  ),
                ),
                Flexible(
                  child: Text.rich(
                    TextSpan(
                      text: "I confirm that the attached media is ",
                      style: Theme.of(context).textTheme.labelMedium,
                      children: [
                        TextSpan(
                          text: "AI Generated",
                          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: ". My account may be suspended if this is not true.",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          FilledButton(
            onPressed: state.isAgreementChecked ? () {
              notifier.saveArtwork();
              context.pop();
            } : null,
            child: const Text(
              "Upload",
            ),
          ).withLoading(
            loading: state.isLoading,
          ),
        ],
      ),
    );
  }
}
