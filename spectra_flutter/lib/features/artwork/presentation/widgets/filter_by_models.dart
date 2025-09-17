import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/artwork/artwork.dart';

class ModelsFilter extends ConsumerWidget {
  const ModelsFilter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artworkState = ref.watch(
      artworkScreenNotifierProvider,
    );
    final artworkNotifier = ref.watch(
      artworkScreenNotifierProvider.notifier,
    );
    final pagingController = ref.watch(
      paginatedModelsListProvider(
        'usageCount',
        true,
        artworkState.searchModelQuery,
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
            height: artworkState.filterModels.isNotEmpty ? 161 : 103,
            child: SheetBottomWidget(
              searchInput: artworkState.filterModelInput,
              onChanged: (value) {
                artworkNotifier.setSearchModelOnTextChanged(
                  value ?? '',
                );
              },
              showSelected: artworkState.filterModels.isNotEmpty,
              items: artworkState.filterModels,
              onDelete: artworkNotifier.removeFilterModels,
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
                      artworkNotifier.addFilterModels(model.name);
                    },
                    isSelected: artworkState.filterModels.contains(model.name),
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
