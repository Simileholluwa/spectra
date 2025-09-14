import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/home/home.dart';

class ModelsFilter extends ConsumerWidget {
  const ModelsFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filterNotifier = ref.watch(artworkFilterNotifierProvider.notifier);
    final filterState = ref.watch(artworkFilterNotifierProvider);
    final pagingController = ref.watch(
      paginatedModelsListProvider(
        'usageCount',
        true,
        filterState.searchModelQuery,
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
            height: filterState.filterModels.isNotEmpty ? 161 : 103,
            child: SheetBottomWidget(
              searchInput: filterState.filterModelInput,
              onChanged: (value) {
                filterNotifier.setSearchModelOnTextChanged(
                  value ?? '',
                );
              },
              showSelected: filterState.filterModels.isNotEmpty,
              items: filterState.filterModels,
              onDelete: filterNotifier.removeFilterModels,
              subtitle: 'Search for models or select from the list below.',
              hintText: 'Search for models',
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
                itemBuilder: (context, model, index) {
                  return ItemChip(
                    itemName: model.name,
                    usageCount: model.usageCount.toString(),
                    onTap: () {
                      filterNotifier.addFilterModels(model.name);
                    },
                    isSelected: filterState.filterModels.contains(model.name),
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
