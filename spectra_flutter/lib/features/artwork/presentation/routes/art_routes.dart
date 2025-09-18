import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spectra_flutter/features/artwork/artwork.dart';
import 'package:spectra_flutter/features/upload/upload.dart';

class ArtRoutes {
  static String namespace = '/artworks';
  static final shellNavigatorKey = GlobalKey<NavigatorState>(
    debugLabel: 'Art routes',
  );

  static StatefulShellBranch branch = StatefulShellBranch(
    navigatorKey: shellNavigatorKey,
    routes: [
      GoRoute(
        path: namespace,
        builder: (_, state) {
          return ArtworkScreen();
        },
        routes: [
          GoRoute(
            path: 'upload',
            builder: (context, state) => const UploadScreen(),
          ),
        ],
      ),
    ],
  );
}
