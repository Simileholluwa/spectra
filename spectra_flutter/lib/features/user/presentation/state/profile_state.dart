// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';

class ProfileState {
  final String photoUrl;
  final String username;
  final bool isCurrentUser;
  final int followers;
  final int following;
  final bool isFollowing;
  final int artworkCount;
  final String bio;

  ProfileState({
    required this.photoUrl,
    required this.username,
    this.isCurrentUser = false,
    required this.followers,
    required this.following,
    this.isFollowing = false,
    required this.artworkCount,
    required this.bio,
  });

  factory ProfileState.initial(Ref ref, UserWithState userWithState) {
    final userId = ref.watch(sessionProvider).signedInUser?.id;
    final user = userWithState.user;
    return ProfileState(
      photoUrl: user.user!.imageUrl ?? '',
      username: user.username!,
      isCurrentUser: userId == user.id,
      followers: user.followersCount!,
      following: user.followingCount!,
      artworkCount: user.artworksCount!,
      isFollowing: userWithState.isFollowing,
      bio: user.bio!,
    );
  }

  ProfileState copyWith({
    String? photoUrl,
    String? username,
    bool? isCurrentUser,
    int? followers,
    int? following,
    bool? isFollowing,
    int? artworkCount,
    String? bio,
  }) {
    return ProfileState(
      photoUrl: photoUrl ?? this.photoUrl,
      username: username ?? this.username,
      isCurrentUser: isCurrentUser ?? this.isCurrentUser,
      followers: followers ?? this.followers,
      following: following ?? this.following,
      isFollowing: isFollowing ?? this.isFollowing,
      artworkCount: artworkCount ?? this.artworkCount,
      bio: bio ?? this.bio,
    );
  }
}
