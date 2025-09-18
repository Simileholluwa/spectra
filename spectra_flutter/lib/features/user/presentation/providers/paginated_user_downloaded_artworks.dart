import 'dart:async';
import 'dart:developer';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/features/user/user.dart';
part 'paginated_user_downloaded_artworks.g.dart';

@Riverpod(keepAlive: true)
class PaginatedUserDownloadedArtworks
    extends _$PaginatedUserDownloadedArtworks {
  @override
  PagingController<int, ArtworkWithUserState> build(
    String username,
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
    log('Fetching page $pageKey',
        name: 'Paginated user downloaded artworks list');
    final usecase = ref.read(getUserDownloadedArtworksUsecaseProvider);
    final result = await usecase(
      GetUserDownloadedArtworksParams(
        username: username,
        limit: 50,
        page: pageKey,
        sortDescending: sortDescending,
      ),
    );

    return result.fold(
      (l) {
        log(l.message, name: 'Paginated user downloaded artworks list');
        throw l.message;
      },
      (r) {
        return r.results;
      },
    );
  }
}
