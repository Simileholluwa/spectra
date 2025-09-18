import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/artwork/artwork.dart';

class CommentContentRoot extends ConsumerWidget {
  const CommentContentRoot({
    super.key,
    required this.index,
    required this.comment,
    required this.username,
    required this.artworkId,
    required this.commentList,
    required this.likes,
    this.showInteractions = true,
  });

  final int index;
  final int artworkId;
  final ArtworkCommentWithUserState comment;
  final String username;
  final PaginatedArtworkCommentList commentList;
  final int likes;
  final bool showInteractions;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(
      artworkCommentInteractionNotifierProvider(
        comment,
      ),
    );
    final notifier = ref.watch(
      artworkCommentInteractionNotifierProvider(
        comment,
      ).notifier,
    );
    return Padding(
      padding: EdgeInsets.only(
        top: index == 0 ? 10 : 0,
        right: 5,
      ),
      child: Column(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    username,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      height: 0,
                    ),
                  ),
                  Text(
                    THelperFunctions.humanizeDateTime(
                      comment.comment.dateCreated!,
                      ref.watch(timeProvider).value ?? DateTime.now(),
                    ),
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontSize: TSizes.fontSizeSm,
                        ),
                  ),
                ],
              ),
              Text(
                comment.comment.text!,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          if (showInteractions)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            notifier.likeComment(comment.comment.id!);
                          },
                          child: Icon(
                            state.isLiked
                                ? Icons.thumb_up
                                : Icons.thumb_up_alt_outlined,
                            color: state.isLiked
                                ? TColors.primary
                                : Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant,
                          ),
                        ),
                        if (likes != 0)
                          Text(
                            ' $likes',
                            style: TextStyle(
                              fontSize: 16,
                              color: state.isLiked
                                  ? TColors.primary
                                  : Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                              fontWeight: state.isLiked
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                        SizedBox(
                          width: likes != 0 ? 10 : 15,
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () async {
                        await commentBottomSheet(
                          context,
                          artworkId,
                          false,
                          comment.comment.id!,
                          username,
                        );
                      },
                      icon: Icon(
                        Icons.reply,
                        size: 28,
                      ),
                    ),
                  ],
                ),
                if (!state.isOwner)
                  GestureDetector(
                    onTap: () async {
                      final res = await deleteCommentDialog(
                        context,
                        comment.comment.type == CommentType.comment,
                      );
                      if (res == true) {
                        commentList.removeComment(
                          comment.comment.id!,
                        );
                        notifier.deleteComment(
                          comment.comment.id!,
                          comment.comment.type == CommentType.comment,
                        );
                        return;
                      }
                    },
                    child: Icon(
                      Icons.delete,
                      size: 22,
                    ),
                  )
                else
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Iconsax.flag5,
                      size: 22,
                    ),
                  ),
              ],
            ),
        ],
      ),
    );
  }
}
