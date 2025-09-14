import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/home/home.dart';
part 'artwork_comment_interaction_provider.g.dart';

@riverpod
class ArtworkCommentInteractionNotifier
    extends _$ArtworkCommentInteractionNotifier {
  @override
  ArtworkCommentInteractionState build(ArtworkCommentWithUserState? comment) {
    return ArtworkCommentInteractionState.initial(comment, ref);
  }

  void setLiked() {
    state = state.copyWith(
      isLiked: !state.isLiked,
    );
  }

  void setLikeCount(int likeCount) {
    state = state.copyWith(
      likesCount: likeCount,
    );
  }

  void setRepliesCount(int repliesCount) {
    state = state.copyWith(
      repliesCount: repliesCount,
    );
  }

  Future<void> likeComment(int commentId) async {
    final result = await ref.read(likeCommentUseCaseProvider).call(commentId);
    return result.fold(
      (failure) {
        TToastMessages.errorToast(
          failure.message,
        );
        return;
      },
      (_) {
        setLiked();
        return;
      },
    );
  }

  Future<void> deleteComment(int commentId) async {
    final result = await ref.read(deleteCommentUsecaseProvider).call(commentId);
    result.fold(
      (failure) {
        TToastMessages.errorToast(failure.message);
        return;
      },
      (success) {
        TToastMessages.successToast('Your comment has been deleted.');
      },
    );
  }
}
