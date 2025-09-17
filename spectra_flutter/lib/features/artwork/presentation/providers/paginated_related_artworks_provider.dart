import 'dart:async';
import 'dart:developer';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/features/artwork/artwork.dart';
part 'paginated_related_artworks_provider.g.dart';

@Riverpod(keepAlive: true)
class PaginatedRelatedArtwork extends _$PaginatedRelatedArtwork {
  @override
  PagingController<int, ArtworkWithUserState> build(
    int artworkId,
    List<String> tagNames,
    List<String> modelNames,
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

  Future<List<ArtworkWithUserState>> fetchPage(int pageKey) async {
    log('Fetching page $pageKey', name: 'Paginated retlated artworks list');
    final usecase = ref.read(getRelatedArtworksUseCaseProvider);
    final result = await usecase(
      GetRelatedArtworksParams(
        pageKey,
        50,
        tagNames,
        modelNames,
        artworkId,
      ),
    );

    return result.fold(
      (l) {
        log(l.message, name: 'Paginated related artworks list');
        throw l.message;
      },
      (r) {
        return r.results;
      },
    );
  }
}
