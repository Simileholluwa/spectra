// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_user_liked_artworks.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$paginatedUserLikedArtworksHash() =>
    r'9f432467e788df42c1c9af8f4b622c420ff00f20';

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

abstract class _$PaginatedUserLikedArtworks
    extends BuildlessNotifier<PagingController<int, ArtworkWithUserState>> {
  late final String username;
  late final bool sortDescending;

  PagingController<int, ArtworkWithUserState> build(
    String username,
    bool sortDescending,
  );
}

/// See also [PaginatedUserLikedArtworks].
@ProviderFor(PaginatedUserLikedArtworks)
const paginatedUserLikedArtworksProvider = PaginatedUserLikedArtworksFamily();

/// See also [PaginatedUserLikedArtworks].
class PaginatedUserLikedArtworksFamily
    extends Family<PagingController<int, ArtworkWithUserState>> {
  /// See also [PaginatedUserLikedArtworks].
  const PaginatedUserLikedArtworksFamily();

  /// See also [PaginatedUserLikedArtworks].
  PaginatedUserLikedArtworksProvider call(
    String username,
    bool sortDescending,
  ) {
    return PaginatedUserLikedArtworksProvider(
      username,
      sortDescending,
    );
  }

  @override
  PaginatedUserLikedArtworksProvider getProviderOverride(
    covariant PaginatedUserLikedArtworksProvider provider,
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
  String? get name => r'paginatedUserLikedArtworksProvider';
}

/// See also [PaginatedUserLikedArtworks].
class PaginatedUserLikedArtworksProvider extends NotifierProviderImpl<
    PaginatedUserLikedArtworks, PagingController<int, ArtworkWithUserState>> {
  /// See also [PaginatedUserLikedArtworks].
  PaginatedUserLikedArtworksProvider(
    String username,
    bool sortDescending,
  ) : this._internal(
          () => PaginatedUserLikedArtworks()
            ..username = username
            ..sortDescending = sortDescending,
          from: paginatedUserLikedArtworksProvider,
          name: r'paginatedUserLikedArtworksProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$paginatedUserLikedArtworksHash,
          dependencies: PaginatedUserLikedArtworksFamily._dependencies,
          allTransitiveDependencies:
              PaginatedUserLikedArtworksFamily._allTransitiveDependencies,
          username: username,
          sortDescending: sortDescending,
        );

  PaginatedUserLikedArtworksProvider._internal(
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
    covariant PaginatedUserLikedArtworks notifier,
  ) {
    return notifier.build(
      username,
      sortDescending,
    );
  }

  @override
  Override overrideWith(PaginatedUserLikedArtworks Function() create) {
    return ProviderOverride(
      origin: this,
      override: PaginatedUserLikedArtworksProvider._internal(
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
  NotifierProviderElement<PaginatedUserLikedArtworks,
      PagingController<int, ArtworkWithUserState>> createElement() {
    return _PaginatedUserLikedArtworksProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PaginatedUserLikedArtworksProvider &&
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
mixin PaginatedUserLikedArtworksRef
    on NotifierProviderRef<PagingController<int, ArtworkWithUserState>> {
  /// The parameter `username` of this provider.
  String get username;

  /// The parameter `sortDescending` of this provider.
  bool get sortDescending;
}

class _PaginatedUserLikedArtworksProviderElement
    extends NotifierProviderElement<PaginatedUserLikedArtworks,
        PagingController<int, ArtworkWithUserState>>
    with PaginatedUserLikedArtworksRef {
  _PaginatedUserLikedArtworksProviderElement(super.provider);

  @override
  String get username =>
      (origin as PaginatedUserLikedArtworksProvider).username;
  @override
  bool get sortDescending =>
      (origin as PaginatedUserLikedArtworksProvider).sortDescending;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
