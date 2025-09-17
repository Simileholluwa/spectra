import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/artwork/artwork.dart';
part 'artwork_comment_provider.g.dart';

@riverpod
class ArtworkCommentNotifier extends _$ArtworkCommentNotifier {
  @override
  ArtworkCommentState build() {
    return ArtworkCommentState.initial();
  }

  void setText(String text) {
    state = state.copyWith(
      text: text,
    );
  }

  Future<ArtworkComment?> addComment(ArtworkComment comment) async {
    state = state.copyWith(
      isLoading: true,
      errorMessage: null,
    );
    final result = await ref
        .read(artworkCommentUsecaseProvider)
        .call(ArtworkCommentParams(comment));
    return result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: failure.message,
        );
        return null;
      },
      (addedComment) {
        state = state.copyWith(
          isLoading: false,
        );
        TToastMessages.successToast('Your comment has been sent.');
        return addedComment;
      },
    );
  }

  Future<ArtworkComment?> addReply(ArtworkComment reply) async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    final result = await ref.read(addReplyUsecaseProvider).call(reply);
    return result.fold(
      (failure) {
        state = state.copyWith(
          isLoading: false,
          errorMessage: failure.message,
        );
        return null;
      },
      (addedReply) {
        state = state.copyWith(
          isLoading: false,
        );
        TToastMessages.successToast('Your reply has been sent.');
        return addedReply;
      },
    );
  }
}
