import 'package:flutter_riverpod/flutter_riverpod.dart';

final timeProvider = StreamProvider<DateTime>((ref) {
  // emit the current time every minute
  return Stream.periodic(
    const Duration(minutes: 1),
    (_) => DateTime.now(),
  ); // immediate first value
});

final imageIndexProvider = Provider.family<int, int>((ref, int index) {
  return index;
});
