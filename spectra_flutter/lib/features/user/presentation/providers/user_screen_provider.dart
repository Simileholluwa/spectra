import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'user_screen_provider.g.dart';

@riverpod
class UserScreenTabController extends _$UserScreenTabController {
  @override
  Raw<TabController> build() {
    final controller = TabController(
      length: 4,
      vsync: ref.watch(userScreenVsyncProvider),
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

final userScreenVsyncProvider = Provider<TickerProvider>(
  (ref) => _VSync(),
);
