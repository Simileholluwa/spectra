// ignore_for_file: avoid_manual_providers_as_generated_provider_dependency
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/auth/auth.dart';
import 'package:spectra_flutter/features/artwork/artwork.dart';
import 'package:spectra_flutter/features/user/user.dart';
part 'router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter router(Ref ref) {
  ref.watch(bootStrapProvider);
  return GoRouter(
    initialLocation: '',
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return SizedBox();
        },
        redirect: (context, state) async {
          final isSignedIn = ref.watch(sessionProvider).isSignedIn;
          if (isSignedIn) {
            return ArtRoutes.namespace;
          } else {
            return '/auth';
          }
        },
      ),
      StatefulShellRoute.indexedStack(
        branches: [
          ArtRoutes.branch,
        ],
        builder: (context, state, navigationShell) {
          return AppWrapper(
            navigatorShell: navigationShell,
          );
        },
      ),
      GoRoute(
        path: '/auth',
        builder: (context, state) => const AuthLandingScreen(),
        routes: [
          GoRoute(
            path: 'login',
            builder: (context, state) => const LoginScreen(),
          ),
          GoRoute(
            path: 'forgotPassword',
            builder: (context, state) => const ForgotPasswordScreen(),
            routes: [
              GoRoute(
                path: 'verifyPasswordReset',
                builder: (context, state) =>
                    const VerifyPasswordResetCodeScreen(),
                routes: [
                  GoRoute(
                    path: 'newPassword',
                    builder: (context, state) => const NewPasswordScreen(),
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: 'createAccount',
            builder: (context, state) => const CreateAccountScreen(),
            routes: [
              GoRoute(
                path: 'validateCreateAccount',
                builder: (context, state) =>
                    const ValidateCreateAccountScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/:username',
        builder: (context, state) => UserProfileScreen(
          username: state.pathParameters['username']!,
        ),
        routes: [
          GoRoute(
            path: 'arts/:artworkId',
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
