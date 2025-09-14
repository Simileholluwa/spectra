// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artwork_stream_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$artworkUpdateStreamHash() =>
    r'3020b25b501bf571eea7ef9ce83e9d7a8e27ec40';

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

/// See also [artworkUpdateStream].
@ProviderFor(artworkUpdateStream)
const artworkUpdateStreamProvider = ArtworkUpdateStreamFamily();

/// See also [artworkUpdateStream].
class ArtworkUpdateStreamFamily extends Family<AsyncValue<ArtworkUpdates>> {
  /// See also [artworkUpdateStream].
  const ArtworkUpdateStreamFamily();

  /// See also [artworkUpdateStream].
  ArtworkUpdateStreamProvider call(
    int artworkId,
  ) {
    return ArtworkUpdateStreamProvider(
      artworkId,
    );
  }

  @override
  ArtworkUpdateStreamProvider getProviderOverride(
    covariant ArtworkUpdateStreamProvider provider,
  ) {
    return call(
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
  String? get name => r'artworkUpdateStreamProvider';
}

/// See also [artworkUpdateStream].
class ArtworkUpdateStreamProvider extends StreamProvider<ArtworkUpdates> {
  /// See also [artworkUpdateStream].
  ArtworkUpdateStreamProvider(
    int artworkId,
  ) : this._internal(
          (ref) => artworkUpdateStream(
            ref as ArtworkUpdateStreamRef,
            artworkId,
          ),
          from: artworkUpdateStreamProvider,
          name: r'artworkUpdateStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$artworkUpdateStreamHash,
          dependencies: ArtworkUpdateStreamFamily._dependencies,
          allTransitiveDependencies:
              ArtworkUpdateStreamFamily._allTransitiveDependencies,
          artworkId: artworkId,
        );

  ArtworkUpdateStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.artworkId,
  }) : super.internal();

  final int artworkId;

  @override
  Override overrideWith(
    Stream<ArtworkUpdates> Function(ArtworkUpdateStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ArtworkUpdateStreamProvider._internal(
        (ref) => create(ref as ArtworkUpdateStreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        artworkId: artworkId,
      ),
    );
  }

  @override
  StreamProviderElement<ArtworkUpdates> createElement() {
    return _ArtworkUpdateStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ArtworkUpdateStreamProvider && other.artworkId == artworkId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, artworkId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ArtworkUpdateStreamRef on StreamProviderRef<ArtworkUpdates> {
  /// The parameter `artworkId` of this provider.
  int get artworkId;
}

class _ArtworkUpdateStreamProviderElement
    extends StreamProviderElement<ArtworkUpdates> with ArtworkUpdateStreamRef {
  _ArtworkUpdateStreamProviderElement(super.provider);

  @override
  int get artworkId => (origin as ArtworkUpdateStreamProvider).artworkId;
}

String _$artworkCommentUpdateStreamHash() =>
    r'84730ad005b3766bbb2154bed5ba80bbb3d992bd';

/// See also [artworkCommentUpdateStream].
@ProviderFor(artworkCommentUpdateStream)
const artworkCommentUpdateStreamProvider = ArtworkCommentUpdateStreamFamily();

/// See also [artworkCommentUpdateStream].
class ArtworkCommentUpdateStreamFamily
    extends Family<AsyncValue<ArtworkCommentUpdates>> {
  /// See also [artworkCommentUpdateStream].
  const ArtworkCommentUpdateStreamFamily();

  /// See also [artworkCommentUpdateStream].
  ArtworkCommentUpdateStreamProvider call(
    int commentId,
  ) {
    return ArtworkCommentUpdateStreamProvider(
      commentId,
    );
  }

  @override
  ArtworkCommentUpdateStreamProvider getProviderOverride(
    covariant ArtworkCommentUpdateStreamProvider provider,
  ) {
    return call(
      provider.commentId,
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
  String? get name => r'artworkCommentUpdateStreamProvider';
}

/// See also [artworkCommentUpdateStream].
class ArtworkCommentUpdateStreamProvider
    extends StreamProvider<ArtworkCommentUpdates> {
  /// See also [artworkCommentUpdateStream].
  ArtworkCommentUpdateStreamProvider(
    int commentId,
  ) : this._internal(
          (ref) => artworkCommentUpdateStream(
            ref as ArtworkCommentUpdateStreamRef,
            commentId,
          ),
          from: artworkCommentUpdateStreamProvider,
          name: r'artworkCommentUpdateStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$artworkCommentUpdateStreamHash,
          dependencies: ArtworkCommentUpdateStreamFamily._dependencies,
          allTransitiveDependencies:
              ArtworkCommentUpdateStreamFamily._allTransitiveDependencies,
          commentId: commentId,
        );

  ArtworkCommentUpdateStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.commentId,
  }) : super.internal();

  final int commentId;

  @override
  Override overrideWith(
    Stream<ArtworkCommentUpdates> Function(
            ArtworkCommentUpdateStreamRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ArtworkCommentUpdateStreamProvider._internal(
        (ref) => create(ref as ArtworkCommentUpdateStreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        commentId: commentId,
      ),
    );
  }

  @override
  StreamProviderElement<ArtworkCommentUpdates> createElement() {
    return _ArtworkCommentUpdateStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ArtworkCommentUpdateStreamProvider &&
        other.commentId == commentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, commentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ArtworkCommentUpdateStreamRef
    on StreamProviderRef<ArtworkCommentUpdates> {
  /// The parameter `commentId` of this provider.
  int get commentId;
}

class _ArtworkCommentUpdateStreamProviderElement
    extends StreamProviderElement<ArtworkCommentUpdates>
    with ArtworkCommentUpdateStreamRef {
  _ArtworkCommentUpdateStreamProviderElement(super.provider);

  @override
  int get commentId => (origin as ArtworkCommentUpdateStreamProvider).commentId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
