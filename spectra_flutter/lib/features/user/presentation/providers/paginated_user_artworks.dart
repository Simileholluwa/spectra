import 'dart:async';
import 'dart:developer';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/features/user/user.dart';
part 'paginated_user_artworks.g.dart';

@Riverpod(keepAlive: true)
class PaginatedUserArtworks extends _$PaginatedUserArtworks {
  @override
  PagingController<int, ArtworkWithUserState> build(
    String username,
    String sortBy,
    bool sortDescending,
  ) {
    final controller = PagingController<int, ArtworkWithUserState>(
      getNextPageKey: (state) {
        if (state.lastPageIsEmpty) return null;
        return state.nextIntPageKey;
      },
      fetchPage: (pageKey) => fetchPage(pageKey),
    );
    return controller;
  }

  void refresh() {
    state.refresh();
  }

  Future<List<ArtworkWithUserState>> fetchPage(int pageKey) async {
    log('Fetching page $pageKey', name: 'Paginated user artworks list');
    final usecase = ref.read(getUserArtworksUsecaseProvider);
    final result = await usecase(
      GetUserArtworksParams(
        username: username,
        limit: 50,
        page: pageKey,
        sortBy: sortBy,
        sortDescending: sortDescending,
      ),
    );

    return result.fold(
      (l) {
        log(l.message, name: 'Paginated user artworks list');
        throw l.message;
      },
      (r) {
        return r.results;
      },
    );
  }
}
