import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spectra_flutter/features/artwork/artwork.dart';

Future<dynamic> sortPopOver(
  BuildContext context,
) {
  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    useSafeArea: true,
    builder: (context) {
      return Consumer(builder: (context, ref, child) {
        final sortBy = ref.watch(
          artworkScreenNotifierProvider.select(
            (state) => state.sortBy,
          ),
        );
        final sortDescending = ref.watch(
          artworkScreenNotifierProvider.select(
            (state) => state.sortDescending,
          ),
        );
        return Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            spacing: 8,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...List.generate(4, (index) {
                      final texts = arrangeBy.keys.toList();
                      final values = arrangeBy.values.toList();
                      return Column(
                        children: [
                          ListTile(
                            onTap: () {
                              ref.watch(
                                artworkScreenNotifierProvider.notifier.select(
                                  (state) => state.setSortBy(
                                    values[index],
                                  ),
                                ),
                              );
                              context.pop();
                            },
                            title: Text(
                              texts[index],
                            ),
                            trailing: SizedBox(
                              height: 20,
                              width: 20,
                              child: Radio<String>(
                                value: values[index],
                                groupValue: sortBy,
                                onChanged: (value) {
                                  ref.watch(
                                    artworkScreenNotifierProvider.notifier
                                        .select(
                                      (state) => state.setSortBy(
                                        value!,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          if (index != 3)
                            Divider(
                              height: 0,
                              thickness: .5,
                            ),
                        ],
                      );
                    }),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...List.generate(2, (index) {
                      final texts = sortDirection.keys.toList();
                      final values = sortDirection.values.toList();
                      return Column(
                        children: [
                          ListTile(
                            onTap: () {
                              ref.watch(
                                artworkScreenNotifierProvider.notifier.select(
                                  (state) => state.setSortDescending(
                                    values[index],
                                  ),
                                ),
                              );
                              context.pop();
                            },
                            title: Text(
                              texts[index],
                            ),
                            trailing: SizedBox(
                              height: 20,
                              width: 20,
                              child: Radio<bool>(
                                value: values[index],
                                groupValue: sortDescending,
                                onChanged: (value) {
                                  ref.watch(
                                    artworkScreenNotifierProvider.notifier
                                        .select(
                                      (state) => state.setSortDescending(
                                        value!,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          if (index != 1)
                            Divider(
                              height: 0,
                              thickness: .5,
                            ),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        );
      });
    },
  );
}
