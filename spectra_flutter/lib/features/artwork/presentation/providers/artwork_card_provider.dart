import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/artwork/artwork.dart';
part 'artwork_card_provider.g.dart';

@riverpod
class ArtworkCardNotifier extends _$ArtworkCardNotifier {
  @override
  ArtworkCardState build(ArtworkWithUserState? artworkState) {
    return ArtworkCardState.initial(artworkState);
  }

  void setCurrentImageIndex(String postId, int index) {
    state = state.copyWith(
      currentImageIndex: {
        ...state.currentImageIndex,
        postId: index,
      },
    );
  }

  void setIsLiked() {
    if (state.isLiked) {
      state = state.copyWith(isLiked: false);
    } else {
      state = state.copyWith(isLiked: true);
    }
  }

  void setIsDownloaded() {
    state = state.copyWith(isDownloaded: true);
  }

  Future<void> toggleLike(int artworkId) async {
    setIsLiked();
    final usecase = ref.read(toggleLikeProvider);
    final result = await usecase.call(
      ToggleLikeParams(
        artworkId,
      ),
    );
    result.fold((failure) {
      log(failure.message);
    }, (_) {
      return;
    });
  }

  Future<void> updateDownloadsCount(int artworkId) async {
    final usecase = ref.read(updateDownloadsCountProvider);
    final result = await usecase.call(
      UpdateDownloadsCountParams(
        artworkId,
      ),
    );
    result.fold((failure) {
      log(failure.message);
    }, (_) {
      return;
    });
  }

  Future<void> updateViewsCount(int artworkId) async {
    final usecase = ref.read(updateViewsCountProvider);
    final result = await usecase.call(
      UpdateViewsCountParams(
        artworkId,
      ),
    );
    result.fold((failure) {
      log(failure.message);
    }, (_) {
      return;
    });
  }

  Future<void> saveNetworkImage(
    String url,
    int artworkId,
  ) async {
    setIsDownloaded();
    TToastMessages.infoToast(
      'Download started...',
      closeDuration: 2,
    );
    try {
      var response = await Dio().get(
        url,
        options: Options(
          responseType: ResponseType.bytes,
        ),
      );

      await ImageGallerySaverPlus.saveImage(
        Uint8List.fromList(response.data),
        quality: 60,
        name: url.split('/').last,
      );

      state = state.copyWith(downloadProgress: 0.0);
      unawaited(
        updateDownloadsCount(
          artworkId,
        ),
      );
      TToastMessages.successToast(
        'Image has been saved to your gallery.',
      );
    } catch (e) {
      state = state.copyWith();
      TToastMessages.errorToast(
        e.toString(),
      );
    }
  }

  Future<void> saveNetworkVideoFile(
    String url,
    int artworkId,
  ) async {
    setIsDownloaded();
    TToastMessages.infoToast(
      'Download started...',
      closeDuration: 2,
    );
    var appDocDir = await getTemporaryDirectory();
    String savePath = "${appDocDir.path}/temp.mp4";
    try {
      await Dio().download(
        url,
        savePath,
      );

      await ImageGallerySaverPlus.saveFile(
        savePath,
      );
      state = state.copyWith(downloadProgress: 0.0);
      unawaited(
        updateDownloadsCount(
          artworkId,
        ),
      );
      TToastMessages.successToast(
        'Video has been saved to your gallery.',
      );
    } catch (e) {
      state = state.copyWith();
      TToastMessages.errorToast(
        e.toString(),
      );
    }
  }
}
