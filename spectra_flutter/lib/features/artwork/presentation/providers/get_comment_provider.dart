import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/features/artwork/artwork.dart';
part 'get_comment_provider.g.dart';

@riverpod
Future<ArtworkCommentWithUserState> getComment(
  Ref ref,
  ArtworkCommentWithUserState? artworkCommentState,
  int commentId,
) async {
  if (artworkCommentState != null) {
    return artworkCommentState;
  }
  final usecase = ref.read(getCommentUseCaseProvider);
  final result = await usecase(
    commentId,
  );
  return result.fold((l) {
    throw l.message;
  }, (r) {
    return r;
  });
}
