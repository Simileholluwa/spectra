/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: unnecessary_null_comparison

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'artwork.dart' as _i2;
import 'user.dart' as _i3;

abstract class ArtworkViews
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ArtworkViews._({
    this.id,
    required this.artworkId,
    this.artwork,
    required this.viewedById,
    this.viewedBy,
    DateTime? dateCreated,
  }) : dateCreated = dateCreated ?? DateTime.now();

  factory ArtworkViews({
    int? id,
    required int artworkId,
    _i2.Artwork? artwork,
    required int viewedById,
    _i3.User? viewedBy,
    DateTime? dateCreated,
  }) = _ArtworkViewsImpl;

  factory ArtworkViews.fromJson(Map<String, dynamic> jsonSerialization) {
    return ArtworkViews(
      id: jsonSerialization['id'] as int?,
      artworkId: jsonSerialization['artworkId'] as int,
      artwork: jsonSerialization['artwork'] == null
          ? null
          : _i2.Artwork.fromJson(
              (jsonSerialization['artwork'] as Map<String, dynamic>)),
      viewedById: jsonSerialization['viewedById'] as int,
      viewedBy: jsonSerialization['viewedBy'] == null
          ? null
          : _i3.User.fromJson(
              (jsonSerialization['viewedBy'] as Map<String, dynamic>)),
      dateCreated: jsonSerialization['dateCreated'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['dateCreated']),
    );
  }

  static final t = ArtworkViewsTable();

  static const db = ArtworkViewsRepository._();

  @override
  int? id;

  int artworkId;

  _i2.Artwork? artwork;

  int viewedById;

  _i3.User? viewedBy;

  DateTime? dateCreated;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [ArtworkViews]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ArtworkViews copyWith({
    int? id,
    int? artworkId,
    _i2.Artwork? artwork,
    int? viewedById,
    _i3.User? viewedBy,
    DateTime? dateCreated,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'artworkId': artworkId,
      if (artwork != null) 'artwork': artwork?.toJson(),
      'viewedById': viewedById,
      if (viewedBy != null) 'viewedBy': viewedBy?.toJson(),
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'artworkId': artworkId,
      if (artwork != null) 'artwork': artwork?.toJsonForProtocol(),
      'viewedById': viewedById,
      if (viewedBy != null) 'viewedBy': viewedBy?.toJsonForProtocol(),
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
    };
  }

  static ArtworkViewsInclude include({
    _i2.ArtworkInclude? artwork,
    _i3.UserInclude? viewedBy,
  }) {
    return ArtworkViewsInclude._(
      artwork: artwork,
      viewedBy: viewedBy,
    );
  }

  static ArtworkViewsIncludeList includeList({
    _i1.WhereExpressionBuilder<ArtworkViewsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArtworkViewsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkViewsTable>? orderByList,
    ArtworkViewsInclude? include,
  }) {
    return ArtworkViewsIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ArtworkViews.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ArtworkViews.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ArtworkViewsImpl extends ArtworkViews {
  _ArtworkViewsImpl({
    int? id,
    required int artworkId,
    _i2.Artwork? artwork,
    required int viewedById,
    _i3.User? viewedBy,
    DateTime? dateCreated,
  }) : super._(
          id: id,
          artworkId: artworkId,
          artwork: artwork,
          viewedById: viewedById,
          viewedBy: viewedBy,
          dateCreated: dateCreated,
        );

  /// Returns a shallow copy of this [ArtworkViews]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ArtworkViews copyWith({
    Object? id = _Undefined,
    int? artworkId,
    Object? artwork = _Undefined,
    int? viewedById,
    Object? viewedBy = _Undefined,
    Object? dateCreated = _Undefined,
  }) {
    return ArtworkViews(
      id: id is int? ? id : this.id,
      artworkId: artworkId ?? this.artworkId,
      artwork: artwork is _i2.Artwork? ? artwork : this.artwork?.copyWith(),
      viewedById: viewedById ?? this.viewedById,
      viewedBy: viewedBy is _i3.User? ? viewedBy : this.viewedBy?.copyWith(),
      dateCreated: dateCreated is DateTime? ? dateCreated : this.dateCreated,
    );
  }
}

class ArtworkViewsTable extends _i1.Table<int?> {
  ArtworkViewsTable({super.tableRelation}) : super(tableName: 'artwork_views') {
    artworkId = _i1.ColumnInt(
      'artworkId',
      this,
    );
    viewedById = _i1.ColumnInt(
      'viewedById',
      this,
    );
    dateCreated = _i1.ColumnDateTime(
      'dateCreated',
      this,
      hasDefault: true,
    );
  }

  late final _i1.ColumnInt artworkId;

  _i2.ArtworkTable? _artwork;

  late final _i1.ColumnInt viewedById;

  _i3.UserTable? _viewedBy;

  late final _i1.ColumnDateTime dateCreated;

  _i2.ArtworkTable get artwork {
    if (_artwork != null) return _artwork!;
    _artwork = _i1.createRelationTable(
      relationFieldName: 'artwork',
      field: ArtworkViews.t.artworkId,
      foreignField: _i2.Artwork.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ArtworkTable(tableRelation: foreignTableRelation),
    );
    return _artwork!;
  }

  _i3.UserTable get viewedBy {
    if (_viewedBy != null) return _viewedBy!;
    _viewedBy = _i1.createRelationTable(
      relationFieldName: 'viewedBy',
      field: ArtworkViews.t.viewedById,
      foreignField: _i3.User.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.UserTable(tableRelation: foreignTableRelation),
    );
    return _viewedBy!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        artworkId,
        viewedById,
        dateCreated,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'artwork') {
      return artwork;
    }
    if (relationField == 'viewedBy') {
      return viewedBy;
    }
    return null;
  }
}

class ArtworkViewsInclude extends _i1.IncludeObject {
  ArtworkViewsInclude._({
    _i2.ArtworkInclude? artwork,
    _i3.UserInclude? viewedBy,
  }) {
    _artwork = artwork;
    _viewedBy = viewedBy;
  }

  _i2.ArtworkInclude? _artwork;

  _i3.UserInclude? _viewedBy;

  @override
  Map<String, _i1.Include?> get includes => {
        'artwork': _artwork,
        'viewedBy': _viewedBy,
      };

  @override
  _i1.Table<int?> get table => ArtworkViews.t;
}

class ArtworkViewsIncludeList extends _i1.IncludeList {
  ArtworkViewsIncludeList._({
    _i1.WhereExpressionBuilder<ArtworkViewsTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ArtworkViews.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ArtworkViews.t;
}

class ArtworkViewsRepository {
  const ArtworkViewsRepository._();

  final attachRow = const ArtworkViewsAttachRowRepository._();

  /// Returns a list of [ArtworkViews]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<ArtworkViews>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkViewsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArtworkViewsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkViewsTable>? orderByList,
    _i1.Transaction? transaction,
    ArtworkViewsInclude? include,
  }) async {
    return session.db.find<ArtworkViews>(
      where: where?.call(ArtworkViews.t),
      orderBy: orderBy?.call(ArtworkViews.t),
      orderByList: orderByList?.call(ArtworkViews.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [ArtworkViews] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<ArtworkViews?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkViewsTable>? where,
    int? offset,
    _i1.OrderByBuilder<ArtworkViewsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkViewsTable>? orderByList,
    _i1.Transaction? transaction,
    ArtworkViewsInclude? include,
  }) async {
    return session.db.findFirstRow<ArtworkViews>(
      where: where?.call(ArtworkViews.t),
      orderBy: orderBy?.call(ArtworkViews.t),
      orderByList: orderByList?.call(ArtworkViews.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [ArtworkViews] by its [id] or null if no such row exists.
  Future<ArtworkViews?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ArtworkViewsInclude? include,
  }) async {
    return session.db.findById<ArtworkViews>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [ArtworkViews]s in the list and returns the inserted rows.
  ///
  /// The returned [ArtworkViews]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ArtworkViews>> insert(
    _i1.Session session,
    List<ArtworkViews> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ArtworkViews>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ArtworkViews] and returns the inserted row.
  ///
  /// The returned [ArtworkViews] will have its `id` field set.
  Future<ArtworkViews> insertRow(
    _i1.Session session,
    ArtworkViews row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ArtworkViews>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ArtworkViews]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ArtworkViews>> update(
    _i1.Session session,
    List<ArtworkViews> rows, {
    _i1.ColumnSelections<ArtworkViewsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ArtworkViews>(
      rows,
      columns: columns?.call(ArtworkViews.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ArtworkViews]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ArtworkViews> updateRow(
    _i1.Session session,
    ArtworkViews row, {
    _i1.ColumnSelections<ArtworkViewsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ArtworkViews>(
      row,
      columns: columns?.call(ArtworkViews.t),
      transaction: transaction,
    );
  }

  /// Deletes all [ArtworkViews]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ArtworkViews>> delete(
    _i1.Session session,
    List<ArtworkViews> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ArtworkViews>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ArtworkViews].
  Future<ArtworkViews> deleteRow(
    _i1.Session session,
    ArtworkViews row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ArtworkViews>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ArtworkViews>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ArtworkViewsTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ArtworkViews>(
      where: where(ArtworkViews.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkViewsTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ArtworkViews>(
      where: where?.call(ArtworkViews.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ArtworkViewsAttachRowRepository {
  const ArtworkViewsAttachRowRepository._();

  /// Creates a relation between the given [ArtworkViews] and [Artwork]
  /// by setting the [ArtworkViews]'s foreign key `artworkId` to refer to the [Artwork].
  Future<void> artwork(
    _i1.Session session,
    ArtworkViews artworkViews,
    _i2.Artwork artwork, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkViews.id == null) {
      throw ArgumentError.notNull('artworkViews.id');
    }
    if (artwork.id == null) {
      throw ArgumentError.notNull('artwork.id');
    }

    var $artworkViews = artworkViews.copyWith(artworkId: artwork.id);
    await session.db.updateRow<ArtworkViews>(
      $artworkViews,
      columns: [ArtworkViews.t.artworkId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [ArtworkViews] and [User]
  /// by setting the [ArtworkViews]'s foreign key `viewedById` to refer to the [User].
  Future<void> viewedBy(
    _i1.Session session,
    ArtworkViews artworkViews,
    _i3.User viewedBy, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkViews.id == null) {
      throw ArgumentError.notNull('artworkViews.id');
    }
    if (viewedBy.id == null) {
      throw ArgumentError.notNull('viewedBy.id');
    }

    var $artworkViews = artworkViews.copyWith(viewedById: viewedBy.id);
    await session.db.updateRow<ArtworkViews>(
      $artworkViews,
      columns: [ArtworkViews.t.viewedById],
      transaction: transaction,
    );
  }
}
