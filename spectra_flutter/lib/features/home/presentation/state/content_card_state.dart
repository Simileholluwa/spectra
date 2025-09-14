// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:spectra_client/spectra_client.dart';

class ContentCardState {
  final bool isLiked;
  final bool isDownloaded;
  final Map<String, int> currentImageIndex;
  ContentCardState({
    required this.isLiked,
    required this.isDownloaded,
    required this.currentImageIndex,
  });

  ContentCardState copyWith({
    bool? isLiked,
    bool? isDownloaded,
    double? downloadProgress,
    Map<String, int>? currentImageIndex,
  }) {
    return ContentCardState(
      isLiked: isLiked ?? this.isLiked,
      isDownloaded: isDownloaded ?? this.isDownloaded,
      currentImageIndex: currentImageIndex ?? this.currentImageIndex,
    );
  }

  ContentCardState.initial(ArtworkWithUserState? artworkState)
      : isLiked = artworkState?.isLiked ?? false,
        isDownloaded = artworkState?.isDownloaded ?? false,
        currentImageIndex = {};
}
