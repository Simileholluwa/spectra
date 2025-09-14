// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_artwork_list.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$paginatedArtworkListHash() =>
    r'21cd092e1ccd8e838d4bcb8b5bf9ab39abb1cace';

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

abstract class _$PaginatedArtworkList
    extends BuildlessNotifier<PagingController<int, ArtworkWithUserState>> {
  late final ArtworkFilter? filter;
  late final String sortBy;
  late final bool sortDescending;

  PagingController<int, ArtworkWithUserState> build(
    ArtworkFilter? filter,
    String sortBy,
    bool sortDescending,
  );
}

/// See also [PaginatedArtworkList].
@ProviderFor(PaginatedArtworkList)
const paginatedArtworkListProvider = PaginatedArtworkListFamily();

/// See also [PaginatedArtworkList].
class PaginatedArtworkListFamily
    extends Family<PagingController<int, ArtworkWithUserState>> {
  /// See also [PaginatedArtworkList].
  const PaginatedArtworkListFamily();

  /// See also [PaginatedArtworkList].
  PaginatedArtworkListProvider call(
    ArtworkFilter? filter,
    String sortBy,
    bool sortDescending,
  ) {
    return PaginatedArtworkListProvider(
      filter,
      sortBy,
      sortDescending,
    );
  }

  @override
  PaginatedArtworkListProvider getProviderOverride(
    covariant PaginatedArtworkListProvider provider,
  ) {
    return call(
      provider.filter,
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
  String? get name => r'paginatedArtworkListProvider';
}

/// See also [PaginatedArtworkList].
class PaginatedArtworkListProvider extends NotifierProviderImpl<
    PaginatedArtworkList, PagingController<int, ArtworkWithUserState>> {
  /// See also [PaginatedArtworkList].
  PaginatedArtworkListProvider(
    ArtworkFilter? filter,
    String sortBy,
    bool sortDescending,
  ) : this._internal(
          () => PaginatedArtworkList()
            ..filter = filter
            ..sortBy = sortBy
            ..sortDescending = sortDescending,
          from: paginatedArtworkListProvider,
          name: r'paginatedArtworkListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$paginatedArtworkListHash,
          dependencies: PaginatedArtworkListFamily._dependencies,
          allTransitiveDependencies:
              PaginatedArtworkListFamily._allTransitiveDependencies,
          filter: filter,
          sortBy: sortBy,
          sortDescending: sortDescending,
        );

  PaginatedArtworkListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.filter,
    required this.sortBy,
    required this.sortDescending,
  }) : super.internal();

  final ArtworkFilter? filter;
  final String sortBy;
  final bool sortDescending;

  @override
  PagingController<int, ArtworkWithUserState> runNotifierBuild(
    covariant PaginatedArtworkList notifier,
  ) {
    return notifier.build(
      filter,
      sortBy,
      sortDescending,
    );
  }

  @override
  Override overrideWith(PaginatedArtworkList Function() create) {
    return ProviderOverride(
      origin: this,
      override: PaginatedArtworkListProvider._internal(
        () => create()
          ..filter = filter
          ..sortBy = sortBy
          ..sortDescending = sortDescending,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        filter: filter,
        sortBy: sortBy,
        sortDescending: sortDescending,
      ),
    );
  }

  @override
  NotifierProviderElement<PaginatedArtworkList,
      PagingController<int, ArtworkWithUserState>> createElement() {
    return _PaginatedArtworkListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PaginatedArtworkListProvider &&
        other.filter == filter &&
        other.sortBy == sortBy &&
        other.sortDescending == sortDescending;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, filter.hashCode);
    hash = _SystemHash.combine(hash, sortBy.hashCode);
    hash = _SystemHash.combine(hash, sortDescending.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PaginatedArtworkListRef
    on NotifierProviderRef<PagingController<int, ArtworkWithUserState>> {
  /// The parameter `filter` of this provider.
  ArtworkFilter? get filter;

  /// The parameter `sortBy` of this provider.
  String get sortBy;

  /// The parameter `sortDescending` of this provider.
  bool get sortDescending;
}

class _PaginatedArtworkListProviderElement extends NotifierProviderElement<
    PaginatedArtworkList,
    PagingController<int, ArtworkWithUserState>> with PaginatedArtworkListRef {
  _PaginatedArtworkListProviderElement(super.provider);

  @override
  ArtworkFilter? get filter => (origin as PaginatedArtworkListProvider).filter;
  @override
  String get sortBy => (origin as PaginatedArtworkListProvider).sortBy;
  @override
  bool get sortDescending =>
      (origin as PaginatedArtworkListProvider).sortDescending;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
