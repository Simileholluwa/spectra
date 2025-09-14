// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class HomeState {
  final String viewType;
  final String sortBy;
  final bool sortDescending;
  final ScrollController scrollController;
  final bool canScroll;
  HomeState({
    required this.viewType,
    required this.sortBy,
    required this.sortDescending,
    required this.scrollController,
    required this.canScroll,
  });

  HomeState copyWith({
    String? viewType,
    String? sortBy,
    bool? sortDescending,
    ScrollController? scrollController,
    bool? canScroll,
  }) {
    return HomeState(
      viewType: viewType ?? this.viewType,
      sortBy: sortBy ?? this.sortBy,
      sortDescending: sortDescending ?? this.sortDescending,
      scrollController: scrollController ?? this.scrollController,
      canScroll: canScroll ?? this.canScroll,
    );
  }

  HomeState.initial()
      : viewType = 'list',
        sortBy = 'createdAt',
        scrollController = ScrollController(),
        canScroll = false,
        sortDescending = true;
}
