import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/home/home.dart';

class RepliesScreen extends ConsumerWidget {
  const RepliesScreen({
    super.key,
    required this.artworkId,
    required this.parentId,
  });

  final int artworkId;
  final int parentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(
      paginatedArtworkCommentListProvider(
        artworkId,
        parentId,
        'createdAt',
        true,
      ),
    );
    final notifier = ref.watch(
      paginatedArtworkCommentListProvider(
        artworkId,
        parentId,
        'createdAt',
        true,
      ).notifier,
    );
    var username = '';
    return AppAndroidBottomNav(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(
              Iconsax.arrow_left_2,
            ),
          ),
          titleSpacing: 0,
          title: const Text('Replies'),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(5),
            child: Divider(
              height: 0,
              thickness: .5,
            ),
          ),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(
              height: 0,
              thickness: .5,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
              child: AddCommentButton(
                imageUrl: '',
                hintText: 'Add a reply...',
                onTap: () async {
                  final comment = await commentBottomSheet(
                    context,
                    artworkId,
                    false,
                    parentId,
                    username,
                  );
                  if (comment == null) return;
                  notifier.addComment(
                    ArtworkCommentWithUserState(
                      comment: comment,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        body: AppInfiniteList(
          onRefresh: state.refresh,
          pagingController: state,
          canUpload: false,
          itemBuilder: (context, comment, index) {
            final commentUpdates = ref.watch(
              artworkCommentUpdateStreamProvider(
                comment.comment.id!,
              ),
            );
            log(comment.toString());
            username = comment.comment.owner?.username ?? '';
            var likes = comment.comment.likesCount!;
            var replies = comment.comment.repliesCount!;
            if (!commentUpdates.hasError && commentUpdates.value != null) {
              likes = commentUpdates.value!.likes;
              replies = commentUpdates.value!.repliesCount;
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CommentTreeWidget(
                comment,
                replies != 0,
                commentId: comment.comment.id!,
                index: index,
                artworkId: artworkId,
                repliesCount: replies,
                contentRoot: (context, comment) {
                  return CommentContentRoot(
                    index: index,
                    comment: comment,
                    username: comment.comment.owner?.username ?? '',
                    artworkId: artworkId,
                    commentList: notifier,
                    likes: likes,
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
