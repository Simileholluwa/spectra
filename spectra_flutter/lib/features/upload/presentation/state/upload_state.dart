// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:spectra_client/spectra_client.dart';

class UploadState {
  final List<String> filePath;
  final bool hasError;
  final bool isSearching;
  final bool isSuccess;
  final List<String> thumbnailsFilePaths;
  final List<String> tags;
  final MediaType mediaType;
  final List<String> models;
  final bool showPrompt;
  final String promptMessage;
  final bool allowDownload;
  final TextEditingController promptController;
  final TextEditingController tagInputController;
  final TextEditingController modelInputController;
  final bool isAgreementChecked;
  final CarouselSliderController carouselController;
  final bool isLoading;
  final bool topLevelError;
  final String errorMessage;
  final List<SearchVectorResponse> searchVectorResponse;

  UploadState({
    required this.filePath,
    required this.hasError,
    required this.isSearching,
    required this.isSuccess,
    required this.thumbnailsFilePaths,
    required this.tags,
    required this.mediaType,
    required this.models,
    required this.showPrompt,
    required this.promptMessage,
    required this.allowDownload,
    required this.promptController,
    required this.tagInputController,
    required this.modelInputController,
    required this.isAgreementChecked,
    required this.carouselController,
    required this.isLoading,
    required this.topLevelError,
    required this.errorMessage,
    required this.searchVectorResponse,
  });

  UploadState.empty()
      : filePath = [],
        hasError = false,
        thumbnailsFilePaths = [],
        isSearching = false,
        isSuccess = false,
        tags = [],
        mediaType = MediaType.image,
        topLevelError = false,
        errorMessage = '',
        models = [],
        promptMessage = '',
        showPrompt = false,
        allowDownload = false,
        promptController = TextEditingController(),
        tagInputController = TextEditingController(),
        modelInputController = TextEditingController(),
        isAgreementChecked = false,
        carouselController = CarouselSliderController(),
        isLoading = false,
        searchVectorResponse = [];

  UploadState copyWith({
    List<String>? filePath,
    bool? hasError,
    bool? isSearching,
    bool? isSuccess,
    List<String>? thumbnailsFilePaths,
    List<String>? tags,
    MediaType? mediaType,
    List<String>? models,
    bool? showPrompt,
    String? promptMessage,
    bool? allowDownload,
    TextEditingController? promptController,
    TextEditingController? tagInputController,
    TextEditingController? modelInputController,
    bool? isAgreementChecked,
    CarouselSliderController? carouselController,
    bool? isLoading,
    bool? topLevelError,
    String? errorMessage,
    List<SearchVectorResponse>? searchVectorResponse,
  }) {
    return UploadState(
      filePath: filePath ?? this.filePath,
      hasError: hasError ?? this.hasError,
      isSearching: isSearching ?? this.isSearching,
      isSuccess: isSuccess ?? this.isSuccess,
      thumbnailsFilePaths: thumbnailsFilePaths ?? this.thumbnailsFilePaths,
      tags: tags ?? this.tags,
      mediaType: mediaType ?? this.mediaType,
      models: models ?? this.models,
      showPrompt: showPrompt ?? this.showPrompt,
      promptMessage: promptMessage ?? this.promptMessage,
      allowDownload: allowDownload ?? this.allowDownload,
      promptController: promptController ?? this.promptController,
      tagInputController: tagInputController ?? this.tagInputController,
      modelInputController: modelInputController ?? this.modelInputController,
      isAgreementChecked: isAgreementChecked ?? this.isAgreementChecked,
      carouselController: carouselController ?? this.carouselController,
      isLoading: isLoading ?? this.isLoading,
      topLevelError: topLevelError ?? this.topLevelError,
      errorMessage: errorMessage ?? this.errorMessage,
      searchVectorResponse: searchVectorResponse ?? this.searchVectorResponse,
    );
  }

  @override
  String toString() {
    return 'UploadState(filePath: $filePath, hasError: $hasError, isSearching: $isSearching, isSuccess: $isSuccess, thumbnailsFilePaths: $thumbnailsFilePaths, tags: $tags, mediaType: $mediaType, models: $models, showPrompt: $showPrompt, promptMessage: $promptMessage, allowDownload: $allowDownload, isAgreementChecked: $isAgreementChecked, isLoading: $isLoading, topLevelError: $topLevelError, errorMessage: $errorMessage)';
  }
}
