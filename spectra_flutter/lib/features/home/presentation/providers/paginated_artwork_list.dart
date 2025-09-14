import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/home/home.dart';
part 'paginated_artwork_list.g.dart';

@Riverpod(keepAlive: true)
class PaginatedArtworkList extends _$PaginatedArtworkList {
  final List<ArtworkWithUserState> _bufferedArtworks = [];
  @override
  PagingController<int, ArtworkWithUserState> build(
    ArtworkFilter? filter,
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
    controller.addListener(() {});
    _listenToNewArtworks();
    return controller;
  }

  void refresh() {
    state.refresh();
  }

  Future<List<ArtworkWithUserState>> fetchPage(int pageKey) async {
    log('Fetching page $pageKey', name: 'Paginated artworks list');
    final usecase = ref.read(getArtworksUseCaseProvider);
    final completer = Completer<List<ArtworkWithUserState>>();
    final result = await usecase(
      GetArtworksParams(
        pageKey,
        50,
        filter,
        sortBy,
        sortDescending,
      ),
    );

    result.fold(
      (l) {
        log(l.message, name: 'Paginated artworks list');
        completer.completeError(l.message);
      },
      (r) {
        completer.complete(r.results);
      },
    );

    return completer.future;
  }

  void _listenToNewArtworks() {
    ref.read(clientProvider).upload.newArtworkUpdates().listen((artwork) {
      final newItem = ArtworkWithUserState(
        artwork: artwork,
        isLiked: false,
        isDownloaded: false,
      );
      _bufferedArtworks.insert(0, newItem);
      ref.notifyListeners();
    });
  }

  bool get hasBufferedArtworks => _bufferedArtworks.isNotEmpty;

  void mergeBufferedArtworks(ScrollController scrollController) {
    if (_bufferedArtworks.isEmpty) return;
    final current = state.value;
    if (current.pages == null || current.pages!.isEmpty) {
      state.value = current.copyWith(
        pages: [
          [..._bufferedArtworks],
        ],
        keys: [1],
        hasNextPage: current.hasNextPage,
      );
      return;
    }

    final updatedPages = [
      [..._bufferedArtworks, ...current.pages!.first],
      ...current.pages!.skip(1),
    ];

    final updatedKeys = [
      ...?current.keys,
    ];
    if (updatedKeys.length < updatedPages.length) {
      updatedKeys.insert(0, 0);
    }

    state.value = current.copyWith(
      pages: updatedPages,
      keys: updatedKeys,
      hasNextPage: current.hasNextPage,
    );

    _bufferedArtworks.clear();

    scrollController.animateTo(
      scrollController.position.minScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );

    ref.notifyListeners();
  }

  // void removeArtwork(int artworkId) {
  //   if (state.items != null) {
  //     state.value.items!.removeWhere((element) => element.id == artworkId);
  //   }
  // }
}
