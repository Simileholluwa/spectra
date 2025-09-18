import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/artwork/artwork.dart';

class ArtworkScreen extends ConsumerWidget {
  const ArtworkScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uploadProgressState = ref.watch(uploadStagesProvider);
    final homeState = ref.watch(
      artworkScreenNotifierProvider,
    );
    final artworkNotifier = ref.watch(
      artworkScreenNotifierProvider.notifier,
    );
    final state = ref.watch(
      paginatedArtworkListProvider(
        homeState.filter,
        homeState.sortBy,
        homeState.sortDescending,
      ),
    );
    final notifier = ref.watch(
      paginatedArtworkListProvider(
        homeState.filter,
        homeState.sortBy,
        homeState.sortDescending,
      ).notifier,
    );
    final user = ref.watch(sessionProvider).signedInUser;
    final imageUrl = user?.imageUrl;
    final username = user?.userName;
    return AppAndroidBottomNav(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: uploadProgressState.idle == false ? 50 : 0,
          title: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: uploadProgressState.idle == false
                ? UploadProgressWidget()
                : const SizedBox.shrink(),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(
              uploadProgressState.idle == false ? 5 : 0,
            ),
            child: Divider(
              height: 0,
              thickness: .5,
            ),
          ),
        ),
        body: NestedScrollView(
          controller: notifier.scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              floating: true,
              snap: true,
              title: GestureDetector(
                onTap: () => context.push('/$username'),
                child: AppUserProfileImage(
                  imageUrl: imageUrl ?? '',
                  radius: 22,
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
                        artworkNotifier.setViewType(
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
                        artworkNotifier.setViewType(
                          'list',
                        );
                      },
                      icon: Icons.view_list_rounded,
                      isActive: homeState.viewType == 'list',
                    ),
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Row(
                  children: [
                    ActionButtons(
                      isLeft: true,
                      onTap: () async {
                        ref.watch(hideNavBarProvider.notifier).setBool(true);
                        await filterBottomSheet(context);
                        ref.watch(hideNavBarProvider.notifier).setBool(false);
                      },
                      icon: Icons.filter_alt,
                      isActive: homeState.filter != null,
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
                      onTap: () async {
                        ref.watch(hideNavBarProvider.notifier).setBool(true);
                        await sortPopOver(context);
                        ref.watch(hideNavBarProvider.notifier).setBool(false);
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
          body: homeState.viewType == 'grid'
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
        ),
      ),
    );
  }
}
