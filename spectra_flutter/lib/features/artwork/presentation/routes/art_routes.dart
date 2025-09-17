import 'package:spectra_client/spectra_client.dart';
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
          GoRoute(
            path: ':artworkId',
            builder: (context, state) {
              final artworkState = state.extra as ArtworkWithUserState?;
              return ArworkDetailScreen(
                artworkId: int.parse(
                  state.pathParameters['artworkId']!,
                ),
                artworkState: artworkState,
              );
            },
            routes: [
              GoRoute(
                path: 'comment/:commentId/replies',
                builder: (context, state) {
                  return ArtworkRepliesScreen(
                    artworkId: int.parse(
                      state.pathParameters['artworkId']!,
                    ),
                    parentId: int.parse(
                      state.pathParameters['commentId']!,
                    ),
                    comment: state.extra as ArtworkCommentWithUserState?,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
