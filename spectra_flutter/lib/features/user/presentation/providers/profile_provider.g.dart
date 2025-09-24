// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$profileNotifierHash() => r'952094bdb0b3501dbf70bf956aa634275414e5f8';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$ProfileNotifier
    extends BuildlessAutoDisposeNotifier<ProfileState> {
  late final UserWithState userWithState;

  ProfileState build(
    UserWithState userWithState,
  );
}

/// See also [ProfileNotifier].
@ProviderFor(ProfileNotifier)
const profileNotifierProvider = ProfileNotifierFamily();

/// See also [ProfileNotifier].
class ProfileNotifierFamily extends Family<ProfileState> {
  /// See also [ProfileNotifier].
  const ProfileNotifierFamily();

  /// See also [ProfileNotifier].
  ProfileNotifierProvider call(
    UserWithState userWithState,
  ) {
    return ProfileNotifierProvider(
      userWithState,
    );
  }

  @override
  ProfileNotifierProvider getProviderOverride(
    covariant ProfileNotifierProvider provider,
  ) {
    return call(
      provider.userWithState,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'profileNotifierProvider';
}

/// See also [ProfileNotifier].
class ProfileNotifierProvider
    extends AutoDisposeNotifierProviderImpl<ProfileNotifier, ProfileState> {
  /// See also [ProfileNotifier].
  ProfileNotifierProvider(
    UserWithState userWithState,
  ) : this._internal(
          () => ProfileNotifier()..userWithState = userWithState,
          from: profileNotifierProvider,
          name: r'profileNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$profileNotifierHash,
          dependencies: ProfileNotifierFamily._dependencies,
          allTransitiveDependencies:
              ProfileNotifierFamily._allTransitiveDependencies,
          userWithState: userWithState,
        );

  ProfileNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userWithState,
  }) : super.internal();

  final UserWithState userWithState;

  @override
  ProfileState runNotifierBuild(
    covariant ProfileNotifier notifier,
  ) {
    return notifier.build(
      userWithState,
    );
  }

  @override
  Override overrideWith(ProfileNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProfileNotifierProvider._internal(
        () => create()..userWithState = userWithState,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userWithState: userWithState,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ProfileNotifier, ProfileState>
      createElement() {
    return _ProfileNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProfileNotifierProvider &&
        other.userWithState == userWithState;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userWithState.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProfileNotifierRef on AutoDisposeNotifierProviderRef<ProfileState> {
  /// The parameter `userWithState` of this provider.
  UserWithState get userWithState;
}

class _ProfileNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<ProfileNotifier, ProfileState>
    with ProfileNotifierRef {
  _ProfileNotifierProviderElement(super.provider);

  @override
  UserWithState get userWithState =>
      (origin as ProfileNotifierProvider).userWithState;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
