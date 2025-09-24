import 'package:flutter/material.dart';

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
