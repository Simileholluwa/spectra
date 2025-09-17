import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';

class ArworkOwnerDetails extends StatelessWidget {
  const ArworkOwnerDetails({
    super.key,
    required this.artwork,
  });

  final Artwork artwork;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 5, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 10,
            children: [
              AppUserProfileImage(
                imageUrl: artwork.user!.user!.imageUrl ?? '',
                radius: 25,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    artwork.user!.username!,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    DateFormat('MMMM d, y - h:mm a').format(
                      artwork.createdAt!,
                    ),
                    style: Theme.of(context).textTheme.labelMedium!,
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Iconsax.more_circle,
            ),
          ),
        ],
      ),
    );
  }
}

// RichText(
                          //   text: TextSpan(
                          //     style: Theme.of(context).textTheme.bodyMedium,
                          //     children: [
                          //       const TextSpan(text: 'Created with '),
                          //       ...List.generate(
                          //         artwork.modelNames!.length,
                          //         (i) {
                          //           final name = artwork.modelNames![i];
                          //           final isLast =
                          //               i == artwork.modelNames!.length - 1;
                          //           final isSecondLast =
                          //               i == artwork.modelNames!.length - 2;
                          //           return TextSpan(
                          //             children: [
                          //               TextSpan(
                          //                 text: name,
                          //                 style: const TextStyle(
                          //                   fontWeight: FontWeight.bold,
                          //                 ),
                          //               ),
                          //               if (!isLast)
                          //                 TextSpan(
                          //                   text: isSecondLast ? ' and ' : ', ',
                          //                 ),
                          //             ],
                          //           );
                          //         },
                          //       ),
                          //       const TextSpan(text: '.'),
                          //     ],
                          //   ),
                          // ),
