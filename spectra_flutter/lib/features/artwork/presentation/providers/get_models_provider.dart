import 'dart:async';
import 'dart:developer';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/features/artwork/artwork.dart';
part 'get_models_provider.g.dart';

Timer? _debounce;

@Riverpod(keepAlive: true)
class PaginatedModelsList extends _$PaginatedModelsList {
  @override
  PagingController<int, Model> build(
    String sortBy,
    bool sortDescending,
    String query,
  ) {
    final controller = PagingController<int, Model>(
      getNextPageKey: (state) {
        if (state.lastPageIsEmpty) return null;
        return state.nextIntPageKey;
      },
      fetchPage: (pageKey) => fetchPage(pageKey),
    );
    controller.addListener(() {});
    return controller;
  }

  Future<List<Model>> fetchPage(int pageKey) async {
    final usecase = ref.read(getMostUsedModelsProvider);
    final completer = Completer<List<Model>>();
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () async {
      final result = await usecase.call(
        GetModelsParams(
          limit: 50,
          page: pageKey,
          sortBy: sortBy,
          sortDescending: sortDescending,
          query: query,
        ),
      );
      result.fold((failure) {
        log(failure.message);
        completer.completeError(
          failure.message,
        );
      }, (r) {
        completer.complete(r.results);
      });
    });
    return completer.future;
  }
}
