import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/artwork/artwork.dart';
import 'package:spectra_flutter/features/user/user.dart';

class UserProfileScreen extends ConsumerWidget {
  const UserProfileScreen({
    super.key,
    required this.username,
  });

  final String username;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = ref.watch(userScreenTabControllerProvider);
    final data = ref.watch(
      getUserProvider(
        username,
      ),
    );
    return AppAndroidBottomNav(
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (!didPop) context.go('/artworks');
        },
        child: Scaffold(
          body: data.when(
            data: (user) {
              final pagingController = ref.watch(
                paginatedUserArtworksProvider(
                  username,
                  'createdAt',
                  true,
                ),
              );
              final likesPagingController = ref.watch(
                paginatedUserLikedArtworksProvider(
                  username,
                  true,
                ),
              );
              final downloadsPagingController = ref.watch(
                paginatedUserDownloadedArtworksProvider(
                  username,
                  true,
                ),
              );
              return NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverAppBar(
                    pinned: true,
                    leading: IconButton(
                      onPressed: () {
                        context.go('/artworks');
                      },
                      icon: const Icon(Iconsax.arrow_left_2),
                    ),
                    actions: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Iconsax.setting,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
                    sliver: SliverToBoxAdapter(
                      child: Column(
                        spacing: 10,
                        children: [
                          Row(
                            spacing: 10,
                            children: [
                              AppUserProfileImage(
                                imageUrl: user.user!.imageUrl ?? '',
                                radius: 35,
                                iconSize: 40,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      username,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: '${user.followersCount!} ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .color,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'followers',
                                            style: TextStyle(
                                              color:
                                                  Theme.of(context).hintColor,
                                            ),
                                          ),
                                          const WidgetSpan(
                                            alignment:
                                                PlaceholderAlignment.middle,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 6),
                                              child: Icon(
                                                Icons.circle,
                                                size: 6,
                                                color: TColors.secondary,
                                              ),
                                            ),
                                          ),
                                          TextSpan(
                                            text: '${user.followingCount!} ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .color,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'following',
                                            style: TextStyle(
                                              color:
                                                  Theme.of(context).hintColor,
                                            ),
                                          ),
                                          const WidgetSpan(
                                            alignment:
                                                PlaceholderAlignment.middle,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 6),
                                              child: Icon(
                                                Icons.circle,
                                                size: 6,
                                                color: TColors.secondary,
                                              ),
                                            ),
                                          ),
                                          TextSpan(
                                            text: '${user.artworksCount!} ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .color,
                                            ),
                                          ),
                                          TextSpan(
                                            text: 'artworks',
                                            style: TextStyle(
                                              color:
                                                  Theme.of(context).hintColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                            child: Row(
                              spacing: 15,
                              children: [
                                Expanded(
                                  child: OutlinedButton(
                                    style: ButtonStyle(
                                      foregroundColor: WidgetStatePropertyAll(
                                        Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .color,
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 4,
                                      ),
                                      child: Text(
                                        'Edit profile',
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: OutlinedButton(
                                    style: ButtonStyle(
                                      foregroundColor: WidgetStatePropertyAll(
                                        Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .color,
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 4,
                                      ),
                                      child: Text(
                                        'Share profile',
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: UserProfileTabBarDelegate(
                      tabBar: AppTabBarDesign(
                        tabController: tabController,
                        showTopBorder: true,
                        tabs: [
                          Tab(
                            text: 'ARTWORKS',
                          ),
                          Tab(
                            text: 'LIKES',
                          ),
                          Tab(
                            text: 'DOWNLOADS',
                          ),
                          Tab(
                            text: 'COMMENTS',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
                body: TabBarView(
                  controller: tabController,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                      child: AppInfiniteStaggeredGrid(
                        padding: EdgeInsets.zero,
                        onRefresh: pagingController.refresh,
                        pagingController: pagingController,
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
                    Padding(
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
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                      child: AppInfiniteStaggeredGrid(
                        padding: EdgeInsets.zero,
                        onRefresh: downloadsPagingController.refresh,
                        pagingController: downloadsPagingController,
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
                    Container(),
                  ],
                ),
              );
            },
            error: (err, _) {
              return LoadingError(
                errorMessage: err.toString(),
                showRefresh: true,
                onRefresh: () {
                  ref.invalidate(getUserProvider);
                },
              );
            },
            loading: () {
              return Center(
                child: LoadingAnimationWidget.discreteCircle(
                  color: TColors.primary,
                  size: 70,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class UserProfileTabBarDelegate extends SliverPersistentHeaderDelegate {
  const UserProfileTabBarDelegate({
    required this.tabBar,
  });

  final Widget tabBar;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      height: maxExtent,
      child: Center(child: tabBar),
    );
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(covariant UserProfileTabBarDelegate oldDelegate) {
    return false;
  }
}
