import 'package:flutter_riverpod/flutter_riverpod.dart';

final timeProvider = StreamProvider<DateTime>((ref) {
  // emit the current time every minute
  return Stream.periodic(
    const Duration(minutes: 1),
    (_) => DateTime.now(),
  );
});

final bufurredArtworksCount = StateNotifierProvider<BufurredArtworksCount, int>(
  (ref) => BufurredArtworksCount(),
);

class BufurredArtworksCount extends StateNotifier<int> {
  BufurredArtworksCount() : super(0);

  void setCount(int count) {
    state = count;
  }

  void reset() {
    state == 0;
  }
}

class HideNavBar extends StateNotifier<bool> {
  HideNavBar() : super(false);

  void setBool(bool value) {
    state = value;
  }
}

final hideNavBarProvider = StateNotifierProvider<HideNavBar, bool>(
  (ref) => HideNavBar(),
);
