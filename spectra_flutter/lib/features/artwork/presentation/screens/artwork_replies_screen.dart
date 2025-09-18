import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/artwork/artwork.dart';

class ArtworkRepliesScreen extends ConsumerWidget {
  const ArtworkRepliesScreen({
    super.key,
    required this.artworkId,
    required this.parentId,
    this.comment,
  });

  final int artworkId;
  final int parentId;
  final ArtworkCommentWithUserState? comment;

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
    final data = ref.watch(
      getCommentProvider(
        comment,
        parentId,
      ),
    );
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
          actions: [
            IconButton(
              onPressed: () {
                state.refresh();
              },
              icon: Icon(
                Iconsax.refresh,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
          ],
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
                imageUrl: !data.hasError && data.value != null
                    ? data.value!.comment.owner!.user!.imageUrl ?? ''
                    : '',
                hintText: 'Add a reply...',
                onTap: () async {
                  final comment = await commentBottomSheet(
                    context,
                    artworkId,
                    false,
                    parentId,
                    !data.hasError && data.value != null
                        ? data.value!.comment.owner!.username
                        : '',
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
        body: data.when(
          data: (data) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Theme.of(context).dividerColor,
                        width: .5,
                      ),
                    ),
                    color: Theme.of(context).cardColor,
                  ),
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
                  child: CommentTreeWidget(
                    data,
                    false,
                    commentId: parentId,
                    artworkId: artworkId,
                    repliesCount: 0,
                    contentRoot: (context, data) {
                      return CommentContentRoot(
                        index: 0,
                        comment: data,
                        username: data.comment.owner!.username ?? '',
                        artworkId: artworkId,
                        commentList: notifier,
                        likes: 0,
                        showInteractions: false,
                      );
                    },
                  ),
                ),
                AppInfiniteList(
                  onRefresh: state.refresh,
                  pagingController: state,
                  shrinkWrap: true,
                  canUpload: false,
                  noItemsFound: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'No replies yet. Be the first to reply!',
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
                          'Failed to load replies. Please try again.',
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
                    final commentState = ref.watch(
                      artworkCommentInteractionNotifierProvider(
                        comment,
                      ),
                    );
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: CommentTreeWidget(
                        comment,
                        commentState.repliesCount != 0,
                        commentId: comment.comment.id!,
                        index: index,
                        artworkId: artworkId,
                        repliesCount: commentState.repliesCount,
                        contentRoot: (context, comment) {
                          return CommentContentRoot(
                            index: index,
                            comment: comment,
                            username: comment.comment.owner?.username ?? '',
                            artworkId: artworkId,
                            commentList: notifier,
                            likes: commentState.likesCount,
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            );
          },
          error: (err, __) {
            return LoadingError(
              errorMessage: err.toString(),
              showRefresh: true,
              onRefresh: () {
                ref.invalidate(getArtworkProvider);
              },
            );
          },
          loading: () {
            return Center(
              child: LoadingAnimationWidget.discreteCircle(
                color: TColors.primary,
                size: 70,
              ),
            );
          },
        ),
      ),
    );
  }
}
