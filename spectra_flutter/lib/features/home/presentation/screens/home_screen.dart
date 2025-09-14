import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/home/home.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uploadProgressState = ref.watch(uploadStagesProvider);
    final filter = ref.watch(
      artworkFilterNotifierProvider.select(
        (state) => state.filter,
      ),
    );
    final homeState = ref.watch(
      homeNotifierProvider,
    );
    final homeNotifier = ref.watch(
      homeNotifierProvider.notifier,
    );
    final state = ref.watch(
      paginatedArtworkListProvider(
        filter,
        homeState.sortBy,
        homeState.sortDescending,
      ),
    );
    final notifier = ref.watch(
      paginatedArtworkListProvider(
        filter,
        homeState.sortBy,
        homeState.sortDescending,
      ).notifier,
    );
    return AppAndroidBottomNav(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: Column(
          spacing: 10,
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedCrossFade(
              secondChild: const SizedBox.shrink(),
              duration: const Duration(milliseconds: 300),
              crossFadeState: homeState.canScroll
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              firstChild: GestureDetector(
                onTap: () => homeNotifier.scrollToTop(),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(
                      100,
                    ),
                  ),
                  child: Icon(
                    Icons.keyboard_arrow_up_rounded,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
            ),
            FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                  100,
                ),
              ),
              onPressed: () {
                context.push('/home/upload');
              },
              child: const Icon(
                Iconsax.document_upload5,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        appBar: AppBar(
          toolbarHeight: uploadProgressState.idle == false ? 45 : 0,
          title: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: uploadProgressState.idle == false
                ? UploadProgressWidget()
                : const SizedBox.shrink(),
          ),
        ),
        body: NestedScrollView(
          controller: homeState.scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              floating: true,
              snap: true,
              title: Text(
                'Spectra',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontSize: 35,
                    ),
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(5),
                child: Divider(
                  height: 0,
                  thickness: .5,
                ),
              ),
              actions: [
                Row(
                  children: [
                    ActionButtons(
                      isLeft: true,
                      onTap: () {
                        homeNotifier.setViewType(
                          'grid',
                        );
                      },
                      icon: Icons.grid_view_rounded,
                      isActive: homeState.viewType == 'grid',
                      iconSize: 20,
                    ),
                    SizedBox(
                      height: 42,
                      child: VerticalDivider(
                          width: 0,
                          thickness: .5,
                          color: Theme.of(context).dividerColor),
                    ),
                    ActionButtons(
                      isRight: true,
                      onTap: () {
                        homeNotifier.setViewType(
                          'list',
                        );
                      },
                      icon: Icons.view_list_rounded,
                      isActive: homeState.viewType == 'list',
                    ),
                  ],
                ),
                const SizedBox(
                  width: 15,
                ),
                Row(
                  children: [
                    ActionButtons(
                      isLeft: true,
                      onTap: () => filterBottomSheet(context),
                      icon: Icons.filter_alt,
                      isActive: filter != null,
                    ),
                    SizedBox(
                      height: 42,
                      child: VerticalDivider(
                        width: 0,
                        thickness: .5,
                        color: Theme.of(context).dividerColor,
                      ),
                    ),
                    ActionButtons(
                      isRight: true,
                      onTap: () {
                        sortPopOver(context);
                      },
                      icon: Icons.sort_rounded,
                      isActive: homeState.sortBy != 'createdAt' ||
                          homeState.sortDescending == false,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 15,
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: homeState.viewType == 'grid' ? 12 : 0,
              ),
            ),
          ],
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              homeState.viewType == 'grid'
                  ? KeepAliveWrapper(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: AppInfiniteStaggeredGrid(
                          pagingController: state,
                          onRefresh: state.refresh,
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
                      ),
                    )
                  : KeepAliveWrapper(
                      child: AppInfiniteList(
                        pagingController: state,
                        onRefresh: state.refresh,
                        itemBuilder: (context, artworkState, index) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(15, 7, 15, 0),
                            child: ContentCard(
                              index: index,
                              artworkState: artworkState,
                            ),
                          );
                        },
                      ),
                    ),
              if (notifier.hasBufferedArtworks)
                Container(
                  margin: const EdgeInsets.only(bottom: 18),
                  width: 185,
                  child: GestureDetector(
                    onTap: () => notifier.mergeBufferedArtworks(
                      homeState.scrollController,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .primaryColor
                                .withValues(alpha: .4),
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Row(
                            children: [
                              IconButton.filled(
                                onPressed: () => notifier.mergeBufferedArtworks(
                                  homeState.scrollController,
                                ),
                                icon: Icon(
                                  Iconsax.arrow_up,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(4, 0, 4, 4),
                                child: const Text(
                                  "New artworks",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
