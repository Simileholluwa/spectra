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
import 'artwork_comment.dart' as _i2;
import 'user.dart' as _i3;

abstract class ArtworkCommentLikes
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ArtworkCommentLikes._({
    this.id,
    required this.artworkCommentId,
    this.artworkComment,
    required this.likedById,
    this.likedBy,
    DateTime? dateCreated,
  }) : dateCreated = dateCreated ?? DateTime.now();

  factory ArtworkCommentLikes({
    int? id,
    required int artworkCommentId,
    _i2.ArtworkComment? artworkComment,
    required int likedById,
    _i3.User? likedBy,
    DateTime? dateCreated,
  }) = _ArtworkCommentLikesImpl;

  factory ArtworkCommentLikes.fromJson(Map<String, dynamic> jsonSerialization) {
    return ArtworkCommentLikes(
      id: jsonSerialization['id'] as int?,
      artworkCommentId: jsonSerialization['artworkCommentId'] as int,
      artworkComment: jsonSerialization['artworkComment'] == null
          ? null
          : _i2.ArtworkComment.fromJson(
              (jsonSerialization['artworkComment'] as Map<String, dynamic>)),
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

  static final t = ArtworkCommentLikesTable();

  static const db = ArtworkCommentLikesRepository._();

  @override
  int? id;

  int artworkCommentId;

  _i2.ArtworkComment? artworkComment;

  int likedById;

  _i3.User? likedBy;

  DateTime? dateCreated;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [ArtworkCommentLikes]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ArtworkCommentLikes copyWith({
    int? id,
    int? artworkCommentId,
    _i2.ArtworkComment? artworkComment,
    int? likedById,
    _i3.User? likedBy,
    DateTime? dateCreated,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'artworkCommentId': artworkCommentId,
      if (artworkComment != null) 'artworkComment': artworkComment?.toJson(),
      'likedById': likedById,
      if (likedBy != null) 'likedBy': likedBy?.toJson(),
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'artworkCommentId': artworkCommentId,
      if (artworkComment != null)
        'artworkComment': artworkComment?.toJsonForProtocol(),
      'likedById': likedById,
      if (likedBy != null) 'likedBy': likedBy?.toJsonForProtocol(),
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
    };
  }

  static ArtworkCommentLikesInclude include({
    _i2.ArtworkCommentInclude? artworkComment,
    _i3.UserInclude? likedBy,
  }) {
    return ArtworkCommentLikesInclude._(
      artworkComment: artworkComment,
      likedBy: likedBy,
    );
  }

  static ArtworkCommentLikesIncludeList includeList({
    _i1.WhereExpressionBuilder<ArtworkCommentLikesTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArtworkCommentLikesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkCommentLikesTable>? orderByList,
    ArtworkCommentLikesInclude? include,
  }) {
    return ArtworkCommentLikesIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ArtworkCommentLikes.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ArtworkCommentLikes.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ArtworkCommentLikesImpl extends ArtworkCommentLikes {
  _ArtworkCommentLikesImpl({
    int? id,
    required int artworkCommentId,
    _i2.ArtworkComment? artworkComment,
    required int likedById,
    _i3.User? likedBy,
    DateTime? dateCreated,
  }) : super._(
          id: id,
          artworkCommentId: artworkCommentId,
          artworkComment: artworkComment,
          likedById: likedById,
          likedBy: likedBy,
          dateCreated: dateCreated,
        );

  /// Returns a shallow copy of this [ArtworkCommentLikes]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ArtworkCommentLikes copyWith({
    Object? id = _Undefined,
    int? artworkCommentId,
    Object? artworkComment = _Undefined,
    int? likedById,
    Object? likedBy = _Undefined,
    Object? dateCreated = _Undefined,
  }) {
    return ArtworkCommentLikes(
      id: id is int? ? id : this.id,
      artworkCommentId: artworkCommentId ?? this.artworkCommentId,
      artworkComment: artworkComment is _i2.ArtworkComment?
          ? artworkComment
          : this.artworkComment?.copyWith(),
      likedById: likedById ?? this.likedById,
      likedBy: likedBy is _i3.User? ? likedBy : this.likedBy?.copyWith(),
      dateCreated: dateCreated is DateTime? ? dateCreated : this.dateCreated,
    );
  }
}

class ArtworkCommentLikesTable extends _i1.Table<int?> {
  ArtworkCommentLikesTable({super.tableRelation})
      : super(tableName: 'artwork_comment_likes') {
    artworkCommentId = _i1.ColumnInt(
      'artworkCommentId',
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

  late final _i1.ColumnInt artworkCommentId;

  _i2.ArtworkCommentTable? _artworkComment;

  late final _i1.ColumnInt likedById;

  _i3.UserTable? _likedBy;

  late final _i1.ColumnDateTime dateCreated;

  _i2.ArtworkCommentTable get artworkComment {
    if (_artworkComment != null) return _artworkComment!;
    _artworkComment = _i1.createRelationTable(
      relationFieldName: 'artworkComment',
      field: ArtworkCommentLikes.t.artworkCommentId,
      foreignField: _i2.ArtworkComment.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ArtworkCommentTable(tableRelation: foreignTableRelation),
    );
    return _artworkComment!;
  }

  _i3.UserTable get likedBy {
    if (_likedBy != null) return _likedBy!;
    _likedBy = _i1.createRelationTable(
      relationFieldName: 'likedBy',
      field: ArtworkCommentLikes.t.likedById,
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
        artworkCommentId,
        likedById,
        dateCreated,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'artworkComment') {
      return artworkComment;
    }
    if (relationField == 'likedBy') {
      return likedBy;
    }
    return null;
  }
}

class ArtworkCommentLikesInclude extends _i1.IncludeObject {
  ArtworkCommentLikesInclude._({
    _i2.ArtworkCommentInclude? artworkComment,
    _i3.UserInclude? likedBy,
  }) {
    _artworkComment = artworkComment;
    _likedBy = likedBy;
  }

  _i2.ArtworkCommentInclude? _artworkComment;

  _i3.UserInclude? _likedBy;

  @override
  Map<String, _i1.Include?> get includes => {
        'artworkComment': _artworkComment,
        'likedBy': _likedBy,
      };

  @override
  _i1.Table<int?> get table => ArtworkCommentLikes.t;
}

class ArtworkCommentLikesIncludeList extends _i1.IncludeList {
  ArtworkCommentLikesIncludeList._({
    _i1.WhereExpressionBuilder<ArtworkCommentLikesTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ArtworkCommentLikes.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ArtworkCommentLikes.t;
}

class ArtworkCommentLikesRepository {
  const ArtworkCommentLikesRepository._();

  final attachRow = const ArtworkCommentLikesAttachRowRepository._();

  /// Returns a list of [ArtworkCommentLikes]s matching the given query parameters.
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
  Future<List<ArtworkCommentLikes>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkCommentLikesTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArtworkCommentLikesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkCommentLikesTable>? orderByList,
    _i1.Transaction? transaction,
    ArtworkCommentLikesInclude? include,
  }) async {
    return session.db.find<ArtworkCommentLikes>(
      where: where?.call(ArtworkCommentLikes.t),
      orderBy: orderBy?.call(ArtworkCommentLikes.t),
      orderByList: orderByList?.call(ArtworkCommentLikes.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [ArtworkCommentLikes] matching the given query parameters.
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
  Future<ArtworkCommentLikes?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkCommentLikesTable>? where,
    int? offset,
    _i1.OrderByBuilder<ArtworkCommentLikesTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkCommentLikesTable>? orderByList,
    _i1.Transaction? transaction,
    ArtworkCommentLikesInclude? include,
  }) async {
    return session.db.findFirstRow<ArtworkCommentLikes>(
      where: where?.call(ArtworkCommentLikes.t),
      orderBy: orderBy?.call(ArtworkCommentLikes.t),
      orderByList: orderByList?.call(ArtworkCommentLikes.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [ArtworkCommentLikes] by its [id] or null if no such row exists.
  Future<ArtworkCommentLikes?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ArtworkCommentLikesInclude? include,
  }) async {
    return session.db.findById<ArtworkCommentLikes>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [ArtworkCommentLikes]s in the list and returns the inserted rows.
  ///
  /// The returned [ArtworkCommentLikes]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ArtworkCommentLikes>> insert(
    _i1.Session session,
    List<ArtworkCommentLikes> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ArtworkCommentLikes>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ArtworkCommentLikes] and returns the inserted row.
  ///
  /// The returned [ArtworkCommentLikes] will have its `id` field set.
  Future<ArtworkCommentLikes> insertRow(
    _i1.Session session,
    ArtworkCommentLikes row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ArtworkCommentLikes>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ArtworkCommentLikes]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ArtworkCommentLikes>> update(
    _i1.Session session,
    List<ArtworkCommentLikes> rows, {
    _i1.ColumnSelections<ArtworkCommentLikesTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ArtworkCommentLikes>(
      rows,
      columns: columns?.call(ArtworkCommentLikes.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ArtworkCommentLikes]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ArtworkCommentLikes> updateRow(
    _i1.Session session,
    ArtworkCommentLikes row, {
    _i1.ColumnSelections<ArtworkCommentLikesTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ArtworkCommentLikes>(
      row,
      columns: columns?.call(ArtworkCommentLikes.t),
      transaction: transaction,
    );
  }

  /// Deletes all [ArtworkCommentLikes]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ArtworkCommentLikes>> delete(
    _i1.Session session,
    List<ArtworkCommentLikes> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ArtworkCommentLikes>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ArtworkCommentLikes].
  Future<ArtworkCommentLikes> deleteRow(
    _i1.Session session,
    ArtworkCommentLikes row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ArtworkCommentLikes>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ArtworkCommentLikes>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ArtworkCommentLikesTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ArtworkCommentLikes>(
      where: where(ArtworkCommentLikes.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkCommentLikesTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ArtworkCommentLikes>(
      where: where?.call(ArtworkCommentLikes.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ArtworkCommentLikesAttachRowRepository {
  const ArtworkCommentLikesAttachRowRepository._();

  /// Creates a relation between the given [ArtworkCommentLikes] and [ArtworkComment]
  /// by setting the [ArtworkCommentLikes]'s foreign key `artworkCommentId` to refer to the [ArtworkComment].
  Future<void> artworkComment(
    _i1.Session session,
    ArtworkCommentLikes artworkCommentLikes,
    _i2.ArtworkComment artworkComment, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkCommentLikes.id == null) {
      throw ArgumentError.notNull('artworkCommentLikes.id');
    }
    if (artworkComment.id == null) {
      throw ArgumentError.notNull('artworkComment.id');
    }

    var $artworkCommentLikes =
        artworkCommentLikes.copyWith(artworkCommentId: artworkComment.id);
    await session.db.updateRow<ArtworkCommentLikes>(
      $artworkCommentLikes,
      columns: [ArtworkCommentLikes.t.artworkCommentId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [ArtworkCommentLikes] and [User]
  /// by setting the [ArtworkCommentLikes]'s foreign key `likedById` to refer to the [User].
  Future<void> likedBy(
    _i1.Session session,
    ArtworkCommentLikes artworkCommentLikes,
    _i3.User likedBy, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkCommentLikes.id == null) {
      throw ArgumentError.notNull('artworkCommentLikes.id');
    }
    if (likedBy.id == null) {
      throw ArgumentError.notNull('likedBy.id');
    }

    var $artworkCommentLikes =
        artworkCommentLikes.copyWith(likedById: likedBy.id);
    await session.db.updateRow<ArtworkCommentLikes>(
      $artworkCommentLikes,
      columns: [ArtworkCommentLikes.t.likedById],
      transaction: transaction,
    );
  }
}
