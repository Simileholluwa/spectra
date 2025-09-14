import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spectra_flutter/features/home/home.dart';
part 'home_screen_provider.g.dart';

@riverpod
class HomeNotifier extends _$HomeNotifier {
  @override
  HomeState build() {
    final homeState = HomeState.initial();
    homeState.scrollController.addListener(() {
      setCanScroll();
    });
    return homeState;
  }

  void setCanScroll() {
    state.scrollController.offset >= 61
        ? state = state.copyWith(
            canScroll: true,
          )
        : state = state.copyWith(
            canScroll: false,
          );
  }

  void setViewType(String viewType) {
    state = state.copyWith(
      viewType: viewType,
    );
  }

  void setSortBy(String sortBy) {
    state = state.copyWith(sortBy: sortBy);
  }

  void setSortDescending(bool sordDescending) {
    state = state.copyWith(sortDescending: sordDescending);
  }

  void scrollToTop() {
    state.scrollController.animateTo(
      state.scrollController.position.minScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
