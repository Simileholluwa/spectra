import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
part 'artwork_stream_provider.g.dart';

@Riverpod(keepAlive: true)
Stream<ArtworkUpdates> artworkUpdateStream(
  Ref ref,
  int artworkId,
) async* {
  final updates = ref.read(clientProvider).artwork.artworkUpdates(
        artworkId,
      );
  await for (final update in updates) {
    yield update;
  }
}

@Riverpod(keepAlive: true)
Stream<ArtworkCommentUpdates> artworkCommentUpdateStream(
  Ref ref,
  int commentId,
) async* {
  final updates = ref.read(clientProvider).artwork.artworkCommentUpdates(
        commentId,
      );
  await for (final update in updates) {
    yield update;
  }
}
