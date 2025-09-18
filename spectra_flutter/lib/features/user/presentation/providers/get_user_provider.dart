import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/features/user/user.dart';
part 'get_user_provider.g.dart';

@Riverpod(keepAlive: true)
Future<User> getUser(
  Ref ref,
  String username,
) async {
  final usecase = ref.watch(getUserUsecaseProvider);
  final result = await usecase.call(username);
  return result.fold((l) => throw l.message, (r) => r);
}
