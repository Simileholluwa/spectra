import 'dart:async';
import 'dart:developer';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/features/home/home.dart';
part 'get_tags_provider.g.dart';

Timer? _debounce;

@Riverpod(keepAlive: true)
class PaginatedTagsList extends _$PaginatedTagsList {
  @override
  PagingController<int, Tag> build(
    String sortBy,
    bool sortDescending,
    String query,
  ) {
    final controller = PagingController<int, Tag>(
      getNextPageKey: (state) {
        if (state.lastPageIsEmpty) return null;
        return state.nextIntPageKey;
      },
      fetchPage: (pageKey) => fetchPage(pageKey),
    );
    controller.addListener(() {});
    return controller;
  }

  Future<List<Tag>> fetchPage(int pageKey) async {
    final usecase = ref.read(getMostUsedTagsProvider);
    final completer = Completer<List<Tag>>();
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () async {
      final result = await usecase.call(
        GetTagsParams(
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
