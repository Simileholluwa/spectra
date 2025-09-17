import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/artwork/artwork.dart';

class MoreFilter extends ConsumerWidget {
  const MoreFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artworkState = ref.watch(
      artworkScreenNotifierProvider,
    );
    final artworkNotifier = ref.watch(
      artworkScreenNotifierProvider.notifier,
    );

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          spacing: 15,
          children: [
            AppDropdownButton(
              dropdownItems: mediaTypes.keys.toList(),
              value: mediaTypes.entries
                  .firstWhere(
                    (entry) => entry.value == artworkState.mediaType,
                  )
                  .key,
              onChanged: (value) {
                artworkNotifier.setMediaType(
                  mediaTypes[value],
                );
              },
              subtitle: 'Media type',
            ),
            AppDropdownButton(
              dropdownItems: downloadable.keys.toList(),
              value: downloadable.entries
                  .firstWhere(
                    (entry) => entry.value == artworkState.allowsDownload,
                  )
                  .key,
              onChanged: (value) {
                artworkNotifier.setAllowsDownload(
                  downloadable[value],
                );
              },
              subtitle: 'Download option',
            ),
            AppDropdownButton(
              dropdownItems: prompts.keys.toList(),
              value: prompts.entries
                  .firstWhere(
                    (entry) => entry.value == artworkState.hasPrompt,
                  )
                  .key,
              onChanged: (value) {
                artworkNotifier.setHasPrompt(
                  prompts[value],
                );
              },
              subtitle: 'Prompt option',
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(
                  12,
                ),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(
                children: [
                  ListTile(
                    onTap: () async {
                      final startDate = await pickDate(
                        context,
                        'Select start date',
                        DateTime.now(),
                        DateTime(2024),
                        DateTime.now(),
                      );
                      artworkNotifier.setStartDate(startDate);
                    },
                    contentPadding: EdgeInsets.zero,
                    title: RichText(
                      text: TextSpan(
                        text: 'From:',
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          TextSpan(
                              text: artworkState.startDate == null
                                  ? ' Select start date'
                                  : ' ${DateFormat('MMMM d, y - h:mm a').format(
                                      artworkState.startDate!,
                                    )}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                  )),
                        ],
                      ),
                    ),
                    trailing: GestureDetector(
                      onTap: artworkState.startDate == null
                          ? null
                          : () {
                              artworkNotifier.setStartDate(null);
                            },
                      child: Icon(
                        Iconsax.trash,
                        color: artworkState.startDate == null
                            ? Theme.of(context).disabledColor
                            : Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  Divider(
                    height: 0,
                    endIndent: 5,
                    thickness: .5,
                  ),
                  ListTile(
                    onTap: () async {
                      final endDate = await pickDate(
                        context,
                        'Select end date',
                        DateTime.now(),
                        DateTime(2024),
                        DateTime.now(),
                      );
                      artworkNotifier.setEndDate(endDate);
                    },
                    contentPadding: EdgeInsets.zero,
                    title: RichText(
                      text: TextSpan(
                        text: 'To:',
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          TextSpan(
                              text: artworkState.endDate == null
                                  ? ' Select end date'
                                  : ' ${DateFormat('MMMM d, y - h:mm a').format(
                                      artworkState.endDate!,
                                    )}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                  )),
                        ],
                      ),
                    ),
                    trailing: GestureDetector(
                      onTap: artworkState.endDate == null
                          ? null
                          : () {
                              artworkNotifier.setEndDate(null);
                            },
                      child: Icon(
                        Iconsax.trash,
                        color: artworkState.endDate == null
                            ? Theme.of(context).disabledColor
                            : Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
