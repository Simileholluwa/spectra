// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_user_downloaded_artworks.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$paginatedUserDownloadedArtworksHash() =>
    r'f48848d491cbe0177cdeaf241566f49f6924e820';

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

abstract class _$PaginatedUserDownloadedArtworks
    extends BuildlessNotifier<PagingController<int, ArtworkWithUserState>> {
  late final String username;
  late final bool sortDescending;

  PagingController<int, ArtworkWithUserState> build(
    String username,
    bool sortDescending,
  );
}

/// See also [PaginatedUserDownloadedArtworks].
@ProviderFor(PaginatedUserDownloadedArtworks)
const paginatedUserDownloadedArtworksProvider =
    PaginatedUserDownloadedArtworksFamily();

/// See also [PaginatedUserDownloadedArtworks].
class PaginatedUserDownloadedArtworksFamily
    extends Family<PagingController<int, ArtworkWithUserState>> {
  /// See also [PaginatedUserDownloadedArtworks].
  const PaginatedUserDownloadedArtworksFamily();

  /// See also [PaginatedUserDownloadedArtworks].
  PaginatedUserDownloadedArtworksProvider call(
    String username,
    bool sortDescending,
  ) {
    return PaginatedUserDownloadedArtworksProvider(
      username,
      sortDescending,
    );
  }

  @override
  PaginatedUserDownloadedArtworksProvider getProviderOverride(
    covariant PaginatedUserDownloadedArtworksProvider provider,
  ) {
    return call(
      provider.username,
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
  String? get name => r'paginatedUserDownloadedArtworksProvider';
}

/// See also [PaginatedUserDownloadedArtworks].
class PaginatedUserDownloadedArtworksProvider extends NotifierProviderImpl<
    PaginatedUserDownloadedArtworks,
    PagingController<int, ArtworkWithUserState>> {
  /// See also [PaginatedUserDownloadedArtworks].
  PaginatedUserDownloadedArtworksProvider(
    String username,
    bool sortDescending,
  ) : this._internal(
          () => PaginatedUserDownloadedArtworks()
            ..username = username
            ..sortDescending = sortDescending,
          from: paginatedUserDownloadedArtworksProvider,
          name: r'paginatedUserDownloadedArtworksProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$paginatedUserDownloadedArtworksHash,
          dependencies: PaginatedUserDownloadedArtworksFamily._dependencies,
          allTransitiveDependencies:
              PaginatedUserDownloadedArtworksFamily._allTransitiveDependencies,
          username: username,
          sortDescending: sortDescending,
        );

  PaginatedUserDownloadedArtworksProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.username,
    required this.sortDescending,
  }) : super.internal();

  final String username;
  final bool sortDescending;

  @override
  PagingController<int, ArtworkWithUserState> runNotifierBuild(
    covariant PaginatedUserDownloadedArtworks notifier,
  ) {
    return notifier.build(
      username,
      sortDescending,
    );
  }

  @override
  Override overrideWith(PaginatedUserDownloadedArtworks Function() create) {
    return ProviderOverride(
      origin: this,
      override: PaginatedUserDownloadedArtworksProvider._internal(
        () => create()
          ..username = username
          ..sortDescending = sortDescending,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        username: username,
        sortDescending: sortDescending,
      ),
    );
  }

  @override
  NotifierProviderElement<PaginatedUserDownloadedArtworks,
      PagingController<int, ArtworkWithUserState>> createElement() {
    return _PaginatedUserDownloadedArtworksProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PaginatedUserDownloadedArtworksProvider &&
        other.username == username &&
        other.sortDescending == sortDescending;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, username.hashCode);
    hash = _SystemHash.combine(hash, sortDescending.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PaginatedUserDownloadedArtworksRef
    on NotifierProviderRef<PagingController<int, ArtworkWithUserState>> {
  /// The parameter `username` of this provider.
  String get username;

  /// The parameter `sortDescending` of this provider.
  bool get sortDescending;
}

class _PaginatedUserDownloadedArtworksProviderElement
    extends NotifierProviderElement<PaginatedUserDownloadedArtworks,
        PagingController<int, ArtworkWithUserState>>
    with PaginatedUserDownloadedArtworksRef {
  _PaginatedUserDownloadedArtworksProviderElement(super.provider);

  @override
  String get username =>
      (origin as PaginatedUserDownloadedArtworksProvider).username;
  @override
  bool get sortDescending =>
      (origin as PaginatedUserDownloadedArtworksProvider).sortDescending;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
