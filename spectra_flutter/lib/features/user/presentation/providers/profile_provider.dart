import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/user/user.dart';
part 'profile_provider.g.dart';

@riverpod
class ProfileNotifier extends _$ProfileNotifier {
  @override
  ProfileState build(UserWithState userWithState) {
    return ProfileState.initial(ref, userWithState);
  }

  Future<void> toggleFollow(String username) async {
    state = state.copyWith(
      isFollowing: !state.isFollowing,
    );
    final usecase = ref.watch(toggleFollowUsecaseProvider);
    final result = await usecase.call(username);
    result.fold(
      (l) => TToastMessages.errorToast(l.message),
      (_) => TToastMessages.successToast(
        state.isFollowing
            ? 'You started following $username.'
            : 'You unfollowed $username.',
      ),
    );
  }
}
