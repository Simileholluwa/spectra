import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/artwork/artwork.dart';

class LikeButton extends ConsumerWidget {
  const LikeButton({
    super.key,
    required this.artworkState,
  });

  final ArtworkWithUserState artworkState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAuthenticated = ref.watch(sessionProvider).isSignedIn;
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
        contentState.isLiked ? Iconsax.heart5 : Iconsax.heart,
        color: contentState.isLiked
            ? TColors.primary
            : Theme.of(context).iconTheme.color,
      ),
      onPressed: () {
        if (!isAuthenticated) {
          context.push('/auth');
          TToastMessages.infoToast(
            'Please login to like an artwork.',
          );
          return;
        }
        contentNotfier.toggleLike(
          artwork.id!,
        );
      },
    );
  }
}
