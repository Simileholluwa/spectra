import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_player/video_player.dart';

part 'media_video_player_provider.g.dart';

@riverpod
class MediaVideoPlayer extends _$MediaVideoPlayer {
  Duration lastPosition = Duration.zero;
  @override
  Raw<VideoPlayerController?> build(String? videoUrl) {
    ref.onDispose(() {
      state?.dispose();
    });
    if (videoUrl != null) {
      final regex = RegExp(r'\b(https?://[^\s/$.?#].[^\s]*)\b');
      final isUrlVideo = regex.hasMatch(videoUrl);
      if (isUrlVideo) {
        final player = VideoPlayerController?.networkUrl(
          Uri.parse(videoUrl),
        )..initialize().then((_) {
            state?.play();
            state?.setLooping(true);
            state?.seekTo(lastPosition);
            ref.notifyListeners();
          });

        return player;
      } else if (File(videoUrl).existsSync()) {
        final player = VideoPlayerController.file(
          File(videoUrl),
        )..initialize().then((_) {
            state?.pause();
            state?.setLooping(true);
            state?.seekTo(lastPosition);
            ref.notifyListeners();
          });

        return player;
      } else {
        final player = VideoPlayerController?.asset(
          videoUrl,
        )..initialize().then((_) {
            state?.pause();
            state?.setLooping(true);
            state?.seekTo(lastPosition);
            ref.notifyListeners();
          });

        return player;
      }
    } else {
      return null;
    }
  }

  void savePosition() {
    lastPosition = state?.value.position ?? Duration.zero;
    ref.notifyListeners();
  }

  void seekRelative(int seconds) {
    if (state != null) {
      final current = state!.value.position;
      final target = current + Duration(seconds: seconds);

      state?.seekTo(
        target < Duration.zero
            ? Duration.zero
            : target > state!.value.duration
                ? state!.value.duration
                : target,
      );
    }
  }

  void pausePlay() {
    if (state != null) {
      if (state!.value.isPlaying) {
        state!.pause();
      } else {
        state!.play();
      }
      ref.notifyListeners();
    }
  }

  void muteUnmute() {
    if (state != null) {
      if (state!.value.volume > 0) {
        state!.setVolume(0);
      } else {
        state!.setVolume(1);
      }
      ref.notifyListeners();
    }
  }

  void dispose() {
    if (state != null) {
      state!.dispose();
      ref.notifyListeners();
    }
  }

  void pause() {
    if (state != null) {
      if (state!.value.isPlaying) {
        state!.pause();
        savePosition();
        ref.notifyListeners();
      }
    }
  }

  void play() {
    if (state != null) {
      if (!state!.value.isPlaying) {
        state!.play();
        ref.notifyListeners();
      }
    }
  }

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = duration.inSeconds.remainder(60);
    if (hours > 0) {
      return '${twoDigits(hours)}:${twoDigits(minutes)}:${twoDigits(seconds)}';
    } else {
      return '${twoDigits(minutes)}:${twoDigits(seconds)}';
    }
  }
}
