import 'package:cached_network_image/cached_network_image.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:spectra_flutter/features/artwork/artwork.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoArt extends ConsumerWidget {
  const VideoArt({
    super.key,
    required this.videoUrl,
    required this.index,
    this.videoThumbnail,
    this.resolution,
  });

  final String videoUrl;
  final int index;
  final String? videoThumbnail;
  final String? resolution;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return VisibilityDetector(
      key: Key(videoUrl),
      onVisibilityChanged: (info) async {
        final visibleFraction = info.visibleFraction;
        final visiblePercentage = info.visibleFraction * 100;
        ref
            .read(
              videoVisibilityProvider.notifier,
            )
            .updateVisibility(
              index,
              visibleFraction,
            );
        final controllerNotifier = ref.watch(
          mediaVideoPlayerProvider(videoUrl).notifier,
        );
        final isActive = ref.watch(activeVideoIndexProvider) == index;
        if (isActive && visiblePercentage == 100) {
          controllerNotifier.play();
        } else {
          controllerNotifier.pause();
        }
      },
      child: AppVideoPlayer(
        videoUrl: videoUrl,
        videoThumbnail: videoThumbnail,
        resolution: resolution,
      ),
    );
  }
}

class AppVideoPlayer extends StatelessWidget {
  const AppVideoPlayer({
    super.key,
    required this.videoUrl,
    this.videoThumbnail,
    this.resolution,
  });

  final String videoUrl;
  final String? videoThumbnail;
  final String? resolution;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 700,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: .5,
          color: Theme.of(context).dividerColor,
        ),
      ),
      child: VideoPlayerWidget(
        videoUrl: videoUrl,
        videoThumbnail: videoThumbnail,
        resolution: resolution,
      ),
    );
  }
}

class VideoPlayerWidget extends StatelessWidget {
  const VideoPlayerWidget({
    super.key,
    required this.videoUrl,
    this.videoThumbnail,
    this.useBorderRadius = true,
    this.resolution,
  });

  final String videoUrl;
  final bool useBorderRadius;
  final String? videoThumbnail;
  final String? resolution;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final controller = ref.watch(
        mediaVideoPlayerProvider(videoUrl),
      );
      final controllerNotifier = ref.watch(
        mediaVideoPlayerProvider(videoUrl).notifier,
      );
      if (controller == null || !controller.value.isInitialized) {
        return ClipRRect(
          borderRadius:
              useBorderRadius ? BorderRadius.circular(12) : BorderRadius.zero,
          child: videoThumbnail != null
              ? Stack(
                  alignment: Alignment.center,
                  children: [
                    CachedNetworkImage(
                      imageUrl: videoThumbnail!,
                      fit: BoxFit.cover,
                      placeholder: (_, __) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).dividerColor,
                              width: .5,
                            ),
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                          ),
                          child: AspectRatio(
                            aspectRatio: resolution == null
                                ? 1
                                : double.parse(
                                    resolution!,
                                  ),
                          ),
                        );
                      },
                    ),
                    CircularProgressIndicator(),
                  ],
                )
              : const AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
        );
      }
      return GestureDetector(
        onTap: () {
          controllerNotifier.pausePlay();
        },
        child: AspectRatio(
          aspectRatio: controller.value.aspectRatio,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ClipRRect(
                borderRadius: useBorderRadius
                    ? BorderRadius.circular(12)
                    : BorderRadius.zero,
                child: AspectRatio(
                  aspectRatio: controller.value.aspectRatio,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: SizedBox(
                      width: controller.value.size.width,
                      height: controller.value.size.height,
                      child: VideoPlayer(
                        controller,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                left: 0,
                right: MediaQuery.of(context).size.width / 2,
                child: GestureDetector(
                  onDoubleTap: () => controllerNotifier.seekRelative(-10),
                  behavior: HitTestBehavior.opaque,
                ),
              ),
              Positioned.fill(
                left: MediaQuery.of(context).size.width / 2,
                right: 0,
                child: GestureDetector(
                  onDoubleTap: () => controllerNotifier.seekRelative(10),
                  behavior: HitTestBehavior.opaque,
                ),
              ),
              Positioned(
                top: 10,
                right: 15,
                child: ValueListenableBuilder<VideoPlayerValue>(
                    valueListenable: controller,
                    builder: (context, value, child) {
                      final position = value.position;
                      return Text(
                        controllerNotifier.formatDuration(
                          position,
                        ),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      );
                    }),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedOpacity(
                  opacity: controller.value.isPlaying ? 0 : 1,
                  duration: const Duration(milliseconds: 300),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                    decoration: BoxDecoration(
                      color: Colors.black.withValues(
                        alpha: .1,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(
                          TSizes.md,
                        ),
                        bottomRight: Radius.circular(
                          TSizes.md,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        // Play/Pause Button
                        IconButton(
                          icon: Icon(
                            controller.value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow,
                            color: Colors.white,
                            size: 20,
                          ),
                          onPressed: controllerNotifier.pausePlay,
                        ),
                        // Mute/Unmute Button
                        IconButton(
                          icon: Icon(
                            controller.value.volume > 0
                                ? Icons.volume_off
                                : Icons.volume_up,
                            color: Colors.white,
                            size: 20,
                          ),
                          onPressed: controllerNotifier.muteUnmute,
                        ),
                        const Spacer(),
                        // Total Duration
                        Text(
                          controllerNotifier.formatDuration(
                            controller.value.duration,
                          ),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
