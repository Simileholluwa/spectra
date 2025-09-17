import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/artwork/artwork.dart';

class TagsFilter extends ConsumerWidget {
  const TagsFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artworkState = ref.watch(
      artworkScreenNotifierProvider,
    );
    final artworkNotifier = ref.watch(
      artworkScreenNotifierProvider.notifier,
    );
    final pagingController = ref.watch(
      paginatedTagsListProvider(
        'usageCount',
        true,
        artworkState.searchTagQuery,
      ),
    );
    return Padding(
      padding: EdgeInsets.only(
        left: 15,
        right: 15,
      ),
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(
              milliseconds: 300,
            ),
            height: artworkState.filterTags.isNotEmpty ? 161 : 103,
            child: SheetBottomWidget(
              searchInput: artworkState.filterTagInput,
              onChanged: (value) {
                artworkNotifier.setSearchTagOnTextChanged(
                  value ?? '',
                );
              },
              showSelected: artworkState.filterTags.isNotEmpty,
              items: artworkState.filterTags,
              onDelete: artworkNotifier.removeFilterTags,
              subtitle: 'Search for tags or select from the list below.',
              hintText: 'Search for tags',
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 15,
              ),
              child: AppInfiniteGrid(
                onRefresh: pagingController.refresh,
                pagingController: pagingController,
                itemBuilder: (context, tag, index) {
                  return ItemChip(
                    itemName: tag.name,
                    usageCount: tag.usageCount.toString(),
                    onTap: () {
                      artworkNotifier.addFilterTags(tag.name);
                    },
                    isSelected: artworkState.filterTags.contains(tag.name),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
