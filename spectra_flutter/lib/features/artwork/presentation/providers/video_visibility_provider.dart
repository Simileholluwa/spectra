import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'video_visibility_provider.g.dart';

@riverpod
class VideoVisibility extends _$VideoVisibility {
  @override
  Map<int, double> build() {
    return {};
  }

  void updateVisibility(int index, double visibleFraction) {
    state = {
      ...state,
      index: visibleFraction,
    };

    final mostVisibleIndex = state.entries
        .reduce(
          (a, b) => a.value > b.value ? a : b,
        )
        .key;

    ref
        .watch(
          activeVideoIndexProvider.notifier,
        )
        .updateIndex(
          mostVisibleIndex,
        );
  }
}

@riverpod
class ActiveVideoIndex extends _$ActiveVideoIndex {
  @override
  int? build() {
    return null;
  }

  void updateIndex(int? index) {
    state = index;
  }
}
