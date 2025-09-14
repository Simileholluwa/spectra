// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_artwork_comment_list.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$paginatedArtworkCommentListHash() =>
    r'a1ff1e3061202b3cf7565452921c11fc996056aa';

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

abstract class _$PaginatedArtworkCommentList
    extends BuildlessAutoDisposeNotifier<
        PagingController<int, ArtworkCommentWithUserState>> {
  late final int artworkId;
  late final int? parentId;
  late final String sortBy;
  late final bool sortDescending;

  PagingController<int, ArtworkCommentWithUserState> build(
    int artworkId,
    int? parentId,
    String sortBy,
    bool sortDescending,
  );
}

/// See also [PaginatedArtworkCommentList].
@ProviderFor(PaginatedArtworkCommentList)
const paginatedArtworkCommentListProvider = PaginatedArtworkCommentListFamily();

/// See also [PaginatedArtworkCommentList].
class PaginatedArtworkCommentListFamily
    extends Family<PagingController<int, ArtworkCommentWithUserState>> {
  /// See also [PaginatedArtworkCommentList].
  const PaginatedArtworkCommentListFamily();

  /// See also [PaginatedArtworkCommentList].
  PaginatedArtworkCommentListProvider call(
    int artworkId,
    int? parentId,
    String sortBy,
    bool sortDescending,
  ) {
    return PaginatedArtworkCommentListProvider(
      artworkId,
      parentId,
      sortBy,
      sortDescending,
    );
  }

  @override
  PaginatedArtworkCommentListProvider getProviderOverride(
    covariant PaginatedArtworkCommentListProvider provider,
  ) {
    return call(
      provider.artworkId,
      provider.parentId,
      provider.sortBy,
      provider.sortDescending,
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
  String? get name => r'paginatedArtworkCommentListProvider';
}

/// See also [PaginatedArtworkCommentList].
class PaginatedArtworkCommentListProvider
    extends AutoDisposeNotifierProviderImpl<PaginatedArtworkCommentList,
        PagingController<int, ArtworkCommentWithUserState>> {
  /// See also [PaginatedArtworkCommentList].
  PaginatedArtworkCommentListProvider(
    int artworkId,
    int? parentId,
    String sortBy,
    bool sortDescending,
  ) : this._internal(
          () => PaginatedArtworkCommentList()
            ..artworkId = artworkId
            ..parentId = parentId
            ..sortBy = sortBy
            ..sortDescending = sortDescending,
          from: paginatedArtworkCommentListProvider,
          name: r'paginatedArtworkCommentListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$paginatedArtworkCommentListHash,
          dependencies: PaginatedArtworkCommentListFamily._dependencies,
          allTransitiveDependencies:
              PaginatedArtworkCommentListFamily._allTransitiveDependencies,
          artworkId: artworkId,
          parentId: parentId,
          sortBy: sortBy,
          sortDescending: sortDescending,
        );

  PaginatedArtworkCommentListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.artworkId,
    required this.parentId,
    required this.sortBy,
    required this.sortDescending,
  }) : super.internal();

  final int artworkId;
  final int? parentId;
  final String sortBy;
  final bool sortDescending;

  @override
  PagingController<int, ArtworkCommentWithUserState> runNotifierBuild(
    covariant PaginatedArtworkCommentList notifier,
  ) {
    return notifier.build(
      artworkId,
      parentId,
      sortBy,
      sortDescending,
    );
  }

  @override
  Override overrideWith(PaginatedArtworkCommentList Function() create) {
    return ProviderOverride(
      origin: this,
      override: PaginatedArtworkCommentListProvider._internal(
        () => create()
          ..artworkId = artworkId
          ..parentId = parentId
          ..sortBy = sortBy
          ..sortDescending = sortDescending,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        artworkId: artworkId,
        parentId: parentId,
        sortBy: sortBy,
        sortDescending: sortDescending,
      ),
    );
  }

  @override
  AutoDisposeNotifierProviderElement<PaginatedArtworkCommentList,
      PagingController<int, ArtworkCommentWithUserState>> createElement() {
    return _PaginatedArtworkCommentListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PaginatedArtworkCommentListProvider &&
        other.artworkId == artworkId &&
        other.parentId == parentId &&
        other.sortBy == sortBy &&
        other.sortDescending == sortDescending;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, artworkId.hashCode);
    hash = _SystemHash.combine(hash, parentId.hashCode);
    hash = _SystemHash.combine(hash, sortBy.hashCode);
    hash = _SystemHash.combine(hash, sortDescending.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PaginatedArtworkCommentListRef on AutoDisposeNotifierProviderRef<
    PagingController<int, ArtworkCommentWithUserState>> {
  /// The parameter `artworkId` of this provider.
  int get artworkId;

  /// The parameter `parentId` of this provider.
  int? get parentId;

  /// The parameter `sortBy` of this provider.
  String get sortBy;

  /// The parameter `sortDescending` of this provider.
  bool get sortDescending;
}

class _PaginatedArtworkCommentListProviderElement
    extends AutoDisposeNotifierProviderElement<PaginatedArtworkCommentList,
        PagingController<int, ArtworkCommentWithUserState>>
    with PaginatedArtworkCommentListRef {
  _PaginatedArtworkCommentListProviderElement(super.provider);

  @override
  int get artworkId =>
      (origin as PaginatedArtworkCommentListProvider).artworkId;
  @override
  int? get parentId => (origin as PaginatedArtworkCommentListProvider).parentId;
  @override
  String get sortBy => (origin as PaginatedArtworkCommentListProvider).sortBy;
  @override
  bool get sortDescending =>
      (origin as PaginatedArtworkCommentListProvider).sortDescending;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
