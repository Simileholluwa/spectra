import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/upload/upload.dart';
part 'upload_provider.g.dart';

@riverpod
class Upload extends _$Upload {
  final imageHelper = ImageHelper();
  @override
  UploadState build() {
    ref.onDispose(() {
      state.tagInputController.dispose();
      state.promptController.dispose();
      state.modelInputController.dispose();
    });
    return UploadState.empty();
  }

  void controlCarousel() {
    if (state.isSuccess && !state.isAgreementChecked) {
      state.carouselController.animateToPage(2);
    } else if (state.filePath.isEmpty) {
      state.carouselController.animateToPage(0);
    } else if (state.isSearching) {
      state.carouselController.animateToPage(1);
    } else if (state.isSuccess && state.isAgreementChecked) {
      state.carouselController.animateToPage(3);
    }
  }

  void addFilePath(List<String> filePath) {
    state = state.copyWith(
      filePath: [
        ...state.filePath,
        ...filePath,
      ],
    );
  }

  void setFilePath(List<String> filePath) {
    state = state.copyWith(
      filePath: filePath,
    );
  }

  void removeFilePath(String filePath) {
    final updatedFiles = List<String>.from(
      state.filePath,
    )..remove(
        filePath,
      );
    final updatedResponses = List<SearchVectorResponse>.from(
      state.searchVectorResponse,
    )..removeWhere(
        (e) => e.fileName == filePath.split('/').last,
      );
    if (state.filePath.isEmpty) {
      reset();
    }
    state = state.copyWith(
      filePath: updatedFiles,
      searchVectorResponse: updatedResponses,
      hasError: updatedResponses.any((e) => e.isDuplicate),
      isSuccess: !updatedResponses.any((e) => e.isDuplicate),
    );
  }

  void setHasError(bool hasError) {
    state = state.copyWith(hasError: hasError);
  }

  void setIsSearching(bool isSearching) {
    state = state.copyWith(isSearching: isSearching);
  }

  void setIsSuccess(bool isSuccess) {
    state = state.copyWith(isSuccess: isSuccess);
  }

  void addModel(String model) {
    final updatedModels = List<String>.from(state.models)..insert(0, model);
    state = state.copyWith(models: updatedModels);
  }

  void removeModel(String model) {
    final updatedModels = List<String>.from(state.models)..remove(model);
    state = state.copyWith(models: updatedModels);
  }

  void setModels(List<String> models) {
    state = state.copyWith(models: models);
  }

  void setPrompt(String promptMessage) {
    if (promptMessage.isEmpty) {
      return;
    }
    state = state.copyWith(
      promptMessage: promptMessage,
      showPrompt: true,
    );
  }

  void toggleAllowDownload() {
    state = state.copyWith(
      allowDownload: !state.allowDownload,
    );
  }

  void setIsLoading(bool value) {
    state = state.copyWith(isLoading: value);
  }

  void toggleShowPrompt() {
    if (state.promptMessage.isEmpty) {
      TToastMessages.infoToast(
        'Please type in or paste your prompt message before toggling this option.',
      );
      return;
    }
    state = state.copyWith(showPrompt: !state.showPrompt);
  }

  void setFileType(MediaType mediaType) {
    state = state.copyWith(mediaType: mediaType);
  }

  void reset() {
    state = state.copyWith(
      filePath: [],
      hasError: false,
      isSuccess: false,
      isSearching: false,
      tags: [],
      models: [],
      promptMessage: '',
      allowDownload: false,
      showPrompt: false,
      topLevelError: false,
      errorMessage: '',
      isAgreementChecked: false,
      promptController: state.promptController..clear(),
      tagInputController: state.tagInputController..clear(),
      modelInputController: state.modelInputController..clear(),
    );
    controlCarousel();
  }

  void setTags(List<String> tags) {
    state = state.copyWith(tags: tags);
  }

  void addTag(String tag) {
    final updatedTags = List<String>.from(state.tags)..insert(0, tag);
    state = state.copyWith(tags: updatedTags);
  }

  void addMultipleTags(List<String> tags) {
    final updatedTags = List<String>.from(state.tags)..addAll(tags);
    state = state.copyWith(tags: updatedTags);
  }

  void toggleAgreement() {
    if (state.hasError || state.topLevelError) {
      TToastMessages.infoToast(
        'Please resolve the error in your upload before agreeing to the terms.',
      );
      return;
    } else if (state.tags.isEmpty) {
      TToastMessages.infoToast(
        'Please add at least one tag before agreeing to the terms.',
      );
      return;
    } else if (state.models.isEmpty) {
      TToastMessages.infoToast(
        'Please add at least one model before agreeing to the terms.',
      );
      return;
    }
    state = state.copyWith(isAgreementChecked: !state.isAgreementChecked);
    controlCarousel();
  }

  void removeTag(String tag) {
    final updatedTags = List<String>.from(state.tags)..remove(tag);
    state = state.copyWith(tags: updatedTags);
  }

  void addTagOnTextChanged(String value) {
    if (value.contains('\n')) {
      final parts = value.split('\n');

      for (var i = 0; i < parts.length - 1; i++) {
        final newTag = parts[i].trim().toLowerCase();
        if (newTag.isNotEmpty && !state.tags.contains(newTag)) {
          addTag(newTag);
        }
      }

      final remaining = parts.last.trim();
      state.tagInputController.text = remaining;
      state.tagInputController.selection = TextSelection.fromPosition(
        TextPosition(offset: remaining.length),
      );
    }
  }

  void addModelOnTextChanged(String value) {
    if (value.contains('\n')) {
      final parts = value.split('\n');
      final newModel = parts.first.trim().toLowerCase();

      if (newModel.isNotEmpty && !state.models.contains(newModel)) {
        addModel(newModel);
      }

      final remaining = parts.sublist(1).join('\n').trim();
      state.modelInputController.text = remaining;
      state.modelInputController.selection = TextSelection.fromPosition(
        TextPosition(offset: remaining.length),
      );
    }
  }

  Future<void> pickVideo() async {
    final video = await imageHelper.pickVideo();
    if (video != null) {
      // final fileSizeInBytes = await video.length();
      // final fileSizeInMB = fileSizeInBytes ~/ (1024 * 1024);
      // if (fileSizeInMB > 20) {
      //   TToastMessages.infoToast(
      //     'File size must be less than 20MB.',
      //   );
      //   return;
      // }
      setFilePath([video.path]);
      setFileType(MediaType.video);
      await searchVector('video');
    }
  }

  Future<void> pickImage() async {
    final image = await imageHelper.pickImage(
      multipleImages: true,
    );
    if (image != null) {
      if (image.isEmpty) return;
      if (image.length > 4) {
        TToastMessages.infoToast(
          'You can only upload 4 images at a time.',
        );
        return;
      }
      addFilePath(
        image.map((e) => e.path).toList(),
      );
      setFileType(MediaType.image);
      await searchVector(
        'image',
      );
      return;
    }
  }

  Future<void> retry() async {
    if (state.filePath.isNotEmpty) {
      await searchVector(state.mediaType.name);
    }
  }

  Future<void> setThumbnailFilePaths(
    String base64Image,
    String baseFilename,
  ) async {
    if (base64Image.isEmpty) {
      return;
    }
    final thumbnailPath = await UploadHelper.base64ToFile(
      base64Image,
      'thumbnail_$baseFilename',
    );
    state = state.copyWith(
      thumbnailsFilePaths: [
        ...state.thumbnailsFilePaths,
        thumbnailPath,
      ],
    );
  }

  Future<void> searchVector(String contentType) async {
    state = state.copyWith(
      hasError: false,
      isSearching: true,
      isSuccess: false,
      promptMessage: '',
      topLevelError: false,
      errorMessage: '',
    );
    controlCarousel();
    final result = await ref
        .read(
          searchVectorProvider,
        )
        .call(
          SearchVectorParams(
            state.filePath,
            contentType,
          ),
        );
    result.fold(
      (failure) {
        state = state.copyWith(
          isSearching: false,
          hasError: false,
          isSuccess: false,
          topLevelError: true,
          errorMessage: failure.message,
        );
        controlCarousel();
        return;
      },
      (response) async {
        state = state.copyWith(
          thumbnailsFilePaths: [],
        );
        for (final res in response) {
          await setThumbnailFilePaths(
            res.thumbnail,
            res.fileName.replaceAll('.mp4', '.jpg'),
          );
          addMultipleTags(res.tags);
        }

        state = state.copyWith(
          isSearching: false,
          searchVectorResponse: response,
          hasError: response.any((e) => e.isDuplicate),
          isSuccess: !response.any((e) => e.isDuplicate),
          topLevelError: false,
        );

        controlCarousel();
        return;
      },
    );
  }

  Future<void> saveArtwork() async {
    setIsLoading(true);
    final artwork = Artwork(
      userId: 0,
      tagNames: state.tags,
      modelNames: state.models,
      prompt: state.promptMessage,
      allowDownload: state.allowDownload,
      showPrompt: state.showPrompt,
      videoDuration: state.searchVectorResponse.first.videoDuration,
    );
    final mediaType = state.mediaType;
    final imagesPath = 'arts/images/';
    final thumbnailsPath = 'arts/thumbnails/';
    final videosPath = 'arts/videos/';
    final uploadPath = mediaType == MediaType.image ? imagesPath : videosPath;
    final artworkData = ArtworkData(
      mediaType: state.mediaType,
      artWork: artwork,
      resolution: state.searchVectorResponse
          .map(
            (e) => e.resolution,
          )
          .toList(),
      files: List<PresignedUrlRequest>.from(
        state.filePath.map(
          (e) => PresignedUrlRequest(
            fileName: '$uploadPath${e.split('/').last}',
            contentType: mediaType.name == 'image'
                ? 'image/${e.split('.').last}'
                : 'video/${e.split('.').last}',
            filePath: e,
          ),
        ),
      ),
      thumbnailFiles: List<PresignedUrlRequest>.from(
        state.thumbnailsFilePaths.map(
          (e) => PresignedUrlRequest(
            fileName: '$thumbnailsPath${e.split('/').last}',
            contentType: 'image/jpeg',
            filePath: e,
          ),
        ),
      ),
    );
    final prefs = ref.watch(localStorageProvider);
    final savedData = await prefs.setString(
      'artwork_data',
      jsonEncode(
        artworkData.toJson(),
      ),
    );

    if (savedData == false) {
      setIsLoading(false);
      TToastMessages.errorToast(
        'Failed to save artwork data. Please try again.',
      );
      setIsLoading(false);
      return;
    }

    setIsLoading(false);
    ref.watch(uploadStagesProvider.notifier).uploadArtwork();
  }
}
