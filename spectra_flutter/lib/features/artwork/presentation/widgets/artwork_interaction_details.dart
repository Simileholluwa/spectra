import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/artwork/artwork.dart';

class ArtworkInteractionDetails extends ConsumerWidget {
  const ArtworkInteractionDetails({
    super.key,
    required this.artwork,
  });

  final Artwork artwork;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artworkUpdates = ref.watch(
      artworkUpdateStreamProvider(
        artwork.id!,
      ),
    );
    var likes = artwork.likes!;
    var downloads = artwork.downloads!;
    var views = artwork.views!;

    if (!artworkUpdates.hasError && artworkUpdates.value != null) {
      likes = artworkUpdates.value!.likes;
      downloads = artworkUpdates.value!.downloads;
      views = artworkUpdates.value!.views;
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 10,
            children: [
              InteractionButtons(
                icon: Iconsax.heart5,
                title: '$likes',
                color: TColors.primary,
              ),
              if (artwork.allowDownload!)
                InteractionButtons(
                  icon: Iconsax.document_download5,
                  title: '$downloads',
                  color: Colors.indigo,
                ),
              InteractionButtons(
                icon: Iconsax.eye4,
                title: '$views',
                color: Colors.red,
              ),
            ],
          ),
          InteractionButtons(
            icon: Iconsax.information5,
            title: 'More',
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
