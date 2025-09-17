// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_tags_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$paginatedTagsListHash() => r'2b813d8d2fb0ef99e59c9ebafd523f1c5acb09c4';

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

abstract class _$PaginatedTagsList
    extends BuildlessNotifier<PagingController<int, Tag>> {
  late final String sortBy;
  late final bool sortDescending;
  late final String query;

  PagingController<int, Tag> build(
    String sortBy,
    bool sortDescending,
    String query,
  );
}

/// See also [PaginatedTagsList].
@ProviderFor(PaginatedTagsList)
const paginatedTagsListProvider = PaginatedTagsListFamily();

/// See also [PaginatedTagsList].
class PaginatedTagsListFamily extends Family<PagingController<int, Tag>> {
  /// See also [PaginatedTagsList].
  const PaginatedTagsListFamily();

  /// See also [PaginatedTagsList].
  PaginatedTagsListProvider call(
    String sortBy,
    bool sortDescending,
    String query,
  ) {
    return PaginatedTagsListProvider(
      sortBy,
      sortDescending,
      query,
    );
  }

  @override
  PaginatedTagsListProvider getProviderOverride(
    covariant PaginatedTagsListProvider provider,
  ) {
    return call(
      provider.sortBy,
      provider.sortDescending,
      provider.query,
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
  String? get name => r'paginatedTagsListProvider';
}

/// See also [PaginatedTagsList].
class PaginatedTagsListProvider extends NotifierProviderImpl<PaginatedTagsList,
    PagingController<int, Tag>> {
  /// See also [PaginatedTagsList].
  PaginatedTagsListProvider(
    String sortBy,
    bool sortDescending,
    String query,
  ) : this._internal(
          () => PaginatedTagsList()
            ..sortBy = sortBy
            ..sortDescending = sortDescending
            ..query = query,
          from: paginatedTagsListProvider,
          name: r'paginatedTagsListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$paginatedTagsListHash,
          dependencies: PaginatedTagsListFamily._dependencies,
          allTransitiveDependencies:
              PaginatedTagsListFamily._allTransitiveDependencies,
          sortBy: sortBy,
          sortDescending: sortDescending,
          query: query,
        );

  PaginatedTagsListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sortBy,
    required this.sortDescending,
    required this.query,
  }) : super.internal();

  final String sortBy;
  final bool sortDescending;
  final String query;

  @override
  PagingController<int, Tag> runNotifierBuild(
    covariant PaginatedTagsList notifier,
  ) {
    return notifier.build(
      sortBy,
      sortDescending,
      query,
    );
  }

  @override
  Override overrideWith(PaginatedTagsList Function() create) {
    return ProviderOverride(
      origin: this,
      override: PaginatedTagsListProvider._internal(
        () => create()
          ..sortBy = sortBy
          ..sortDescending = sortDescending
          ..query = query,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sortBy: sortBy,
        sortDescending: sortDescending,
        query: query,
      ),
    );
  }

  @override
  NotifierProviderElement<PaginatedTagsList, PagingController<int, Tag>>
      createElement() {
    return _PaginatedTagsListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PaginatedTagsListProvider &&
        other.sortBy == sortBy &&
        other.sortDescending == sortDescending &&
        other.query == query;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sortBy.hashCode);
    hash = _SystemHash.combine(hash, sortDescending.hashCode);
    hash = _SystemHash.combine(hash, query.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PaginatedTagsListRef on NotifierProviderRef<PagingController<int, Tag>> {
  /// The parameter `sortBy` of this provider.
  String get sortBy;

  /// The parameter `sortDescending` of this provider.
  bool get sortDescending;

  /// The parameter `query` of this provider.
  String get query;
}

class _PaginatedTagsListProviderElement extends NotifierProviderElement<
    PaginatedTagsList, PagingController<int, Tag>> with PaginatedTagsListRef {
  _PaginatedTagsListProviderElement(super.provider);

  @override
  String get sortBy => (origin as PaginatedTagsListProvider).sortBy;
  @override
  bool get sortDescending =>
      (origin as PaginatedTagsListProvider).sortDescending;
  @override
  String get query => (origin as PaginatedTagsListProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
