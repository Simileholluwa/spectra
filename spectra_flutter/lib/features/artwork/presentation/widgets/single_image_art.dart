import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/features/artwork/artwork.dart';

class SingleImageArt extends ConsumerWidget {
  const SingleImageArt({
    super.key,
    required this.artworkState,
    this.borderRadius = 12,
  });

  final double borderRadius;
  final ArtworkWithUserState artworkState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final contentNotifier = ref.watch(
      artworkCardNotifierProvider(
        artworkState,
      ).notifier,
    );
    final artwork = artworkState.artwork;
    return InkWell(
      onTap: () {
        unawaited(
          contentNotifier.updateViewsCount(
            artwork.id!,
          ),
        );
        context.push(
          '/artworks/${artwork.id}',
          extra: artworkState,
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          borderRadius,
        ),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            CachedNetworkImage(
              imageUrl: artwork.thumbnailUrl!.first,
              fit: BoxFit.cover,
              placeholder: (_, __) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).dividerColor,
                      width: .5,
                    ),
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                  ),
                  child: AspectRatio(
                    aspectRatio: double.parse(
                      artwork.resolution!.first,
                    ),
                  ),
                );
              },
            ),
            if (artwork.mediaType == MediaType.video)
              Positioned(
                bottom: 10,
                left: 15,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(
                      50,
                    ),
                  ),
                  child: Row(
                    spacing: 5,
                    children: [
                      Icon(
                        Iconsax.play5,
                        size: 18,
                        color: Colors.white,
                      ),
                      Text(
                        artwork.videoDuration!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
