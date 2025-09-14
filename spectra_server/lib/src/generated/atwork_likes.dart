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

abstract class ArtworkLikes
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ArtworkLikes._({
    this.id,
    required this.artworkId,
    this.artwork,
    required this.likedById,
    this.likedBy,
    DateTime? dateCreated,
  }) : dateCreated = dateCreated ?? DateTime.now();

  factory ArtworkLikes({
    int? id,
    required int artworkId,
    _i2.Artwork? artwork,
    required int likedById,
    _i3.User? likedBy,
    DateTime? dateCreated,
  }) = _ArtworkLikesImpl;

  factory ArtworkLikes.fromJson(Map<String, dynamic> jsonSerialization) {
    return ArtworkLikes(
      id: jsonSerialization['id'] as int?,
      artworkId: jsonSerialization['artworkId'] as int,
      artwork: jsonSerialization['artwork'] == null
          ? null
          : _i2.Artwork.fromJson(
              (jsonSerialization['artwork'] as Map<String, dynamic>)),
      likedById: jsonSerialization['likedById'] as int,
      likedBy: jsonSerialization['likedBy'] == null
          ? null
          : _i3.User.fromJson(
              (jsonSerialization['likedBy'] as Map<String, dynamic>)),
      dateCreated: jsonSerialization['dateCreated'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['dateCreated']),
    );
  }

  static final t = ArtworkLikesTable();

  static const db = ArtworkLikesRepository._();

  @override
  int? id;

  int artworkId;

  _i2.Artwork? artwork;

  int likedById;

  _i3.User? likedBy;

  DateTime? dateCreated;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [ArtworkLikes]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ArtworkLikes copyWith({
    int? id,
    int? artworkId,
    _i2.Artwork? artwork,
    int? likedById,
    _i3.User? likedBy,
    DateTime? dateCreated,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'artworkId': artworkId,
      if (artwork != null) 'artwork': artwork?.toJson(),
      'likedById': likedById,
      if (likedBy != null) 'likedBy': likedBy?.toJson(),
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'artworkId': artworkId,
      if (artwork != null) 'artwork': artwork?.toJsonForProtocol(),
      'likedById': likedById,
      if (likedBy != null) 'likedBy': likedBy?.toJsonForProtocol(),
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
    };
  }

  static ArtworkLikesInclude include({
    _i2.ArtworkInclude? artwork,
    _i3.UserInclude? likedBy,
  }) {
    return ArtworkLikesInclude._(
      artwork: artwork,
      likedBy: likedBy,
    );
  }

  static ArtworkLikesIncludeList includeList({
    _i1.WhereExpressionBuilder<ArtworkLikesTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArtworkLikesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkLikesTable>? orderByList,
    ArtworkLikesInclude? include,
  }) {
    return ArtworkLikesIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ArtworkLikes.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ArtworkLikes.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ArtworkLikesImpl extends ArtworkLikes {
  _ArtworkLikesImpl({
    int? id,
    required int artworkId,
    _i2.Artwork? artwork,
    required int likedById,
    _i3.User? likedBy,
    DateTime? dateCreated,
  }) : super._(
          id: id,
          artworkId: artworkId,
          artwork: artwork,
          likedById: likedById,
          likedBy: likedBy,
          dateCreated: dateCreated,
        );

  /// Returns a shallow copy of this [ArtworkLikes]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ArtworkLikes copyWith({
    Object? id = _Undefined,
    int? artworkId,
    Object? artwork = _Undefined,
    int? likedById,
    Object? likedBy = _Undefined,
    Object? dateCreated = _Undefined,
  }) {
    return ArtworkLikes(
      id: id is int? ? id : this.id,
      artworkId: artworkId ?? this.artworkId,
      artwork: artwork is _i2.Artwork? ? artwork : this.artwork?.copyWith(),
      likedById: likedById ?? this.likedById,
      likedBy: likedBy is _i3.User? ? likedBy : this.likedBy?.copyWith(),
      dateCreated: dateCreated is DateTime? ? dateCreated : this.dateCreated,
    );
  }
}

class ArtworkLikesTable extends _i1.Table<int?> {
  ArtworkLikesTable({super.tableRelation}) : super(tableName: 'artwork_likes') {
    artworkId = _i1.ColumnInt(
      'artworkId',
      this,
    );
    likedById = _i1.ColumnInt(
      'likedById',
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

  late final _i1.ColumnInt likedById;

  _i3.UserTable? _likedBy;

  late final _i1.ColumnDateTime dateCreated;

  _i2.ArtworkTable get artwork {
    if (_artwork != null) return _artwork!;
    _artwork = _i1.createRelationTable(
      relationFieldName: 'artwork',
      field: ArtworkLikes.t.artworkId,
      foreignField: _i2.Artwork.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ArtworkTable(tableRelation: foreignTableRelation),
    );
    return _artwork!;
  }

  _i3.UserTable get likedBy {
    if (_likedBy != null) return _likedBy!;
    _likedBy = _i1.createRelationTable(
      relationFieldName: 'likedBy',
      field: ArtworkLikes.t.likedById,
      foreignField: _i3.User.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.UserTable(tableRelation: foreignTableRelation),
    );
    return _likedBy!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        artworkId,
        likedById,
        dateCreated,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'artwork') {
      return artwork;
    }
    if (relationField == 'likedBy') {
      return likedBy;
    }
    return null;
  }
}

class ArtworkLikesInclude extends _i1.IncludeObject {
  ArtworkLikesInclude._({
    _i2.ArtworkInclude? artwork,
    _i3.UserInclude? likedBy,
  }) {
    _artwork = artwork;
    _likedBy = likedBy;
  }

  _i2.ArtworkInclude? _artwork;

  _i3.UserInclude? _likedBy;

  @override
  Map<String, _i1.Include?> get includes => {
        'artwork': _artwork,
        'likedBy': _likedBy,
      };

  @override
  _i1.Table<int?> get table => ArtworkLikes.t;
}

class ArtworkLikesIncludeList extends _i1.IncludeList {
  ArtworkLikesIncludeList._({
    _i1.WhereExpressionBuilder<ArtworkLikesTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ArtworkLikes.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ArtworkLikes.t;
}

class ArtworkLikesRepository {
  const ArtworkLikesRepository._();

  final attachRow = const ArtworkLikesAttachRowRepository._();

  /// Returns a list of [ArtworkLikes]s matching the given query parameters.
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
  Future<List<ArtworkLikes>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkLikesTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArtworkLikesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkLikesTable>? orderByList,
    _i1.Transaction? transaction,
    ArtworkLikesInclude? include,
  }) async {
    return session.db.find<ArtworkLikes>(
      where: where?.call(ArtworkLikes.t),
      orderBy: orderBy?.call(ArtworkLikes.t),
      orderByList: orderByList?.call(ArtworkLikes.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [ArtworkLikes] matching the given query parameters.
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
  Future<ArtworkLikes?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkLikesTable>? where,
    int? offset,
    _i1.OrderByBuilder<ArtworkLikesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkLikesTable>? orderByList,
    _i1.Transaction? transaction,
    ArtworkLikesInclude? include,
  }) async {
    return session.db.findFirstRow<ArtworkLikes>(
      where: where?.call(ArtworkLikes.t),
      orderBy: orderBy?.call(ArtworkLikes.t),
      orderByList: orderByList?.call(ArtworkLikes.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [ArtworkLikes] by its [id] or null if no such row exists.
  Future<ArtworkLikes?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ArtworkLikesInclude? include,
  }) async {
    return session.db.findById<ArtworkLikes>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [ArtworkLikes]s in the list and returns the inserted rows.
  ///
  /// The returned [ArtworkLikes]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ArtworkLikes>> insert(
    _i1.Session session,
    List<ArtworkLikes> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ArtworkLikes>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ArtworkLikes] and returns the inserted row.
  ///
  /// The returned [ArtworkLikes] will have its `id` field set.
  Future<ArtworkLikes> insertRow(
    _i1.Session session,
    ArtworkLikes row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ArtworkLikes>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ArtworkLikes]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ArtworkLikes>> update(
    _i1.Session session,
    List<ArtworkLikes> rows, {
    _i1.ColumnSelections<ArtworkLikesTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ArtworkLikes>(
      rows,
      columns: columns?.call(ArtworkLikes.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ArtworkLikes]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ArtworkLikes> updateRow(
    _i1.Session session,
    ArtworkLikes row, {
    _i1.ColumnSelections<ArtworkLikesTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ArtworkLikes>(
      row,
      columns: columns?.call(ArtworkLikes.t),
      transaction: transaction,
    );
  }

  /// Deletes all [ArtworkLikes]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ArtworkLikes>> delete(
    _i1.Session session,
    List<ArtworkLikes> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ArtworkLikes>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ArtworkLikes].
  Future<ArtworkLikes> deleteRow(
    _i1.Session session,
    ArtworkLikes row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ArtworkLikes>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ArtworkLikes>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ArtworkLikesTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ArtworkLikes>(
      where: where(ArtworkLikes.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkLikesTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ArtworkLikes>(
      where: where?.call(ArtworkLikes.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ArtworkLikesAttachRowRepository {
  const ArtworkLikesAttachRowRepository._();

  /// Creates a relation between the given [ArtworkLikes] and [Artwork]
  /// by setting the [ArtworkLikes]'s foreign key `artworkId` to refer to the [Artwork].
  Future<void> artwork(
    _i1.Session session,
    ArtworkLikes artworkLikes,
    _i2.Artwork artwork, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkLikes.id == null) {
      throw ArgumentError.notNull('artworkLikes.id');
    }
    if (artwork.id == null) {
      throw ArgumentError.notNull('artwork.id');
    }

    var $artworkLikes = artworkLikes.copyWith(artworkId: artwork.id);
    await session.db.updateRow<ArtworkLikes>(
      $artworkLikes,
      columns: [ArtworkLikes.t.artworkId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [ArtworkLikes] and [User]
  /// by setting the [ArtworkLikes]'s foreign key `likedById` to refer to the [User].
  Future<void> likedBy(
    _i1.Session session,
    ArtworkLikes artworkLikes,
    _i3.User likedBy, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkLikes.id == null) {
      throw ArgumentError.notNull('artworkLikes.id');
    }
    if (likedBy.id == null) {
      throw ArgumentError.notNull('likedBy.id');
    }

    var $artworkLikes = artworkLikes.copyWith(likedById: likedBy.id);
    await session.db.updateRow<ArtworkLikes>(
      $artworkLikes,
      columns: [ArtworkLikes.t.likedById],
      transaction: transaction,
    );
  }
}
