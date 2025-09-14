import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/home/home.dart';

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
    final isAuthenticated = ref.watch(sessionProvider).isSignedIn;
    final contentNotfier = ref.watch(
      contentCardNotifierProvider(
        artworkState,
      ).notifier,
    );
    final contentState = ref.watch(
      contentCardNotifierProvider(
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
        if (!isAuthenticated) {
          context.push('/auth');
          TToastMessages.infoToast(
            'Please login to download an artwork.',
          );
          return;
        }
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
