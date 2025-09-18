// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_user_artworks.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$paginatedUserArtworksHash() =>
    r'1116c6a36176aff785a8591161c4a4a6a949110b';

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

abstract class _$PaginatedUserArtworks
    extends BuildlessNotifier<PagingController<int, ArtworkWithUserState>> {
  late final String username;
  late final String sortBy;
  late final bool sortDescending;

  PagingController<int, ArtworkWithUserState> build(
    String username,
    String sortBy,
    bool sortDescending,
  );
}

/// See also [PaginatedUserArtworks].
@ProviderFor(PaginatedUserArtworks)
const paginatedUserArtworksProvider = PaginatedUserArtworksFamily();

/// See also [PaginatedUserArtworks].
class PaginatedUserArtworksFamily
    extends Family<PagingController<int, ArtworkWithUserState>> {
  /// See also [PaginatedUserArtworks].
  const PaginatedUserArtworksFamily();

  /// See also [PaginatedUserArtworks].
  PaginatedUserArtworksProvider call(
    String username,
    String sortBy,
    bool sortDescending,
  ) {
    return PaginatedUserArtworksProvider(
      username,
      sortBy,
      sortDescending,
    );
  }

  @override
  PaginatedUserArtworksProvider getProviderOverride(
    covariant PaginatedUserArtworksProvider provider,
  ) {
    return call(
      provider.username,
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
  String? get name => r'paginatedUserArtworksProvider';
}

/// See also [PaginatedUserArtworks].
class PaginatedUserArtworksProvider extends NotifierProviderImpl<
    PaginatedUserArtworks, PagingController<int, ArtworkWithUserState>> {
  /// See also [PaginatedUserArtworks].
  PaginatedUserArtworksProvider(
    String username,
    String sortBy,
    bool sortDescending,
  ) : this._internal(
          () => PaginatedUserArtworks()
            ..username = username
            ..sortBy = sortBy
            ..sortDescending = sortDescending,
          from: paginatedUserArtworksProvider,
          name: r'paginatedUserArtworksProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$paginatedUserArtworksHash,
          dependencies: PaginatedUserArtworksFamily._dependencies,
          allTransitiveDependencies:
              PaginatedUserArtworksFamily._allTransitiveDependencies,
          username: username,
          sortBy: sortBy,
          sortDescending: sortDescending,
        );

  PaginatedUserArtworksProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.username,
    required this.sortBy,
    required this.sortDescending,
  }) : super.internal();

  final String username;
  final String sortBy;
  final bool sortDescending;

  @override
  PagingController<int, ArtworkWithUserState> runNotifierBuild(
    covariant PaginatedUserArtworks notifier,
  ) {
    return notifier.build(
      username,
      sortBy,
      sortDescending,
    );
  }

  @override
  Override overrideWith(PaginatedUserArtworks Function() create) {
    return ProviderOverride(
      origin: this,
      override: PaginatedUserArtworksProvider._internal(
        () => create()
          ..username = username
          ..sortBy = sortBy
          ..sortDescending = sortDescending,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        username: username,
        sortBy: sortBy,
        sortDescending: sortDescending,
      ),
    );
  }

  @override
  NotifierProviderElement<PaginatedUserArtworks,
      PagingController<int, ArtworkWithUserState>> createElement() {
    return _PaginatedUserArtworksProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PaginatedUserArtworksProvider &&
        other.username == username &&
        other.sortBy == sortBy &&
        other.sortDescending == sortDescending;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, username.hashCode);
    hash = _SystemHash.combine(hash, sortBy.hashCode);
    hash = _SystemHash.combine(hash, sortDescending.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PaginatedUserArtworksRef
    on NotifierProviderRef<PagingController<int, ArtworkWithUserState>> {
  /// The parameter `username` of this provider.
  String get username;

  /// The parameter `sortBy` of this provider.
  String get sortBy;

  /// The parameter `sortDescending` of this provider.
  bool get sortDescending;
}

class _PaginatedUserArtworksProviderElement extends NotifierProviderElement<
    PaginatedUserArtworks,
    PagingController<int, ArtworkWithUserState>> with PaginatedUserArtworksRef {
  _PaginatedUserArtworksProviderElement(super.provider);

  @override
  String get username => (origin as PaginatedUserArtworksProvider).username;
  @override
  String get sortBy => (origin as PaginatedUserArtworksProvider).sortBy;
  @override
  bool get sortDescending =>
      (origin as PaginatedUserArtworksProvider).sortDescending;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
