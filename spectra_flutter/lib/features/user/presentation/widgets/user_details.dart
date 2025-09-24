import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/user/user.dart';

class UserDetails extends ConsumerWidget {
  const UserDetails({
    super.key,
    required this.userWithState,
  });

  final UserWithState userWithState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(
      profileNotifierProvider(
        userWithState,
      ),
    );
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              userState.username,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              userState.bio,
              style: TextStyle(
                fontSize: 16,
                height: 1.2,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${userState.followers} ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyMedium!.color,
                    ),
                  ),
                  TextSpan(
                    text: 'followers',
                    style: TextStyle(
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  const WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      child: Icon(
                        Icons.circle,
                        size: 6,
                        color: TColors.secondary,
                      ),
                    ),
                  ),
                  TextSpan(
                    text: '${userState.following} ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyMedium!.color,
                    ),
                  ),
                  TextSpan(
                    text: 'following',
                    style: TextStyle(
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  const WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6),
                      child: Icon(
                        Icons.circle,
                        size: 6,
                        color: TColors.secondary,
                      ),
                    ),
                  ),
                  TextSpan(
                    text: '${userState.artworkCount} ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).textTheme.bodyMedium!.color,
                    ),
                  ),
                  TextSpan(
                    text: 'artworks',
                    style: TextStyle(
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
