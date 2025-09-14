import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/home/home.dart';

class TagsFilter extends ConsumerWidget {
  const TagsFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterState = ref.watch(artworkFilterNotifierProvider);
    final filterNotifier = ref.watch(artworkFilterNotifierProvider.notifier);
    final pagingController = ref.watch(
      paginatedTagsListProvider(
        'usageCount',
        true,
        filterState.searchTagQuery,
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
            height: filterState.filterTags.isNotEmpty ? 161 : 103,
            child: SheetBottomWidget(
              searchInput: filterState.filterTagInput,
              onChanged: (value) {
                filterNotifier.setSearchTagOnTextChanged(
                  value ?? '',
                );
              },
              showSelected: filterState.filterTags.isNotEmpty,
              items: filterState.filterTags,
              onDelete: filterNotifier.removeFilterTags,
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
                      filterNotifier.addFilterTags(tag.name);
                    },
                    isSelected: filterState.filterTags.contains(tag.name),
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
