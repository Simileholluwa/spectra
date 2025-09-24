import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/user/user.dart';

class FollowOrEditButton extends ConsumerWidget {
  const FollowOrEditButton({
    super.key,
    required this.username,
    required this.userWithState,
  });

  final String username;
  final UserWithState userWithState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(
      profileNotifierProvider(
        userWithState,
      ),
    );
    final userNotifier = ref.watch(
      profileNotifierProvider(
        userWithState,
      ).notifier,
    );
    return Expanded(
      child: OutlinedButton(
        style: ButtonStyle(
          foregroundColor: WidgetStatePropertyAll(
            userState.isCurrentUser
                ? null
                : userState.isFollowing
                    ? Theme.of(context).textTheme.bodyMedium!.color
                    : TColors.white,
          ),
          side: userState.isCurrentUser
              ? null
              : WidgetStatePropertyAll(
                  BorderSide(
                    color: userState.isFollowing
                        ? Theme.of(context).colorScheme.outline
                        : TColors.primary,
                  ),
                ),
          backgroundColor: WidgetStatePropertyAll(
            userState.isCurrentUser
                ? null
                : userState.isFollowing
                    ? null
                    : TColors.primary,
          ),
        ),
        onPressed: userState.isCurrentUser
            ? () {}
            : () {
                userNotifier.toggleFollow(
                  username,
                );
              },
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 4,
          ),
          child: Text(
            userState.isCurrentUser
                ? 'Edit profile'
                : userState.isFollowing
                    ? 'Following'
                    : 'Follow',
            style: TextStyle(
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
