import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/artwork/artwork.dart';

class RelatedArtsWidget extends ConsumerWidget {
  const RelatedArtsWidget({
    super.key,
    required this.artwork,
  });
  final Artwork artwork;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(
      paginatedRelatedArtworkProvider(
        artwork.id!,
        artwork.tagNames!,
        artwork.modelNames!,
      ),
    );
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Related arts',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        AppInfiniteStaggeredGrid(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          pagingController: state,
          onRefresh: state.refresh,
          noItemsFound: Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              spacing: 10,
              children: [
                Text(
                  'No related arts found. Upload yours below.',
                  style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Theme.of(context).hintColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  width: 250,
                  height: 50,
                  child: FilledButton(
                    onPressed: () {
                      context.push('/artworks/upload');
                    },
                    child: Text('Upload'),
                  ),
                ),
              ],
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
                  'Failed to load related artworks. Please try again.',
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
          itemBuilder: (context, artworkState, index) {
            final artwork = artworkState.artwork;
            return artwork.thumbnailUrl!.length > 1
                ? MultipleImagArt(
                    artworkState: artworkState,
                    index: index,
                    resolution: artwork.resolution!.first,
                    borderRadius: 8,
                  )
                : SingleImageArt(
                    borderRadius: 8,
                    artworkState: artworkState,
                  );
          },
        ),
      ],
    );
  }
}
