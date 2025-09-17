import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/artwork/artwork.dart';

class ContentCard extends ConsumerWidget {
  const ContentCard({
    super.key,
    required this.index,
    required this.artworkState,
  });

  final int index;
  final ArtworkWithUserState artworkState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artwork = artworkState.artwork;
    final contentState = ref.watch(
      artworkCardNotifierProvider(
        artworkState,
      ),
    );
    final isVideo = artwork.mediaType == MediaType.video;
    final currentIndex = contentState.currentImageIndex['$index'] ?? 0;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      spacing: 10,
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 10,
                children: [
                  Text(
                    artwork.user!.username!,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: TSizes.fontSizeMd,
                        ),
                    textAlign: TextAlign.start,
                  ),
                  Text(
                    THelperFunctions.humanizeDateTime(
                      artwork.createdAt!,
                      ref.watch(timeProvider).value ?? DateTime.now(),
                    ),
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontSize: TSizes.fontSizeSm,
                        ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              artwork.thumbnailUrl!.length > 1
                  ? MultipleImagArt(
                      index: index,
                      artworkState: artworkState,
                      resolution: artwork.resolution!.first,
                    )
                  : SingleImageArt(
                      artworkState: artworkState,
                    ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 4),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: .5,
              color: Theme.of(context).dividerColor,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: AppUserProfileImage(
                  imageUrl: artwork.user?.user?.imageUrl ?? '',
                ),
                onPressed: () {},
              ),
              SizedBox(
                width: 20,
                child: Divider(
                  height: 5,
                ),
              ),
              LikeButton(
                artworkState: artworkState,
              ),
              if (artwork.allowDownload!)
                SizedBox(
                  width: 20,
                  child: Divider(
                    height: 5,
                  ),
                ),
              if (artwork.allowDownload!)
                DownloadButton(
                  isVideo: isVideo,
                  currentIndex: currentIndex,
                  artworkState: artworkState,
                ),
              SizedBox(
                width: 20,
                child: Divider(
                  height: 5,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.share,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
