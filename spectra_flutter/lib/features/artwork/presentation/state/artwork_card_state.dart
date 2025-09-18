// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:spectra_client/spectra_client.dart';

class ArtworkCardState {
  final bool isLiked;
  final bool isDownloaded;
  final Map<String, int> currentImageIndex;
  final int likeCount;
  final int downloadsCount;
  final int viewsCount;
  final int commentsCount;

  ArtworkCardState({
    required this.isLiked,
    required this.isDownloaded,
    required this.currentImageIndex,
    required this.likeCount,
    required this.downloadsCount,
    required this.viewsCount,
    required this.commentsCount,
  });

  ArtworkCardState copyWith({
    bool? isLiked,
    bool? isDownloaded,
    Map<String, int>? currentImageIndex,
    int? likeCount,
    int? downloadsCount,
    int? viewsCount,
    int? commentsCount,
  }) {
    return ArtworkCardState(
      isLiked: isLiked ?? this.isLiked,
      isDownloaded: isDownloaded ?? this.isDownloaded,
      currentImageIndex: currentImageIndex ?? this.currentImageIndex,
      likeCount: likeCount ?? this.likeCount,
      downloadsCount: downloadsCount ?? this.downloadsCount,
      viewsCount: viewsCount ?? this.viewsCount,
      commentsCount: commentsCount ?? this.commentsCount,
    );
  }

  ArtworkCardState.initial(ArtworkWithUserState? artworkState)
      : isLiked = artworkState?.isLiked ?? false,
        isDownloaded = artworkState?.isDownloaded ?? false,
        likeCount = artworkState?.artwork.likes! ?? 0,
        downloadsCount = artworkState?.artwork.downloads! ?? 0,
        viewsCount = artworkState?.artwork.views! ?? 0,
        commentsCount = artworkState?.artwork.commentsCount! ?? 0,
        currentImageIndex = {};
}
