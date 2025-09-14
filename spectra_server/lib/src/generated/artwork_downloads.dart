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

abstract class ArtworkDownloads
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ArtworkDownloads._({
    this.id,
    required this.artworkId,
    this.artwork,
    required this.downloadedById,
    this.downloadedBy,
    DateTime? dateCreated,
  }) : dateCreated = dateCreated ?? DateTime.now();

  factory ArtworkDownloads({
    int? id,
    required int artworkId,
    _i2.Artwork? artwork,
    required int downloadedById,
    _i3.User? downloadedBy,
    DateTime? dateCreated,
  }) = _ArtworkDownloadsImpl;

  factory ArtworkDownloads.fromJson(Map<String, dynamic> jsonSerialization) {
    return ArtworkDownloads(
      id: jsonSerialization['id'] as int?,
      artworkId: jsonSerialization['artworkId'] as int,
      artwork: jsonSerialization['artwork'] == null
          ? null
          : _i2.Artwork.fromJson(
              (jsonSerialization['artwork'] as Map<String, dynamic>)),
      downloadedById: jsonSerialization['downloadedById'] as int,
      downloadedBy: jsonSerialization['downloadedBy'] == null
          ? null
          : _i3.User.fromJson(
              (jsonSerialization['downloadedBy'] as Map<String, dynamic>)),
      dateCreated: jsonSerialization['dateCreated'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['dateCreated']),
    );
  }

  static final t = ArtworkDownloadsTable();

  static const db = ArtworkDownloadsRepository._();

  @override
  int? id;

  int artworkId;

  _i2.Artwork? artwork;

  int downloadedById;

  _i3.User? downloadedBy;

  DateTime? dateCreated;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [ArtworkDownloads]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ArtworkDownloads copyWith({
    int? id,
    int? artworkId,
    _i2.Artwork? artwork,
    int? downloadedById,
    _i3.User? downloadedBy,
    DateTime? dateCreated,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'artworkId': artworkId,
      if (artwork != null) 'artwork': artwork?.toJson(),
      'downloadedById': downloadedById,
      if (downloadedBy != null) 'downloadedBy': downloadedBy?.toJson(),
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'artworkId': artworkId,
      if (artwork != null) 'artwork': artwork?.toJsonForProtocol(),
      'downloadedById': downloadedById,
      if (downloadedBy != null)
        'downloadedBy': downloadedBy?.toJsonForProtocol(),
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
    };
  }

  static ArtworkDownloadsInclude include({
    _i2.ArtworkInclude? artwork,
    _i3.UserInclude? downloadedBy,
  }) {
    return ArtworkDownloadsInclude._(
      artwork: artwork,
      downloadedBy: downloadedBy,
    );
  }

  static ArtworkDownloadsIncludeList includeList({
    _i1.WhereExpressionBuilder<ArtworkDownloadsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArtworkDownloadsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkDownloadsTable>? orderByList,
    ArtworkDownloadsInclude? include,
  }) {
    return ArtworkDownloadsIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ArtworkDownloads.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ArtworkDownloads.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ArtworkDownloadsImpl extends ArtworkDownloads {
  _ArtworkDownloadsImpl({
    int? id,
    required int artworkId,
    _i2.Artwork? artwork,
    required int downloadedById,
    _i3.User? downloadedBy,
    DateTime? dateCreated,
  }) : super._(
          id: id,
          artworkId: artworkId,
          artwork: artwork,
          downloadedById: downloadedById,
          downloadedBy: downloadedBy,
          dateCreated: dateCreated,
        );

  /// Returns a shallow copy of this [ArtworkDownloads]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ArtworkDownloads copyWith({
    Object? id = _Undefined,
    int? artworkId,
    Object? artwork = _Undefined,
    int? downloadedById,
    Object? downloadedBy = _Undefined,
    Object? dateCreated = _Undefined,
  }) {
    return ArtworkDownloads(
      id: id is int? ? id : this.id,
      artworkId: artworkId ?? this.artworkId,
      artwork: artwork is _i2.Artwork? ? artwork : this.artwork?.copyWith(),
      downloadedById: downloadedById ?? this.downloadedById,
      downloadedBy: downloadedBy is _i3.User?
          ? downloadedBy
          : this.downloadedBy?.copyWith(),
      dateCreated: dateCreated is DateTime? ? dateCreated : this.dateCreated,
    );
  }
}

class ArtworkDownloadsTable extends _i1.Table<int?> {
  ArtworkDownloadsTable({super.tableRelation})
      : super(tableName: 'artwork_downloads') {
    artworkId = _i1.ColumnInt(
      'artworkId',
      this,
    );
    downloadedById = _i1.ColumnInt(
      'downloadedById',
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

  late final _i1.ColumnInt downloadedById;

  _i3.UserTable? _downloadedBy;

  late final _i1.ColumnDateTime dateCreated;

  _i2.ArtworkTable get artwork {
    if (_artwork != null) return _artwork!;
    _artwork = _i1.createRelationTable(
      relationFieldName: 'artwork',
      field: ArtworkDownloads.t.artworkId,
      foreignField: _i2.Artwork.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ArtworkTable(tableRelation: foreignTableRelation),
    );
    return _artwork!;
  }

  _i3.UserTable get downloadedBy {
    if (_downloadedBy != null) return _downloadedBy!;
    _downloadedBy = _i1.createRelationTable(
      relationFieldName: 'downloadedBy',
      field: ArtworkDownloads.t.downloadedById,
      foreignField: _i3.User.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.UserTable(tableRelation: foreignTableRelation),
    );
    return _downloadedBy!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        artworkId,
        downloadedById,
        dateCreated,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'artwork') {
      return artwork;
    }
    if (relationField == 'downloadedBy') {
      return downloadedBy;
    }
    return null;
  }
}

class ArtworkDownloadsInclude extends _i1.IncludeObject {
  ArtworkDownloadsInclude._({
    _i2.ArtworkInclude? artwork,
    _i3.UserInclude? downloadedBy,
  }) {
    _artwork = artwork;
    _downloadedBy = downloadedBy;
  }

  _i2.ArtworkInclude? _artwork;

  _i3.UserInclude? _downloadedBy;

  @override
  Map<String, _i1.Include?> get includes => {
        'artwork': _artwork,
        'downloadedBy': _downloadedBy,
      };

  @override
  _i1.Table<int?> get table => ArtworkDownloads.t;
}

class ArtworkDownloadsIncludeList extends _i1.IncludeList {
  ArtworkDownloadsIncludeList._({
    _i1.WhereExpressionBuilder<ArtworkDownloadsTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ArtworkDownloads.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ArtworkDownloads.t;
}

class ArtworkDownloadsRepository {
  const ArtworkDownloadsRepository._();

  final attachRow = const ArtworkDownloadsAttachRowRepository._();

  /// Returns a list of [ArtworkDownloads]s matching the given query parameters.
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
  Future<List<ArtworkDownloads>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkDownloadsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArtworkDownloadsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkDownloadsTable>? orderByList,
    _i1.Transaction? transaction,
    ArtworkDownloadsInclude? include,
  }) async {
    return session.db.find<ArtworkDownloads>(
      where: where?.call(ArtworkDownloads.t),
      orderBy: orderBy?.call(ArtworkDownloads.t),
      orderByList: orderByList?.call(ArtworkDownloads.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [ArtworkDownloads] matching the given query parameters.
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
  Future<ArtworkDownloads?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkDownloadsTable>? where,
    int? offset,
    _i1.OrderByBuilder<ArtworkDownloadsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkDownloadsTable>? orderByList,
    _i1.Transaction? transaction,
    ArtworkDownloadsInclude? include,
  }) async {
    return session.db.findFirstRow<ArtworkDownloads>(
      where: where?.call(ArtworkDownloads.t),
      orderBy: orderBy?.call(ArtworkDownloads.t),
      orderByList: orderByList?.call(ArtworkDownloads.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [ArtworkDownloads] by its [id] or null if no such row exists.
  Future<ArtworkDownloads?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ArtworkDownloadsInclude? include,
  }) async {
    return session.db.findById<ArtworkDownloads>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [ArtworkDownloads]s in the list and returns the inserted rows.
  ///
  /// The returned [ArtworkDownloads]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ArtworkDownloads>> insert(
    _i1.Session session,
    List<ArtworkDownloads> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ArtworkDownloads>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ArtworkDownloads] and returns the inserted row.
  ///
  /// The returned [ArtworkDownloads] will have its `id` field set.
  Future<ArtworkDownloads> insertRow(
    _i1.Session session,
    ArtworkDownloads row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ArtworkDownloads>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ArtworkDownloads]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ArtworkDownloads>> update(
    _i1.Session session,
    List<ArtworkDownloads> rows, {
    _i1.ColumnSelections<ArtworkDownloadsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ArtworkDownloads>(
      rows,
      columns: columns?.call(ArtworkDownloads.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ArtworkDownloads]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ArtworkDownloads> updateRow(
    _i1.Session session,
    ArtworkDownloads row, {
    _i1.ColumnSelections<ArtworkDownloadsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ArtworkDownloads>(
      row,
      columns: columns?.call(ArtworkDownloads.t),
      transaction: transaction,
    );
  }

  /// Deletes all [ArtworkDownloads]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ArtworkDownloads>> delete(
    _i1.Session session,
    List<ArtworkDownloads> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ArtworkDownloads>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ArtworkDownloads].
  Future<ArtworkDownloads> deleteRow(
    _i1.Session session,
    ArtworkDownloads row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ArtworkDownloads>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ArtworkDownloads>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ArtworkDownloadsTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ArtworkDownloads>(
      where: where(ArtworkDownloads.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkDownloadsTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ArtworkDownloads>(
      where: where?.call(ArtworkDownloads.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ArtworkDownloadsAttachRowRepository {
  const ArtworkDownloadsAttachRowRepository._();

  /// Creates a relation between the given [ArtworkDownloads] and [Artwork]
  /// by setting the [ArtworkDownloads]'s foreign key `artworkId` to refer to the [Artwork].
  Future<void> artwork(
    _i1.Session session,
    ArtworkDownloads artworkDownloads,
    _i2.Artwork artwork, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkDownloads.id == null) {
      throw ArgumentError.notNull('artworkDownloads.id');
    }
    if (artwork.id == null) {
      throw ArgumentError.notNull('artwork.id');
    }

    var $artworkDownloads = artworkDownloads.copyWith(artworkId: artwork.id);
    await session.db.updateRow<ArtworkDownloads>(
      $artworkDownloads,
      columns: [ArtworkDownloads.t.artworkId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [ArtworkDownloads] and [User]
  /// by setting the [ArtworkDownloads]'s foreign key `downloadedById` to refer to the [User].
  Future<void> downloadedBy(
    _i1.Session session,
    ArtworkDownloads artworkDownloads,
    _i3.User downloadedBy, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkDownloads.id == null) {
      throw ArgumentError.notNull('artworkDownloads.id');
    }
    if (downloadedBy.id == null) {
      throw ArgumentError.notNull('downloadedBy.id');
    }

    var $artworkDownloads =
        artworkDownloads.copyWith(downloadedById: downloadedBy.id);
    await session.db.updateRow<ArtworkDownloads>(
      $artworkDownloads,
      columns: [ArtworkDownloads.t.downloadedById],
      transaction: transaction,
    );
  }
}
