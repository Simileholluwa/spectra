import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/home/home.dart';

class MoreFilter extends ConsumerWidget {
  const MoreFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterNotifier = ref.watch(artworkFilterNotifierProvider.notifier);
    final filterState = ref.watch(artworkFilterNotifierProvider);

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
                    (entry) => entry.value == filterState.mediaType,
                  )
                  .key,
              onChanged: (value) {
                filterNotifier.setMediaType(
                  mediaTypes[value],
                );
              },
              subtitle: 'Media type',
            ),
            AppDropdownButton(
              dropdownItems: downloadable.keys.toList(),
              value: downloadable.entries
                  .firstWhere(
                    (entry) => entry.value == filterState.allowsDownload,
                  )
                  .key,
              onChanged: (value) {
                filterNotifier.setAllowsDownload(
                  downloadable[value],
                );
              },
              subtitle: 'Download option',
            ),
            AppDropdownButton(
              dropdownItems: prompts.keys.toList(),
              value: prompts.entries
                  .firstWhere(
                    (entry) => entry.value == filterState.hasPrompt,
                  )
                  .key,
              onChanged: (value) {
                filterNotifier.setHasPrompt(
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
                      filterNotifier.setStartDate(startDate);
                    },
                    contentPadding: EdgeInsets.zero,
                    title: RichText(
                      text: TextSpan(
                        text: 'From:',
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          TextSpan(
                              text: filterState.startDate == null
                                  ? ' Select start date'
                                  : ' ${DateFormat('MMMM d, y - h:mm a').format(
                                      filterState.startDate!,
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
                      onTap: filterState.startDate == null
                          ? null
                          : () {
                              filterNotifier.setStartDate(null);
                            },
                      child: Icon(
                        Iconsax.trash,
                        color: filterState.startDate == null
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
                      filterNotifier.setEndDate(endDate);
                    },
                    contentPadding: EdgeInsets.zero,
                    title: RichText(
                      text: TextSpan(
                        text: 'To:',
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: [
                          TextSpan(
                              text: filterState.endDate == null
                                  ? ' Select end date'
                                  : ' ${DateFormat('MMMM d, y - h:mm a').format(
                                      filterState.endDate!,
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
                      onTap: filterState.endDate == null
                          ? null
                          : () {
                              filterNotifier.setEndDate(null);
                            },
                      child: Icon(
                        Iconsax.trash,
                        color: filterState.endDate == null
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
