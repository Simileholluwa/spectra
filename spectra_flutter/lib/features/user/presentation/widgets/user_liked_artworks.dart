import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/artwork/artwork.dart';
import 'package:spectra_flutter/features/user/user.dart';

class UserLikedArtworks extends ConsumerWidget {
  const UserLikedArtworks({
    super.key,
    required this.username,
  });

  final String username;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final likesPagingController = ref.watch(
      paginatedUserLikedArtworksProvider(
        username,
        true,
      ),
    );

    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: AppInfiniteStaggeredGrid(
        padding: EdgeInsets.zero,
        onRefresh: likesPagingController.refresh,
        pagingController: likesPagingController,
        itemBuilder: (context, artworkState, index) {
          final artwork = artworkState.artwork;
          return artwork.thumbnailUrl!.length > 1
              ? MultipleImagArt(
                  artworkState: artworkState,
                  index: index,
                  resolution: artwork.resolution!.first,
                  borderRadius: 8,
                )
              : SingleImageArt(
                  borderRadius: 8,
                  artworkState: artworkState,
                );
        },
      ),
    );
  }
}
