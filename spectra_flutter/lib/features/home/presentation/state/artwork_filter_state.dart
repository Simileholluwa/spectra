// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/widgets.dart';

import 'package:spectra_client/spectra_client.dart';

class ArtworkFilterState {
  final ArtworkFilter? filter;
  final List<String> filterTags;
  final List<String> filterModels;
  final TextEditingController filterTagInput;
  final TextEditingController filterModelInput;
  final String searchTagQuery;
  final String searchModelQuery;
  final bool? allowsDownload;
  final bool? hasPrompt;
  final DateTime? startDate;
  final DateTime? endDate;
  final MediaType? mediaType;

  ArtworkFilterState({
    required this.filter,
    required this.filterTags,
    required this.filterModels,
    required this.filterTagInput,
    required this.filterModelInput,
    required this.searchTagQuery,
    required this.searchModelQuery,
    required this.allowsDownload,
    required this.hasPrompt,
    this.startDate,
    this.endDate,
    this.mediaType,
  });

  ArtworkFilterState copyWith({
    ArtworkFilter? filter,
    List<String>? filterTags,
    List<String>? filterModels,
    TextEditingController? filterTagInput,
    TextEditingController? filterModelInput,
    String? searchTagQuery,
    String? searchModelQuery,
    Object? allowsDownload = _noChange,
    Object? hasPrompt = _noChange,
    Object? startDate = _noChange,
    Object? endDate = _noChange,
    Object? mediaType = _noChange,
  }) {
    return ArtworkFilterState(
      filter: filter ?? this.filter,
      filterTags: filterTags ?? this.filterTags,
      filterModels: filterModels ?? this.filterModels,
      filterTagInput: filterTagInput ?? this.filterTagInput,
      filterModelInput: filterModelInput ?? this.filterModelInput,
      searchTagQuery: searchTagQuery ?? this.searchTagQuery,
      searchModelQuery: searchModelQuery ?? this.searchModelQuery,
      allowsDownload: allowsDownload == _noChange
          ? this.allowsDownload
          : allowsDownload as bool?,
      hasPrompt: hasPrompt == _noChange ? this.hasPrompt : hasPrompt as bool?,
      startDate:
          startDate == _noChange ? this.startDate : startDate as DateTime?,
      endDate: endDate == _noChange ? this.endDate : endDate as DateTime?,
      mediaType:
          mediaType == _noChange ? this.mediaType : mediaType as MediaType?,
    );
  }

  static const _noChange = Object();

  ArtworkFilterState.initial()
      : filter = null,
        filterTags = [],
        filterTagInput = TextEditingController(),
        filterModels = [],
        filterModelInput = TextEditingController(),
        searchTagQuery = '',
        searchModelQuery = '',
        allowsDownload = null,
        hasPrompt = null,
        startDate = null,
        mediaType = null,
        endDate = null;
}
