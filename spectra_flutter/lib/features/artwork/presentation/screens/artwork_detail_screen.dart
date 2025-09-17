import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/artwork/artwork.dart';

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
                Iconsax.flag5,
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
            return RefreshIndicator(
              onRefresh: () => Future.sync(
                () => ref.invalidate(getArtworkProvider),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 15),
                child: Column(
                  spacing: 15,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ArworkOwnerDetails(
                      artwork: artwork,
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
                                  resolution: artwork.resolution!.first,
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
                          ArtworkInteractionDetails(
                            artwork: artwork,
                          ),
                          const Divider(
                            height: 0,
                            thickness: .5,
                          ),
                          if (artwork.showPrompt!)
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 10,
                              ),
                              child: PromptWidget(artwork: artwork),
                            ),
                          if (artwork.showPrompt!)
                            const Divider(
                              height: 0,
                              thickness: .5,
                            ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                              bottom: 15,
                            ),
                            child: TagsWidget(artwork: artwork),
                          ),
                          const Divider(
                            height: 0,
                            thickness: .5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: CommentsWidget(
                              artworkId: artworkId,
                              commentCount: artwork.commentsCount!,
                              imageUrl: artwork.user!.user!.imageUrl ?? '',
                            ),
                          ),
                          const Divider(
                            height: 0,
                            thickness: .5,
                          ),
                          RelatedArtsWidget(
                            artwork: artwork,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
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
      ),
    );
  }
}
