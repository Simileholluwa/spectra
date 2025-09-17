// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_related_artworks_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$paginatedRelatedArtworkHash() =>
    r'bd199f5fe9cc7b197b9b1cde54519ccc65f62880';

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

abstract class _$PaginatedRelatedArtwork
    extends BuildlessNotifier<PagingController<int, ArtworkWithUserState>> {
  late final int artworkId;
  late final List<String> tagNames;
  late final List<String> modelNames;

  PagingController<int, ArtworkWithUserState> build(
    int artworkId,
    List<String> tagNames,
    List<String> modelNames,
  );
}

/// See also [PaginatedRelatedArtwork].
@ProviderFor(PaginatedRelatedArtwork)
const paginatedRelatedArtworkProvider = PaginatedRelatedArtworkFamily();

/// See also [PaginatedRelatedArtwork].
class PaginatedRelatedArtworkFamily
    extends Family<PagingController<int, ArtworkWithUserState>> {
  /// See also [PaginatedRelatedArtwork].
  const PaginatedRelatedArtworkFamily();

  /// See also [PaginatedRelatedArtwork].
  PaginatedRelatedArtworkProvider call(
    int artworkId,
    List<String> tagNames,
    List<String> modelNames,
  ) {
    return PaginatedRelatedArtworkProvider(
      artworkId,
      tagNames,
      modelNames,
    );
  }

  @override
  PaginatedRelatedArtworkProvider getProviderOverride(
    covariant PaginatedRelatedArtworkProvider provider,
  ) {
    return call(
      provider.artworkId,
      provider.tagNames,
      provider.modelNames,
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
  String? get name => r'paginatedRelatedArtworkProvider';
}

/// See also [PaginatedRelatedArtwork].
class PaginatedRelatedArtworkProvider extends NotifierProviderImpl<
    PaginatedRelatedArtwork, PagingController<int, ArtworkWithUserState>> {
  /// See also [PaginatedRelatedArtwork].
  PaginatedRelatedArtworkProvider(
    int artworkId,
    List<String> tagNames,
    List<String> modelNames,
  ) : this._internal(
          () => PaginatedRelatedArtwork()
            ..artworkId = artworkId
            ..tagNames = tagNames
            ..modelNames = modelNames,
          from: paginatedRelatedArtworkProvider,
          name: r'paginatedRelatedArtworkProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$paginatedRelatedArtworkHash,
          dependencies: PaginatedRelatedArtworkFamily._dependencies,
          allTransitiveDependencies:
              PaginatedRelatedArtworkFamily._allTransitiveDependencies,
          artworkId: artworkId,
          tagNames: tagNames,
          modelNames: modelNames,
        );

  PaginatedRelatedArtworkProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.artworkId,
    required this.tagNames,
    required this.modelNames,
  }) : super.internal();

  final int artworkId;
  final List<String> tagNames;
  final List<String> modelNames;

  @override
  PagingController<int, ArtworkWithUserState> runNotifierBuild(
    covariant PaginatedRelatedArtwork notifier,
  ) {
    return notifier.build(
      artworkId,
      tagNames,
      modelNames,
    );
  }

  @override
  Override overrideWith(PaginatedRelatedArtwork Function() create) {
    return ProviderOverride(
      origin: this,
      override: PaginatedRelatedArtworkProvider._internal(
        () => create()
          ..artworkId = artworkId
          ..tagNames = tagNames
          ..modelNames = modelNames,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        artworkId: artworkId,
        tagNames: tagNames,
        modelNames: modelNames,
      ),
    );
  }

  @override
  NotifierProviderElement<PaginatedRelatedArtwork,
      PagingController<int, ArtworkWithUserState>> createElement() {
    return _PaginatedRelatedArtworkProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PaginatedRelatedArtworkProvider &&
        other.artworkId == artworkId &&
        other.tagNames == tagNames &&
        other.modelNames == modelNames;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, artworkId.hashCode);
    hash = _SystemHash.combine(hash, tagNames.hashCode);
    hash = _SystemHash.combine(hash, modelNames.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PaginatedRelatedArtworkRef
    on NotifierProviderRef<PagingController<int, ArtworkWithUserState>> {
  /// The parameter `artworkId` of this provider.
  int get artworkId;

  /// The parameter `tagNames` of this provider.
  List<String> get tagNames;

  /// The parameter `modelNames` of this provider.
  List<String> get modelNames;
}

class _PaginatedRelatedArtworkProviderElement extends NotifierProviderElement<
        PaginatedRelatedArtwork, PagingController<int, ArtworkWithUserState>>
    with PaginatedRelatedArtworkRef {
  _PaginatedRelatedArtworkProviderElement(super.provider);

  @override
  int get artworkId => (origin as PaginatedRelatedArtworkProvider).artworkId;
  @override
  List<String> get tagNames =>
      (origin as PaginatedRelatedArtworkProvider).tagNames;
  @override
  List<String> get modelNames =>
      (origin as PaginatedRelatedArtworkProvider).modelNames;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
