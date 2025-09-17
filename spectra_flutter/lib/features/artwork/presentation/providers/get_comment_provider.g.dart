// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_comment_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getCommentHash() => r'0ddc8602ee0642a15ec94990deb4e9de1409c6e8';

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

/// See also [getComment].
@ProviderFor(getComment)
const getCommentProvider = GetCommentFamily();

/// See also [getComment].
class GetCommentFamily extends Family<AsyncValue<ArtworkCommentWithUserState>> {
  /// See also [getComment].
  const GetCommentFamily();

  /// See also [getComment].
  GetCommentProvider call(
    ArtworkCommentWithUserState? artworkCommentState,
    int commentId,
  ) {
    return GetCommentProvider(
      artworkCommentState,
      commentId,
    );
  }

  @override
  GetCommentProvider getProviderOverride(
    covariant GetCommentProvider provider,
  ) {
    return call(
      provider.artworkCommentState,
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
  String? get name => r'getCommentProvider';
}

/// See also [getComment].
class GetCommentProvider
    extends AutoDisposeFutureProvider<ArtworkCommentWithUserState> {
  /// See also [getComment].
  GetCommentProvider(
    ArtworkCommentWithUserState? artworkCommentState,
    int commentId,
  ) : this._internal(
          (ref) => getComment(
            ref as GetCommentRef,
            artworkCommentState,
            commentId,
          ),
          from: getCommentProvider,
          name: r'getCommentProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getCommentHash,
          dependencies: GetCommentFamily._dependencies,
          allTransitiveDependencies:
              GetCommentFamily._allTransitiveDependencies,
          artworkCommentState: artworkCommentState,
          commentId: commentId,
        );

  GetCommentProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.artworkCommentState,
    required this.commentId,
  }) : super.internal();

  final ArtworkCommentWithUserState? artworkCommentState;
  final int commentId;

  @override
  Override overrideWith(
    FutureOr<ArtworkCommentWithUserState> Function(GetCommentRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetCommentProvider._internal(
        (ref) => create(ref as GetCommentRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        artworkCommentState: artworkCommentState,
        commentId: commentId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ArtworkCommentWithUserState>
      createElement() {
    return _GetCommentProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetCommentProvider &&
        other.artworkCommentState == artworkCommentState &&
        other.commentId == commentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, artworkCommentState.hashCode);
    hash = _SystemHash.combine(hash, commentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin GetCommentRef
    on AutoDisposeFutureProviderRef<ArtworkCommentWithUserState> {
  /// The parameter `artworkCommentState` of this provider.
  ArtworkCommentWithUserState? get artworkCommentState;

  /// The parameter `commentId` of this provider.
  int get commentId;
}

class _GetCommentProviderElement
    extends AutoDisposeFutureProviderElement<ArtworkCommentWithUserState>
    with GetCommentRef {
  _GetCommentProviderElement(super.provider);

  @override
  ArtworkCommentWithUserState? get artworkCommentState =>
      (origin as GetCommentProvider).artworkCommentState;
  @override
  int get commentId => (origin as GetCommentProvider).commentId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
