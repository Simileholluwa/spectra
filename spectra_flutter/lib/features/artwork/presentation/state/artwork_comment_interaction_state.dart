import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/services/local_storage_services.dart';

class ArtworkCommentInteractionState {
  final bool isLiked;
  final int likesCount;
  final int repliesCount;
  final bool isOwner;

  ArtworkCommentInteractionState({
    this.isLiked = false,
    this.likesCount = 0,
    this.repliesCount = 0,
    this.isOwner = false,
  });

  ArtworkCommentInteractionState copyWith({
    bool? isLiked,
    int? likesCount,
    int? repliesCount,
  }) {
    return ArtworkCommentInteractionState(
      isLiked: isLiked ?? this.isLiked,
      likesCount: likesCount ?? this.likesCount,
      repliesCount: repliesCount ?? this.repliesCount,
    );
  }

  factory ArtworkCommentInteractionState.initial(
    ArtworkCommentWithUserState? comment,
    Ref ref,
  ) {
    final userId = ref.read(localStorageProvider).getInt('userId');
    return ArtworkCommentInteractionState(
      isLiked: comment?.isLiked ?? false,
      likesCount: comment?.comment.likesCount ?? 0,
      repliesCount: comment?.comment.repliesCount ?? 0,
      isOwner: comment?.comment.ownerId == userId,
    );
  }
}
