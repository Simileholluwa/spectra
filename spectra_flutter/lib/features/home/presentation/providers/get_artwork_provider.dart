import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/features/home/home.dart';
part 'get_artwork_provider.g.dart';

@riverpod
Future<ArtworkWithUserState> getArtwork(
  Ref ref,
  ArtworkWithUserState? artworkState,
  int artworkId,
) async {
  final completer = Completer<ArtworkWithUserState>();
  if (artworkState != null) {
    completer.complete(artworkState);
    return completer.future;
  }
  final usecase = ref.read(getArtworkUseCaseProvider);
  final result = await usecase(
    GetArtworkParams(
      artworkId,
    ),
  );
  return result.fold((l) {
    completer.completeError(l.message);
    return completer.future;
  }, (r) {
    completer.complete(r);
    return completer.future;
  });
}
