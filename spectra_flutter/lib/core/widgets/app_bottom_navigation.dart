import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/artwork/artwork.dart';

class AppBottomNavigation extends ConsumerWidget {
  const AppBottomNavigation({
    super.key,
    required this.navigatorShell,
  });

  final StatefulNavigationShell navigatorShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recentArts = ref.watch(bufurredArtworksCount);
    return Container(
      margin: const EdgeInsets.only(
        bottom: 15,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          25,
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5,
            sigmaY: 5,
          ),
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                100,
              ),
              border: Border.all(
                color: Theme.of(context).dividerColor,
              ),
              color: Theme.of(context)
                  .scaffoldBackgroundColor
                  .withValues(alpha: .5),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    4,
                    (index) {
                      final isActive = navigatorShell.currentIndex == index;
                      return Stack(
                        alignment: Alignment.topRight,
                        children: [
                          IconButton(
                            icon: Icon(
                              [
                                Iconsax.paintbucket,
                                Iconsax.search_favorite,
                                Iconsax.notification,
                                Iconsax.user,
                              ][index],
                              color: isActive
                                  ? Colors.white
                                  : Theme.of(context).hintColor,
                            ),
                            onPressed: () {
                              if (index == 0) {
                                final homeState = ref.watch(
                                  artworkScreenNotifierProvider,
                                );
                                final notifier = ref.watch(
                                  paginatedArtworkListProvider(
                                    homeState.filter,
                                    homeState.sortBy,
                                    homeState.sortDescending,
                                  ).notifier,
                                );
                                notifier.mergeBufferedArtworks();
                                return;
                              }
                              navigatorShell.goBranch(index);
                            },
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                isActive
                                    ? Theme.of(context).primaryColor
                                    : Colors.transparent,
                              ),
                              shape: WidgetStateProperty.all(
                                const CircleBorder(),
                              ),
                            ),
                          ),
                          if (index == 0 && recentArts > 0)
                            NavigationIconsOverlay(
                              text: recentArts.toString(),
                            ),
                        ],
                      );
                    },
                  ),
                ),
                AnimatedCrossFade(
                  duration: const Duration(milliseconds: 300),
                  crossFadeState: navigatorShell.currentIndex == 0
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  secondChild: const SizedBox.shrink(),
                  firstChild: IconButton.filled(
                    onPressed: () {
                      context.push('/artworks/upload');
                    },
                    icon: Icon(
                      Iconsax.document_upload5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
