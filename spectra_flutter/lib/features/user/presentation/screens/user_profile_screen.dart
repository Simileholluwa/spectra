import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:spectra_flutter/core/core.dart';
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
    final data = ref.watch(getUserProvider(username));
    return AppAndroidBottomNav(
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (!didPop) context.go('/artworks');
        },
        child: Scaffold(
          body: data.when(
            data: (userWithState) {
              final userState = ref.watch(
                profileNotifierProvider(userWithState),
              );
              return NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  SliverAppBar(
                    pinned: true,
                    title: AnimatedCrossFade(
                      crossFadeState: innerBoxIsScrolled
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: const Duration(milliseconds: 300),
                      secondChild: const SizedBox(),
                      firstChild: Text(
                        username,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ),
                    leading: IconButton(
                      onPressed: () {
                        context.go('/artworks');
                      },
                      icon: const Icon(Iconsax.arrow_left_2),
                    ),
                    actions: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          userState.isCurrentUser
                              ? Iconsax.setting
                              : Iconsax.notification,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 10,
                            children: [
                              AppUserProfileImage(
                                imageUrl: userState.photoUrl,
                                radius: 35,
                                iconSize: 40,
                              ),
                              UserDetails(userWithState: userWithState),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                            child: Row(
                              spacing: 15,
                              children: [
                                FollowOrEditButton(
                                  userWithState: userWithState,
                                  username: username,
                                ),
                                ShareProfileButton(),
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
                          Tab(text: 'ARTWORKS'),
                          Tab(text: 'LIKES'),
                          Tab(text: 'DOWNLOADS'),
                          Tab(text: 'COMMENTS'),
                        ],
                      ),
                    ),
                  ),
                ],
                body: TabBarView(
                  controller: tabController,
                  children: [
                    UserArtworks(username: username),
                    UserLikedArtworks(username: username),
                    UserDownloadedArtworks(username: username),
                    Container(),
                  ],
                ),
              );
            },
            error: (err, _) {
              return Center(
                child: LoadingError(
                  errorMessage: err.toString(),
                  showRefresh: true,
                  onRefresh: () {
                    ref.invalidate(getUserProvider);
                  },
                ),
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
