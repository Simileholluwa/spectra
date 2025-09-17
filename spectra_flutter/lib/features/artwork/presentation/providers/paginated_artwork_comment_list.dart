import 'dart:async';
import 'dart:developer';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/features/artwork/artwork.dart';
part 'paginated_artwork_comment_list.g.dart';

@Riverpod(keepAlive: true)
class PaginatedArtworkCommentList extends _$PaginatedArtworkCommentList {
  @override
  PagingController<int, ArtworkCommentWithUserState> build(
    int artworkId,
    int? parentId,
    String sortBy,
    bool sortDescending,
  ) {
    final controller = PagingController<int, ArtworkCommentWithUserState>(
      getNextPageKey: (state) {
        if (state.lastPageIsEmpty) return null;
        return state.nextIntPageKey;
      },
      fetchPage: (pageKey) => fetchPage(pageKey),
    );
    controller.addListener(() {});
    return controller;
  }

  void refresh() {
    state.refresh();
  }

  Future<List<ArtworkCommentWithUserState>> fetchPage(int pageKey) async {
    log('Fetching page $pageKey', name: 'Paginated artwork comments list');
    final usecase = ref.read(getArtworkCommentsUseCaseProvider);
    final result = await usecase(
      GetArtworkCommentsParams(
        artworkId,
        parentId,
        pageKey,
        50,
        sortBy,
        sortDescending,
      ),
    );

    return result.fold(
      (l) {
        log(l.message, name: 'Paginated artwork comments list');
        throw l.message;
      },
      (r) {
        return r.results;
      },
    );
  }

  void addComment(ArtworkCommentWithUserState comment) {
    final current = state.value;
    if (current.pages == null) state.refresh();
    if (current.pages == null || current.pages!.isEmpty) {
      state.value = current.copyWith(
        pages: [
          [comment],
        ],
        keys: [1],
        hasNextPage: current.hasNextPage,
      );
      return;
    }

    final newPages = [
      [comment, ...current.pages!.first],
      ...current.pages!.skip(1),
    ];

    state.value = current.copyWith(
      pages: newPages,
      keys: current.keys,
      hasNextPage: current.hasNextPage,
    );
  }

  void removeComment(int commentId) {
    final current = state.value;
    if (current.pages == null) return;

    state.value = current.copyWith(
      pages: current.pages!
          .map(
            (page) =>
                page.where((item) => item.comment.id != commentId).toList(),
          )
          .toList(),
      keys: current.keys,
      hasNextPage: current.hasNextPage,
    );
  }
}
