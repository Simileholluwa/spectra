// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artwork_card_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$artworkCardNotifierHash() =>
    r'd14eab14b0328a4d6ea27bace54769886b53e30b';

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

abstract class _$ArtworkCardNotifier
    extends BuildlessAutoDisposeNotifier<ArtworkCardState> {
  late final ArtworkWithUserState? artworkState;

  ArtworkCardState build(
    ArtworkWithUserState? artworkState,
  );
}

/// See also [ArtworkCardNotifier].
@ProviderFor(ArtworkCardNotifier)
const artworkCardNotifierProvider = ArtworkCardNotifierFamily();

/// See also [ArtworkCardNotifier].
class ArtworkCardNotifierFamily extends Family<ArtworkCardState> {
  /// See also [ArtworkCardNotifier].
  const ArtworkCardNotifierFamily();

  /// See also [ArtworkCardNotifier].
  ArtworkCardNotifierProvider call(
    ArtworkWithUserState? artworkState,
  ) {
    return ArtworkCardNotifierProvider(
      artworkState,
    );
  }

  @override
  ArtworkCardNotifierProvider getProviderOverride(
    covariant ArtworkCardNotifierProvider provider,
  ) {
    return call(
      provider.artworkState,
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
  String? get name => r'artworkCardNotifierProvider';
}

/// See also [ArtworkCardNotifier].
class ArtworkCardNotifierProvider extends AutoDisposeNotifierProviderImpl<
    ArtworkCardNotifier, ArtworkCardState> {
  /// See also [ArtworkCardNotifier].
  ArtworkCardNotifierProvider(
    ArtworkWithUserState? artworkState,
  ) : this._internal(
          () => ArtworkCardNotifier()..artworkState = artworkState,
          from: artworkCardNotifierProvider,
          name: r'artworkCardNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$artworkCardNotifierHash,
          dependencies: ArtworkCardNotifierFamily._dependencies,
          allTransitiveDependencies:
              ArtworkCardNotifierFamily._allTransitiveDependencies,
          artworkState: artworkState,
        );

  ArtworkCardNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.artworkState,
  }) : super.internal();

  final ArtworkWithUserState? artworkState;

  @override
  ArtworkCardState runNotifierBuild(
    covariant ArtworkCardNotifier notifier,
  ) {
    return notifier.build(
      artworkState,
    );
  }

  @override
  Override overrideWith(ArtworkCardNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ArtworkCardNotifierProvider._internal(
        () => create()..artworkState = artworkState,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        artworkState: artworkState,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ArtworkCardNotifier, ArtworkCardState>
      createElement() {
    return _ArtworkCardNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ArtworkCardNotifierProvider &&
        other.artworkState == artworkState;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, artworkState.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ArtworkCardNotifierRef
    on AutoDisposeNotifierProviderRef<ArtworkCardState> {
  /// The parameter `artworkState` of this provider.
  ArtworkWithUserState? get artworkState;
}

class _ArtworkCardNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<ArtworkCardNotifier,
        ArtworkCardState> with ArtworkCardNotifierRef {
  _ArtworkCardNotifierProviderElement(super.provider);

  @override
  ArtworkWithUserState? get artworkState =>
      (origin as ArtworkCardNotifierProvider).artworkState;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
