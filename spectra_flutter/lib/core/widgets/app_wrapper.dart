import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spectra_flutter/core/core.dart';

class AppWrapper extends ConsumerWidget {
  const AppWrapper({
    super.key,
    required this.navigatorShell,
  });

  final StatefulNavigationShell navigatorShell;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hideNav = ref.watch(hideNavBarProvider);
    final location =
        navigatorShell.shellRouteContext.routerState.uri.toString();
    final hideBottom = location.contains('/upload') || hideNav;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          navigatorShell,
          AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            crossFadeState: hideBottom
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            secondChild: const SizedBox.shrink(),
            firstChild: AppBottomNavigation(
              navigatorShell: navigatorShell,
            ),
          ),
        ],
      ),
    );
  }
}

class NavigationIconsOverlay extends StatelessWidget {
  const NavigationIconsOverlay({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 3,
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 5,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.red,
          border: Border.all(
            color: Colors.white,
            width: 1,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 11,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
