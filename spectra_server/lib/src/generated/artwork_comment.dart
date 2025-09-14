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
import 'artwork_comment.dart' as _i4;

abstract class ArtworkComment
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ArtworkComment._({
    this.id,
    required this.artworkId,
    this.artwork,
    required this.ownerId,
    this.owner,
    this.text,
    DateTime? dateCreated,
    this.updatedAt,
    int? likesCount,
    int? repliesCount,
    this.parentId,
    this.parent,
    bool? isDeleted,
  })  : dateCreated = dateCreated ?? DateTime.now(),
        likesCount = likesCount ?? 0,
        repliesCount = repliesCount ?? 0,
        isDeleted = isDeleted ?? false;

  factory ArtworkComment({
    int? id,
    required int artworkId,
    _i2.Artwork? artwork,
    required int ownerId,
    _i3.User? owner,
    String? text,
    DateTime? dateCreated,
    DateTime? updatedAt,
    int? likesCount,
    int? repliesCount,
    int? parentId,
    _i4.ArtworkComment? parent,
    bool? isDeleted,
  }) = _ArtworkCommentImpl;

  factory ArtworkComment.fromJson(Map<String, dynamic> jsonSerialization) {
    return ArtworkComment(
      id: jsonSerialization['id'] as int?,
      artworkId: jsonSerialization['artworkId'] as int,
      artwork: jsonSerialization['artwork'] == null
          ? null
          : _i2.Artwork.fromJson(
              (jsonSerialization['artwork'] as Map<String, dynamic>)),
      ownerId: jsonSerialization['ownerId'] as int,
      owner: jsonSerialization['owner'] == null
          ? null
          : _i3.User.fromJson(
              (jsonSerialization['owner'] as Map<String, dynamic>)),
      text: jsonSerialization['text'] as String?,
      dateCreated: jsonSerialization['dateCreated'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['dateCreated']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      likesCount: jsonSerialization['likesCount'] as int?,
      repliesCount: jsonSerialization['repliesCount'] as int?,
      parentId: jsonSerialization['parentId'] as int?,
      parent: jsonSerialization['parent'] == null
          ? null
          : _i4.ArtworkComment.fromJson(
              (jsonSerialization['parent'] as Map<String, dynamic>)),
      isDeleted: jsonSerialization['isDeleted'] as bool?,
    );
  }

  static final t = ArtworkCommentTable();

  static const db = ArtworkCommentRepository._();

  @override
  int? id;

  int artworkId;

  _i2.Artwork? artwork;

  int ownerId;

  _i3.User? owner;

  String? text;

  DateTime? dateCreated;

  DateTime? updatedAt;

  int? likesCount;

  int? repliesCount;

  int? parentId;

  _i4.ArtworkComment? parent;

  bool? isDeleted;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [ArtworkComment]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ArtworkComment copyWith({
    int? id,
    int? artworkId,
    _i2.Artwork? artwork,
    int? ownerId,
    _i3.User? owner,
    String? text,
    DateTime? dateCreated,
    DateTime? updatedAt,
    int? likesCount,
    int? repliesCount,
    int? parentId,
    _i4.ArtworkComment? parent,
    bool? isDeleted,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'artworkId': artworkId,
      if (artwork != null) 'artwork': artwork?.toJson(),
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJson(),
      if (text != null) 'text': text,
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (likesCount != null) 'likesCount': likesCount,
      if (repliesCount != null) 'repliesCount': repliesCount,
      if (parentId != null) 'parentId': parentId,
      if (parent != null) 'parent': parent?.toJson(),
      if (isDeleted != null) 'isDeleted': isDeleted,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'artworkId': artworkId,
      if (artwork != null) 'artwork': artwork?.toJsonForProtocol(),
      'ownerId': ownerId,
      if (owner != null) 'owner': owner?.toJsonForProtocol(),
      if (text != null) 'text': text,
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (likesCount != null) 'likesCount': likesCount,
      if (repliesCount != null) 'repliesCount': repliesCount,
      if (parentId != null) 'parentId': parentId,
      if (parent != null) 'parent': parent?.toJsonForProtocol(),
      if (isDeleted != null) 'isDeleted': isDeleted,
    };
  }

  static ArtworkCommentInclude include({
    _i2.ArtworkInclude? artwork,
    _i3.UserInclude? owner,
    _i4.ArtworkCommentInclude? parent,
  }) {
    return ArtworkCommentInclude._(
      artwork: artwork,
      owner: owner,
      parent: parent,
    );
  }

  static ArtworkCommentIncludeList includeList({
    _i1.WhereExpressionBuilder<ArtworkCommentTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArtworkCommentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkCommentTable>? orderByList,
    ArtworkCommentInclude? include,
  }) {
    return ArtworkCommentIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ArtworkComment.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ArtworkComment.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ArtworkCommentImpl extends ArtworkComment {
  _ArtworkCommentImpl({
    int? id,
    required int artworkId,
    _i2.Artwork? artwork,
    required int ownerId,
    _i3.User? owner,
    String? text,
    DateTime? dateCreated,
    DateTime? updatedAt,
    int? likesCount,
    int? repliesCount,
    int? parentId,
    _i4.ArtworkComment? parent,
    bool? isDeleted,
  }) : super._(
          id: id,
          artworkId: artworkId,
          artwork: artwork,
          ownerId: ownerId,
          owner: owner,
          text: text,
          dateCreated: dateCreated,
          updatedAt: updatedAt,
          likesCount: likesCount,
          repliesCount: repliesCount,
          parentId: parentId,
          parent: parent,
          isDeleted: isDeleted,
        );

  /// Returns a shallow copy of this [ArtworkComment]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ArtworkComment copyWith({
    Object? id = _Undefined,
    int? artworkId,
    Object? artwork = _Undefined,
    int? ownerId,
    Object? owner = _Undefined,
    Object? text = _Undefined,
    Object? dateCreated = _Undefined,
    Object? updatedAt = _Undefined,
    Object? likesCount = _Undefined,
    Object? repliesCount = _Undefined,
    Object? parentId = _Undefined,
    Object? parent = _Undefined,
    Object? isDeleted = _Undefined,
  }) {
    return ArtworkComment(
      id: id is int? ? id : this.id,
      artworkId: artworkId ?? this.artworkId,
      artwork: artwork is _i2.Artwork? ? artwork : this.artwork?.copyWith(),
      ownerId: ownerId ?? this.ownerId,
      owner: owner is _i3.User? ? owner : this.owner?.copyWith(),
      text: text is String? ? text : this.text,
      dateCreated: dateCreated is DateTime? ? dateCreated : this.dateCreated,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
      likesCount: likesCount is int? ? likesCount : this.likesCount,
      repliesCount: repliesCount is int? ? repliesCount : this.repliesCount,
      parentId: parentId is int? ? parentId : this.parentId,
      parent: parent is _i4.ArtworkComment? ? parent : this.parent?.copyWith(),
      isDeleted: isDeleted is bool? ? isDeleted : this.isDeleted,
    );
  }
}

class ArtworkCommentTable extends _i1.Table<int?> {
  ArtworkCommentTable({super.tableRelation})
      : super(tableName: 'artwork_comment') {
    artworkId = _i1.ColumnInt(
      'artworkId',
      this,
    );
    ownerId = _i1.ColumnInt(
      'ownerId',
      this,
    );
    text = _i1.ColumnString(
      'text',
      this,
    );
    dateCreated = _i1.ColumnDateTime(
      'dateCreated',
      this,
      hasDefault: true,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
    );
    likesCount = _i1.ColumnInt(
      'likesCount',
      this,
      hasDefault: true,
    );
    repliesCount = _i1.ColumnInt(
      'repliesCount',
      this,
      hasDefault: true,
    );
    parentId = _i1.ColumnInt(
      'parentId',
      this,
    );
    isDeleted = _i1.ColumnBool(
      'isDeleted',
      this,
      hasDefault: true,
    );
  }

  late final _i1.ColumnInt artworkId;

  _i2.ArtworkTable? _artwork;

  late final _i1.ColumnInt ownerId;

  _i3.UserTable? _owner;

  late final _i1.ColumnString text;

  late final _i1.ColumnDateTime dateCreated;

  late final _i1.ColumnDateTime updatedAt;

  late final _i1.ColumnInt likesCount;

  late final _i1.ColumnInt repliesCount;

  late final _i1.ColumnInt parentId;

  _i4.ArtworkCommentTable? _parent;

  late final _i1.ColumnBool isDeleted;

  _i2.ArtworkTable get artwork {
    if (_artwork != null) return _artwork!;
    _artwork = _i1.createRelationTable(
      relationFieldName: 'artwork',
      field: ArtworkComment.t.artworkId,
      foreignField: _i2.Artwork.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ArtworkTable(tableRelation: foreignTableRelation),
    );
    return _artwork!;
  }

  _i3.UserTable get owner {
    if (_owner != null) return _owner!;
    _owner = _i1.createRelationTable(
      relationFieldName: 'owner',
      field: ArtworkComment.t.ownerId,
      foreignField: _i3.User.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.UserTable(tableRelation: foreignTableRelation),
    );
    return _owner!;
  }

  _i4.ArtworkCommentTable get parent {
    if (_parent != null) return _parent!;
    _parent = _i1.createRelationTable(
      relationFieldName: 'parent',
      field: ArtworkComment.t.parentId,
      foreignField: _i4.ArtworkComment.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.ArtworkCommentTable(tableRelation: foreignTableRelation),
    );
    return _parent!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        artworkId,
        ownerId,
        text,
        dateCreated,
        updatedAt,
        likesCount,
        repliesCount,
        parentId,
        isDeleted,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'artwork') {
      return artwork;
    }
    if (relationField == 'owner') {
      return owner;
    }
    if (relationField == 'parent') {
      return parent;
    }
    return null;
  }
}

class ArtworkCommentInclude extends _i1.IncludeObject {
  ArtworkCommentInclude._({
    _i2.ArtworkInclude? artwork,
    _i3.UserInclude? owner,
    _i4.ArtworkCommentInclude? parent,
  }) {
    _artwork = artwork;
    _owner = owner;
    _parent = parent;
  }

  _i2.ArtworkInclude? _artwork;

  _i3.UserInclude? _owner;

  _i4.ArtworkCommentInclude? _parent;

  @override
  Map<String, _i1.Include?> get includes => {
        'artwork': _artwork,
        'owner': _owner,
        'parent': _parent,
      };

  @override
  _i1.Table<int?> get table => ArtworkComment.t;
}

class ArtworkCommentIncludeList extends _i1.IncludeList {
  ArtworkCommentIncludeList._({
    _i1.WhereExpressionBuilder<ArtworkCommentTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ArtworkComment.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ArtworkComment.t;
}

class ArtworkCommentRepository {
  const ArtworkCommentRepository._();

  final attachRow = const ArtworkCommentAttachRowRepository._();

  final detachRow = const ArtworkCommentDetachRowRepository._();

  /// Returns a list of [ArtworkComment]s matching the given query parameters.
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
  Future<List<ArtworkComment>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkCommentTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArtworkCommentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkCommentTable>? orderByList,
    _i1.Transaction? transaction,
    ArtworkCommentInclude? include,
  }) async {
    return session.db.find<ArtworkComment>(
      where: where?.call(ArtworkComment.t),
      orderBy: orderBy?.call(ArtworkComment.t),
      orderByList: orderByList?.call(ArtworkComment.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [ArtworkComment] matching the given query parameters.
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
  Future<ArtworkComment?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkCommentTable>? where,
    int? offset,
    _i1.OrderByBuilder<ArtworkCommentTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkCommentTable>? orderByList,
    _i1.Transaction? transaction,
    ArtworkCommentInclude? include,
  }) async {
    return session.db.findFirstRow<ArtworkComment>(
      where: where?.call(ArtworkComment.t),
      orderBy: orderBy?.call(ArtworkComment.t),
      orderByList: orderByList?.call(ArtworkComment.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [ArtworkComment] by its [id] or null if no such row exists.
  Future<ArtworkComment?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ArtworkCommentInclude? include,
  }) async {
    return session.db.findById<ArtworkComment>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [ArtworkComment]s in the list and returns the inserted rows.
  ///
  /// The returned [ArtworkComment]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ArtworkComment>> insert(
    _i1.Session session,
    List<ArtworkComment> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ArtworkComment>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ArtworkComment] and returns the inserted row.
  ///
  /// The returned [ArtworkComment] will have its `id` field set.
  Future<ArtworkComment> insertRow(
    _i1.Session session,
    ArtworkComment row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ArtworkComment>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ArtworkComment]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ArtworkComment>> update(
    _i1.Session session,
    List<ArtworkComment> rows, {
    _i1.ColumnSelections<ArtworkCommentTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ArtworkComment>(
      rows,
      columns: columns?.call(ArtworkComment.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ArtworkComment]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ArtworkComment> updateRow(
    _i1.Session session,
    ArtworkComment row, {
    _i1.ColumnSelections<ArtworkCommentTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ArtworkComment>(
      row,
      columns: columns?.call(ArtworkComment.t),
      transaction: transaction,
    );
  }

  /// Deletes all [ArtworkComment]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ArtworkComment>> delete(
    _i1.Session session,
    List<ArtworkComment> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ArtworkComment>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ArtworkComment].
  Future<ArtworkComment> deleteRow(
    _i1.Session session,
    ArtworkComment row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ArtworkComment>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ArtworkComment>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ArtworkCommentTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ArtworkComment>(
      where: where(ArtworkComment.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkCommentTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ArtworkComment>(
      where: where?.call(ArtworkComment.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ArtworkCommentAttachRowRepository {
  const ArtworkCommentAttachRowRepository._();

  /// Creates a relation between the given [ArtworkComment] and [Artwork]
  /// by setting the [ArtworkComment]'s foreign key `artworkId` to refer to the [Artwork].
  Future<void> artwork(
    _i1.Session session,
    ArtworkComment artworkComment,
    _i2.Artwork artwork, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkComment.id == null) {
      throw ArgumentError.notNull('artworkComment.id');
    }
    if (artwork.id == null) {
      throw ArgumentError.notNull('artwork.id');
    }

    var $artworkComment = artworkComment.copyWith(artworkId: artwork.id);
    await session.db.updateRow<ArtworkComment>(
      $artworkComment,
      columns: [ArtworkComment.t.artworkId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [ArtworkComment] and [User]
  /// by setting the [ArtworkComment]'s foreign key `ownerId` to refer to the [User].
  Future<void> owner(
    _i1.Session session,
    ArtworkComment artworkComment,
    _i3.User owner, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkComment.id == null) {
      throw ArgumentError.notNull('artworkComment.id');
    }
    if (owner.id == null) {
      throw ArgumentError.notNull('owner.id');
    }

    var $artworkComment = artworkComment.copyWith(ownerId: owner.id);
    await session.db.updateRow<ArtworkComment>(
      $artworkComment,
      columns: [ArtworkComment.t.ownerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [ArtworkComment] and [ArtworkComment]
  /// by setting the [ArtworkComment]'s foreign key `parentId` to refer to the [ArtworkComment].
  Future<void> parent(
    _i1.Session session,
    ArtworkComment artworkComment,
    _i4.ArtworkComment parent, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkComment.id == null) {
      throw ArgumentError.notNull('artworkComment.id');
    }
    if (parent.id == null) {
      throw ArgumentError.notNull('parent.id');
    }

    var $artworkComment = artworkComment.copyWith(parentId: parent.id);
    await session.db.updateRow<ArtworkComment>(
      $artworkComment,
      columns: [ArtworkComment.t.parentId],
      transaction: transaction,
    );
  }
}

class ArtworkCommentDetachRowRepository {
  const ArtworkCommentDetachRowRepository._();

  /// Detaches the relation between this [ArtworkComment] and the [ArtworkComment] set in `parent`
  /// by setting the [ArtworkComment]'s foreign key `parentId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> parent(
    _i1.Session session,
    ArtworkComment artworkcomment, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkcomment.id == null) {
      throw ArgumentError.notNull('artworkcomment.id');
    }

    var $artworkcomment = artworkcomment.copyWith(parentId: null);
    await session.db.updateRow<ArtworkComment>(
      $artworkcomment,
      columns: [ArtworkComment.t.parentId],
      transaction: transaction,
    );
  }
}
