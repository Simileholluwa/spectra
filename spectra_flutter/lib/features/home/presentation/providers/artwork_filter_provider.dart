import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/toastification/toast_messages.dart';
import 'package:spectra_flutter/features/home/home.dart';
part 'artwork_filter_provider.g.dart';

@riverpod
class ArtworkFilterNotifier extends _$ArtworkFilterNotifier {
  @override
  ArtworkFilterState build() {
    return ArtworkFilterState.initial();
  }

  void setArtworkFilter() {
    state = state.copyWith(
      filter: ArtworkFilter(
        tag: state.filterTags.isEmpty ? null : state.filterTags,
        model: state.filterModels.isEmpty ? null : state.filterModels,
        canDownload: state.allowsDownload,
        hasPrompt: state.hasPrompt,
        startDate: state.startDate,
        endDate: state.endDate,
        mediaType: state.mediaType,
      ),
    );
  }

  void clearArtworkFilter() {
    state = ArtworkFilterState.initial();
  }

  void addFilterTags(String tagName) {
    if (state.filterTags.contains(tagName)) {
      removeFilterTags(tagName);
      return;
    }
    state = state.copyWith(
      filterTags: [tagName, ...state.filterTags],
    );
  }

  void removeFilterTags(String tagName) {
    state = state.copyWith(
      filterTags: state.filterTags
          .where(
            (name) => name != tagName,
          )
          .toList(),
    );
  }

  void setSearchTagOnTextChanged(String value) {
    state = state.copyWith(
      searchTagQuery: value,
    );
  }

  void addFilterModels(String modelName) {
    if (state.filterModels.contains(modelName)) {
      removeFilterModels(modelName);
      return;
    }
    state = state.copyWith(
      filterModels: [modelName, ...state.filterModels],
    );
  }

  void removeFilterModels(String modelName) {
    state = state.copyWith(
      filterModels: state.filterModels
          .where(
            (name) => name != modelName,
          )
          .toList(),
    );
  }

  void setSearchModelOnTextChanged(String value) {
    state = state.copyWith(
      searchModelQuery: value,
    );
  }

  void setAllowsDownload(bool? value) {
    state = state.copyWith(
      allowsDownload: value,
    );
  }

  void setMediaType(MediaType? mediaType) {
    state = state.copyWith(
      mediaType: mediaType,
    );
  }

  void setHasPrompt(bool? value) {
    state = state.copyWith(
      hasPrompt: value,
    );
  }

  void setStartDate(DateTime? startDate) {
    if (startDate != null && state.endDate != null) {
      if (startDate.isAfter(state.endDate!)) {
        TToastMessages.errorToast('Start date cannot be after end date');
        return;
      }
    }
    state = state.copyWith(
      startDate: startDate,
    );
  }

  void setEndDate(DateTime? endDate) {
    if (endDate != null && state.startDate != null) {
      if (endDate.isBefore(state.startDate!)) {
        TToastMessages.errorToast('End date cannot be before start date');
        return;
      }
    }
    state = state.copyWith(
      endDate: endDate,
    );
  }
}

@riverpod
class FilterTabController extends _$FilterTabController {
  @override
  Raw<TabController> build() {
    final controller = TabController(
      length: 3,
      vsync: ref.watch(filterVsyncProvider),
    );
    ref.onDispose(() {
      controller.dispose();
    });
    return controller;
  }
}

class _VSync implements TickerProvider {
  @override
  Ticker createTicker(TickerCallback onTick) => Ticker(onTick);
}

final filterVsyncProvider = Provider<TickerProvider>(
  (ref) => _VSync(),
);
