import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/features/artwork/artwork.dart';

class MultipleImagArt extends ConsumerWidget {
  const MultipleImagArt({
    super.key,
    required this.index,
    required this.artworkState,
    required this.resolution,
    this.borderRadius = 12,
  });
  final int index;
  final ArtworkWithUserState artworkState;
  final String resolution;
  final double borderRadius;

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
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).dividerColor,
              width: .5,
            ),
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(
              borderRadius,
            ),
          ),
          child: CarouselSlider(
            options: CarouselOptions(
                aspectRatio: double.parse(resolution),
                enableInfiniteScroll: false,
                viewportFraction: 1.0,
                onPageChanged: (idx, _) {
                  contentNotifier.setCurrentImageIndex(
                    '$index',
                    idx,
                  );
                }),
            items: artwork.thumbnailUrl!.asMap().entries.map((entry) {
              final url = entry.value;
              final idx = entry.key;
              return Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  CachedNetworkImage(
                    imageUrl: url,
                    fit: BoxFit.cover,
                  ),
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
                            Icons.view_list,
                            size: 18,
                            color: Colors.white,
                          ),
                          Text(
                            '${idx + 1}/${artwork.thumbnailUrl!.length}',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
