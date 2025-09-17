import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/artwork/artwork.dart';

class DownloadButton extends ConsumerWidget {
  const DownloadButton({
    super.key,
    required this.artworkState,
    required this.isVideo,
    required this.currentIndex,
  });

  final ArtworkWithUserState artworkState;
  final bool isVideo;
  final int currentIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contentNotfier = ref.watch(
      artworkCardNotifierProvider(
        artworkState,
      ).notifier,
    );
    final contentState = ref.watch(
      artworkCardNotifierProvider(
        artworkState,
      ),
    );
    final artwork = artworkState.artwork;
    return IconButton(
      icon: Icon(
        contentState.isDownloaded
            ? Iconsax.document_download5
            : Iconsax.document_download,
        color: contentState.isDownloaded
            ? TColors.primary
            : Theme.of(context).iconTheme.color,
      ),
      onPressed: () {
        isVideo
            ? contentNotfier.saveNetworkVideoFile(
                artwork.mediaUrl!.first,
                artwork.id!,
              )
            : contentNotfier.saveNetworkImage(
                artwork.mediaUrl?[currentIndex] ?? '',
                artwork.id!,
              );
      },
    );
  }
}
