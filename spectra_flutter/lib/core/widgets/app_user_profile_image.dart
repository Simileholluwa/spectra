import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class AppUserProfileImage extends StatelessWidget {
  const AppUserProfileImage({
    super.key,
    required this.imageUrl,
    this.radius = 17,
  });

  final String imageUrl;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        errorWidget: (_, __, ___) {
          return const Icon(
            Iconsax.user,
            size: 20,
          );
        },
      ),
    );
  }
}
