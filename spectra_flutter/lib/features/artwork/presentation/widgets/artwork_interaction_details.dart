import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/artwork/artwork.dart';

class ArtworkInteractionDetails extends ConsumerWidget {
  const ArtworkInteractionDetails({
    super.key,
    required this.artworkState,
  });

  final ArtworkWithUserState artworkState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final artwork = artworkState.artwork;
    final artworkUpdates = ref.watch(
      artworkCardNotifierProvider(
        artworkState,
      ),
    );
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
                title: '${artworkUpdates.likeCount}',
                color: TColors.primary,
              ),
              if (artwork.allowDownload!)
                InteractionButtons(
                  icon: Iconsax.document_download5,
                  title: '${artworkUpdates.downloadsCount}',
                  color: Colors.indigo,
                ),
              InteractionButtons(
                icon: Iconsax.eye4,
                title: '${artworkUpdates.viewsCount}',
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
