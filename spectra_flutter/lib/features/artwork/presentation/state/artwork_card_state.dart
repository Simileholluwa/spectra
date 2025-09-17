// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:spectra_client/spectra_client.dart';

class ArtworkCardState {
  final bool isLiked;
  final bool isDownloaded;
  final Map<String, int> currentImageIndex;
  ArtworkCardState({
    required this.isLiked,
    required this.isDownloaded,
    required this.currentImageIndex,
  });

  ArtworkCardState copyWith({
    bool? isLiked,
    bool? isDownloaded,
    double? downloadProgress,
    Map<String, int>? currentImageIndex,
  }) {
    return ArtworkCardState(
      isLiked: isLiked ?? this.isLiked,
      isDownloaded: isDownloaded ?? this.isDownloaded,
      currentImageIndex: currentImageIndex ?? this.currentImageIndex,
    );
  }

  ArtworkCardState.initial(ArtworkWithUserState? artworkState)
      : isLiked = artworkState?.isLiked ?? false,
        isDownloaded = artworkState?.isDownloaded ?? false,
        currentImageIndex = {};
}
