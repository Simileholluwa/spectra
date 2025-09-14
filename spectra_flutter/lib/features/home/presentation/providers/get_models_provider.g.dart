// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_models_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$paginatedModelsListHash() =>
    r'493785e0349d1308e69a9483e420b8a35454b114';

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

abstract class _$PaginatedModelsList
    extends BuildlessNotifier<PagingController<int, Model>> {
  late final String sortBy;
  late final bool sortDescending;
  late final String query;

  PagingController<int, Model> build(
    String sortBy,
    bool sortDescending,
    String query,
  );
}

/// See also [PaginatedModelsList].
@ProviderFor(PaginatedModelsList)
const paginatedModelsListProvider = PaginatedModelsListFamily();

/// See also [PaginatedModelsList].
class PaginatedModelsListFamily extends Family<PagingController<int, Model>> {
  /// See also [PaginatedModelsList].
  const PaginatedModelsListFamily();

  /// See also [PaginatedModelsList].
  PaginatedModelsListProvider call(
    String sortBy,
    bool sortDescending,
    String query,
  ) {
    return PaginatedModelsListProvider(
      sortBy,
      sortDescending,
      query,
    );
  }

  @override
  PaginatedModelsListProvider getProviderOverride(
    covariant PaginatedModelsListProvider provider,
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
  String? get name => r'paginatedModelsListProvider';
}

/// See also [PaginatedModelsList].
class PaginatedModelsListProvider extends NotifierProviderImpl<
    PaginatedModelsList, PagingController<int, Model>> {
  /// See also [PaginatedModelsList].
  PaginatedModelsListProvider(
    String sortBy,
    bool sortDescending,
    String query,
  ) : this._internal(
          () => PaginatedModelsList()
            ..sortBy = sortBy
            ..sortDescending = sortDescending
            ..query = query,
          from: paginatedModelsListProvider,
          name: r'paginatedModelsListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$paginatedModelsListHash,
          dependencies: PaginatedModelsListFamily._dependencies,
          allTransitiveDependencies:
              PaginatedModelsListFamily._allTransitiveDependencies,
          sortBy: sortBy,
          sortDescending: sortDescending,
          query: query,
        );

  PaginatedModelsListProvider._internal(
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
  PagingController<int, Model> runNotifierBuild(
    covariant PaginatedModelsList notifier,
  ) {
    return notifier.build(
      sortBy,
      sortDescending,
      query,
    );
  }

  @override
  Override overrideWith(PaginatedModelsList Function() create) {
    return ProviderOverride(
      origin: this,
      override: PaginatedModelsListProvider._internal(
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
  NotifierProviderElement<PaginatedModelsList, PagingController<int, Model>>
      createElement() {
    return _PaginatedModelsListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PaginatedModelsListProvider &&
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
mixin PaginatedModelsListRef
    on NotifierProviderRef<PagingController<int, Model>> {
  /// The parameter `sortBy` of this provider.
  String get sortBy;

  /// The parameter `sortDescending` of this provider.
  bool get sortDescending;

  /// The parameter `query` of this provider.
  String get query;
}

class _PaginatedModelsListProviderElement extends NotifierProviderElement<
    PaginatedModelsList,
    PagingController<int, Model>> with PaginatedModelsListRef {
  _PaginatedModelsListProviderElement(super.provider);

  @override
  String get sortBy => (origin as PaginatedModelsListProvider).sortBy;
  @override
  bool get sortDescending =>
      (origin as PaginatedModelsListProvider).sortDescending;
  @override
  String get query => (origin as PaginatedModelsListProvider).query;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
