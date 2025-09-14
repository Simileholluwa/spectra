import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/home/home.dart';

class ArworkDetailScreen extends ConsumerWidget {
  const ArworkDetailScreen({
    super.key,
    required this.artworkState,
    required this.artworkId,
  });

  final ArtworkWithUserState? artworkState;
  final int artworkId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(
      getArtworkProvider(
        artworkState,
        artworkId,
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
          title: const Text('Detail'),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(5),
            child: Divider(
              height: 0,
              thickness: .5,
            ),
          ),
          actions: [
            artworkState == null
                ? IconButton(
                    onPressed: null,
                    icon: Icon(
                      Iconsax.heart,
                    ),
                  )
                : LikeButton(
                    artworkState: artworkState!,
                  ),
            if (artworkState?.artwork.allowDownload ?? false)
              artworkState == null
                  ? IconButton(
                      onPressed: null,
                      icon: Icon(
                        Iconsax.document_download,
                      ),
                    )
                  : DownloadButton(
                      artworkState: artworkState!,
                      isVideo:
                          artworkState!.artwork.mediaType == MediaType.video,
                      currentIndex: 0,
                    ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.share,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Iconsax.flag,
                color: Colors.red,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
          ],
        ),
        body: data.when(
          data: (data) {
            final artwork = data.artwork;
            final artworkUpdates = ref.watch(
              artworkUpdateStreamProvider(
                artworkId,
              ),
            );
            var commentCount = artwork.commentsCount;
            if (!artworkUpdates.hasError && artworkUpdates.value != null) {
              commentCount = artworkUpdates.value!.commentsCount;
            }
            return SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 15),
              child: Column(
                spacing: 15,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
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
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                Text(
                                  DateFormat('MMMM d, y - h:mm a').format(
                                    artwork.createdAt!,
                                  ),
                                  style:
                                      Theme.of(context).textTheme.labelMedium!,
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
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      spacing: 15,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        artwork.mediaType == MediaType.video
                            ? VideoArt(
                                videoUrl: artwork.mediaUrl!.first,
                                index: 0,
                                videoThumbnail: artwork.thumbnailUrl!.first,
                              )
                            : artwork.thumbnailUrl!.length > 1
                                ? MultipleImagArt(
                                    artworkState: data,
                                    index: 1,
                                    resolution: artwork.resolution!.first,
                                    borderRadius: 12,
                                  )
                                : SingleImageArt(
                                    borderRadius: 12,
                                    artworkState: data,
                                  ),
                        RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.bodyMedium,
                            children: [
                              const TextSpan(text: 'Created with '),
                              ...List.generate(
                                artwork.modelNames!.length,
                                (i) {
                                  final name = artwork.modelNames![i];
                                  final isLast =
                                      i == artwork.modelNames!.length - 1;
                                  final isSecondLast =
                                      i == artwork.modelNames!.length - 2;
                                  return TextSpan(
                                    children: [
                                      TextSpan(
                                        text: name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      if (!isLast)
                                        TextSpan(
                                          text: isSecondLast ? ' and ' : ', ',
                                        ),
                                    ],
                                  );
                                },
                              ),
                              const TextSpan(text: '.'),
                            ],
                          ),
                        ),
                        const Divider(
                          height: 0,
                          thickness: .5,
                          indent: 3,
                          endIndent: 3,
                        ),
                        if (artwork.showPrompt!) PromptWidget(artwork: artwork),
                        CommentsWidget(
                          artworkId: artworkId,
                          commentCount: commentCount!,
                          imageUrl: artwork.user!.user!.imageUrl ?? '',
                        ),
                        TagsWidget(artwork: artwork),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
          error: (err, _) {
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
        bottomNavigationBar: data.value != null
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [],
              )
            : null,
      ),
    );
  }
}
