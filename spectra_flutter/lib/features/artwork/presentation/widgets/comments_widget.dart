import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/artwork/artwork.dart';

class CommentsWidget extends ConsumerWidget {
  const CommentsWidget({
    super.key,
    required this.artworkId,
    required this.commentCount,
    required this.imageUrl,
  });

  final int artworkId;
  final int commentCount;
  final String imageUrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(
      paginatedArtworkCommentListProvider(
        artworkId,
        null,
        'createdAt',
        true,
      ),
    );
    final artworkUpdates = ref.watch(
      artworkUpdateStreamProvider(
        artworkId,
      ),
    );
    var count = commentCount;
    if (!artworkUpdates.hasError && artworkUpdates.value != null) {
      count = artworkUpdates.value!.commentsCount;
    }
    final notifier = ref.watch(
      paginatedArtworkCommentListProvider(
        artworkId,
        null,
        'createdAt',
        true,
      ).notifier,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Text(
          '${count == 0 ? '' : '$count'} ${count == 1 ? 'Comment' : 'Comments'}',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AddCommentButton(
              imageUrl: imageUrl,
              hintText: 'Add a comment...',
              onTap: () async {
                final comment = await commentBottomSheet(
                  context,
                  artworkId,
                  true,
                  null,
                  null,
                );
                if (comment == null) return;
                notifier.addComment(
                  ArtworkCommentWithUserState(
                    comment: comment,
                  ),
                );
              },
            ),
            if (count != 0) const SizedBox(height: 10),
            CommentsList(
              state: state,
              artworkId: artworkId,
              notifier: notifier,
            ),
          ],
        ),
      ],
    );
  }
}

class CommentsList extends StatelessWidget {
  const CommentsList({
    super.key,
    required this.state,
    required this.artworkId,
    required this.notifier,
  });

  final PagingController<int, ArtworkCommentWithUserState> state;
  final int artworkId;
  final PaginatedArtworkCommentList notifier;

  @override
  Widget build(BuildContext context) {
    return AppInfiniteList(
      shrinkWrap: true,
      onRefresh: state.refresh,
      pagingController: state,
      physics: NeverScrollableScrollPhysics(),
      noItemsFound: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          'No comments yet. Be the first to comment!',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            color: Theme.of(context).hintColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      firstPageLoading: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LoadingAnimationWidget.progressiveDots(
              color: TColors.primary,
              size: 70,
            ),
          ],
        ),
      ),
      firstPageError: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 10,
          children: [
            Text(
              'Failed to load comments. Please try again.',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                color: Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              width: 250,
              height: 50,
              child: FilledButton(
                onPressed: state.refresh,
                child: Text('Retry'),
              ),
            ),
          ],
        ),
      ),
      itemBuilder: (context, comment, index) {
        return Consumer(builder: (context, ref, child) {
          final commentUpdates = ref.watch(
            artworkCommentUpdateStreamProvider(
              comment.comment.id!,
            ),
          );
          var likes = comment.comment.likesCount!;
          var replies = comment.comment.repliesCount!;
          if (!commentUpdates.hasError && commentUpdates.value != null) {
            likes = commentUpdates.value!.likes;
            replies = commentUpdates.value!.repliesCount;
          }
          return CommentTreeWidget(
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
                username: comment.comment.owner!.username ?? '',
                artworkId: artworkId,
                commentList: notifier,
                likes: likes,
              );
            },
          );
        });
      },
    );
  }
}

class AddCommentButton extends StatelessWidget {
  const AddCommentButton({
    super.key,
    required this.imageUrl,
    required this.onTap,
    required this.hintText,
  });

  final String imageUrl;
  final VoidCallback onTap;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: Theme.of(context).cardColor,
        ),
        child: Row(
          spacing: 15,
          children: [
            AppUserProfileImage(
              imageUrl: imageUrl,
              radius: 23,
            ),
            Text(hintText),
          ],
        ),
      ),
    );
  }
}
