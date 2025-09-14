// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_card_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$contentCardNotifierHash() =>
    r'fc1565b0458a67da5e54d70f688d2a05bae55b0d';

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

abstract class _$ContentCardNotifier
    extends BuildlessAutoDisposeNotifier<ContentCardState> {
  late final ArtworkWithUserState? artworkState;

  ContentCardState build(
    ArtworkWithUserState? artworkState,
  );
}

/// See also [ContentCardNotifier].
@ProviderFor(ContentCardNotifier)
const contentCardNotifierProvider = ContentCardNotifierFamily();

/// See also [ContentCardNotifier].
class ContentCardNotifierFamily extends Family<ContentCardState> {
  /// See also [ContentCardNotifier].
  const ContentCardNotifierFamily();

  /// See also [ContentCardNotifier].
  ContentCardNotifierProvider call(
    ArtworkWithUserState? artworkState,
  ) {
    return ContentCardNotifierProvider(
      artworkState,
    );
  }

  @override
  ContentCardNotifierProvider getProviderOverride(
    covariant ContentCardNotifierProvider provider,
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
  String? get name => r'contentCardNotifierProvider';
}

/// See also [ContentCardNotifier].
class ContentCardNotifierProvider extends AutoDisposeNotifierProviderImpl<
    ContentCardNotifier, ContentCardState> {
  /// See also [ContentCardNotifier].
  ContentCardNotifierProvider(
    ArtworkWithUserState? artworkState,
  ) : this._internal(
          () => ContentCardNotifier()..artworkState = artworkState,
          from: contentCardNotifierProvider,
          name: r'contentCardNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$contentCardNotifierHash,
          dependencies: ContentCardNotifierFamily._dependencies,
          allTransitiveDependencies:
              ContentCardNotifierFamily._allTransitiveDependencies,
          artworkState: artworkState,
        );

  ContentCardNotifierProvider._internal(
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
  ContentCardState runNotifierBuild(
    covariant ContentCardNotifier notifier,
  ) {
    return notifier.build(
      artworkState,
    );
  }

  @override
  Override overrideWith(ContentCardNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ContentCardNotifierProvider._internal(
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
  AutoDisposeNotifierProviderElement<ContentCardNotifier, ContentCardState>
      createElement() {
    return _ContentCardNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ContentCardNotifierProvider &&
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
mixin ContentCardNotifierRef
    on AutoDisposeNotifierProviderRef<ContentCardState> {
  /// The parameter `artworkState` of this provider.
  ArtworkWithUserState? get artworkState;
}

class _ContentCardNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<ContentCardNotifier,
        ContentCardState> with ContentCardNotifierRef {
  _ContentCardNotifierProviderElement(super.provider);

  @override
  ArtworkWithUserState? get artworkState =>
      (origin as ContentCardNotifierProvider).artworkState;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
