// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artwork_comment_interaction_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$artworkCommentInteractionNotifierHash() =>
    r'c79265c3c7f36a07ccfce208375876acaa91f3aa';

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

abstract class _$ArtworkCommentInteractionNotifier
    extends BuildlessAutoDisposeNotifier<ArtworkCommentInteractionState> {
  late final ArtworkCommentWithUserState? comment;

  ArtworkCommentInteractionState build(
    ArtworkCommentWithUserState? comment,
  );
}

/// See also [ArtworkCommentInteractionNotifier].
@ProviderFor(ArtworkCommentInteractionNotifier)
const artworkCommentInteractionNotifierProvider =
    ArtworkCommentInteractionNotifierFamily();

/// See also [ArtworkCommentInteractionNotifier].
class ArtworkCommentInteractionNotifierFamily
    extends Family<ArtworkCommentInteractionState> {
  /// See also [ArtworkCommentInteractionNotifier].
  const ArtworkCommentInteractionNotifierFamily();

  /// See also [ArtworkCommentInteractionNotifier].
  ArtworkCommentInteractionNotifierProvider call(
    ArtworkCommentWithUserState? comment,
  ) {
    return ArtworkCommentInteractionNotifierProvider(
      comment,
    );
  }

  @override
  ArtworkCommentInteractionNotifierProvider getProviderOverride(
    covariant ArtworkCommentInteractionNotifierProvider provider,
  ) {
    return call(
      provider.comment,
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
  String? get name => r'artworkCommentInteractionNotifierProvider';
}

/// See also [ArtworkCommentInteractionNotifier].
class ArtworkCommentInteractionNotifierProvider
    extends AutoDisposeNotifierProviderImpl<ArtworkCommentInteractionNotifier,
        ArtworkCommentInteractionState> {
  /// See also [ArtworkCommentInteractionNotifier].
  ArtworkCommentInteractionNotifierProvider(
    ArtworkCommentWithUserState? comment,
  ) : this._internal(
          () => ArtworkCommentInteractionNotifier()..comment = comment,
          from: artworkCommentInteractionNotifierProvider,
          name: r'artworkCommentInteractionNotifierProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$artworkCommentInteractionNotifierHash,
          dependencies: ArtworkCommentInteractionNotifierFamily._dependencies,
          allTransitiveDependencies: ArtworkCommentInteractionNotifierFamily
              ._allTransitiveDependencies,
          comment: comment,
        );

  ArtworkCommentInteractionNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.comment,
  }) : super.internal();

  final ArtworkCommentWithUserState? comment;

  @override
  ArtworkCommentInteractionState runNotifierBuild(
    covariant ArtworkCommentInteractionNotifier notifier,
  ) {
    return notifier.build(
      comment,
    );
  }

  @override
  Override overrideWith(ArtworkCommentInteractionNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ArtworkCommentInteractionNotifierProvider._internal(
        () => create()..comment = comment,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        comment: comment,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<ArtworkCommentInteractionNotifier,
      ArtworkCommentInteractionState> createElement() {
    return _ArtworkCommentInteractionNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ArtworkCommentInteractionNotifierProvider &&
        other.comment == comment;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, comment.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ArtworkCommentInteractionNotifierRef
    on AutoDisposeNotifierProviderRef<ArtworkCommentInteractionState> {
  /// The parameter `comment` of this provider.
  ArtworkCommentWithUserState? get comment;
}

class _ArtworkCommentInteractionNotifierProviderElement
    extends AutoDisposeNotifierProviderElement<
        ArtworkCommentInteractionNotifier, ArtworkCommentInteractionState>
    with ArtworkCommentInteractionNotifierRef {
  _ArtworkCommentInteractionNotifierProviderElement(super.provider);

  @override
  ArtworkCommentWithUserState? get comment =>
      (origin as ArtworkCommentInteractionNotifierProvider).comment;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
