// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_artwork_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getArtworkHash() => r'1cbd06a2cdfcb76d45be7177936a082f15ea6181';

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

/// See also [getArtwork].
@ProviderFor(getArtwork)
const getArtworkProvider = GetArtworkFamily();

/// See also [getArtwork].
class GetArtworkFamily extends Family<AsyncValue<ArtworkWithUserState>> {
  /// See also [getArtwork].
  const GetArtworkFamily();

  /// See also [getArtwork].
  GetArtworkProvider call(
    ArtworkWithUserState? artworkState,
    int artworkId,
  ) {
    return GetArtworkProvider(
      artworkState,
      artworkId,
    );
  }

  @override
  GetArtworkProvider getProviderOverride(
    covariant GetArtworkProvider provider,
  ) {
    return call(
      provider.artworkState,
      provider.artworkId,
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
  String? get name => r'getArtworkProvider';
}

/// See also [getArtwork].
class GetArtworkProvider
    extends AutoDisposeFutureProvider<ArtworkWithUserState> {
  /// See also [getArtwork].
  GetArtworkProvider(
    ArtworkWithUserState? artworkState,
    int artworkId,
  ) : this._internal(
          (ref) => getArtwork(
            ref as GetArtworkRef,
            artworkState,
            artworkId,
          ),
          from: getArtworkProvider,
          name: r'getArtworkProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getArtworkHash,
          dependencies: GetArtworkFamily._dependencies,
          allTransitiveDependencies:
              GetArtworkFamily._allTransitiveDependencies,
          artworkState: artworkState,
          artworkId: artworkId,
        );

  GetArtworkProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.artworkState,
    required this.artworkId,
  }) : super.internal();

  final ArtworkWithUserState? artworkState;
  final int artworkId;

  @override
  Override overrideWith(
    FutureOr<ArtworkWithUserState> Function(GetArtworkRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetArtworkProvider._internal(
        (ref) => create(ref as GetArtworkRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        artworkState: artworkState,
        artworkId: artworkId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ArtworkWithUserState> createElement() {
    return _GetArtworkProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetArtworkProvider &&
        other.artworkState == artworkState &&
        other.artworkId == artworkId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, artworkState.hashCode);
    hash = _SystemHash.combine(hash, artworkId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetArtworkRef on AutoDisposeFutureProviderRef<ArtworkWithUserState> {
  /// The parameter `artworkState` of this provider.
  ArtworkWithUserState? get artworkState;

  /// The parameter `artworkId` of this provider.
  int get artworkId;
}

class _GetArtworkProviderElement
    extends AutoDisposeFutureProviderElement<ArtworkWithUserState>
    with GetArtworkRef {
  _GetArtworkProviderElement(super.provider);

  @override
  ArtworkWithUserState? get artworkState =>
      (origin as GetArtworkProvider).artworkState;
  @override
  int get artworkId => (origin as GetArtworkProvider).artworkId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
