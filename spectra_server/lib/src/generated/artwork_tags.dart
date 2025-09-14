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
import 'tag.dart' as _i3;

abstract class ArtworkTags
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ArtworkTags._({
    this.id,
    required this.artworkId,
    this.artwork,
    required this.tagId,
    this.tag,
  });

  factory ArtworkTags({
    int? id,
    required int artworkId,
    _i2.Artwork? artwork,
    required int tagId,
    _i3.Tag? tag,
  }) = _ArtworkTagsImpl;

  factory ArtworkTags.fromJson(Map<String, dynamic> jsonSerialization) {
    return ArtworkTags(
      id: jsonSerialization['id'] as int?,
      artworkId: jsonSerialization['artworkId'] as int,
      artwork: jsonSerialization['artwork'] == null
          ? null
          : _i2.Artwork.fromJson(
              (jsonSerialization['artwork'] as Map<String, dynamic>)),
      tagId: jsonSerialization['tagId'] as int,
      tag: jsonSerialization['tag'] == null
          ? null
          : _i3.Tag.fromJson(
              (jsonSerialization['tag'] as Map<String, dynamic>)),
    );
  }

  static final t = ArtworkTagsTable();

  static const db = ArtworkTagsRepository._();

  @override
  int? id;

  int artworkId;

  _i2.Artwork? artwork;

  int tagId;

  _i3.Tag? tag;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [ArtworkTags]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ArtworkTags copyWith({
    int? id,
    int? artworkId,
    _i2.Artwork? artwork,
    int? tagId,
    _i3.Tag? tag,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'artworkId': artworkId,
      if (artwork != null) 'artwork': artwork?.toJson(),
      'tagId': tagId,
      if (tag != null) 'tag': tag?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'artworkId': artworkId,
      if (artwork != null) 'artwork': artwork?.toJsonForProtocol(),
      'tagId': tagId,
      if (tag != null) 'tag': tag?.toJsonForProtocol(),
    };
  }

  static ArtworkTagsInclude include({
    _i2.ArtworkInclude? artwork,
    _i3.TagInclude? tag,
  }) {
    return ArtworkTagsInclude._(
      artwork: artwork,
      tag: tag,
    );
  }

  static ArtworkTagsIncludeList includeList({
    _i1.WhereExpressionBuilder<ArtworkTagsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArtworkTagsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkTagsTable>? orderByList,
    ArtworkTagsInclude? include,
  }) {
    return ArtworkTagsIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ArtworkTags.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ArtworkTags.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ArtworkTagsImpl extends ArtworkTags {
  _ArtworkTagsImpl({
    int? id,
    required int artworkId,
    _i2.Artwork? artwork,
    required int tagId,
    _i3.Tag? tag,
  }) : super._(
          id: id,
          artworkId: artworkId,
          artwork: artwork,
          tagId: tagId,
          tag: tag,
        );

  /// Returns a shallow copy of this [ArtworkTags]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ArtworkTags copyWith({
    Object? id = _Undefined,
    int? artworkId,
    Object? artwork = _Undefined,
    int? tagId,
    Object? tag = _Undefined,
  }) {
    return ArtworkTags(
      id: id is int? ? id : this.id,
      artworkId: artworkId ?? this.artworkId,
      artwork: artwork is _i2.Artwork? ? artwork : this.artwork?.copyWith(),
      tagId: tagId ?? this.tagId,
      tag: tag is _i3.Tag? ? tag : this.tag?.copyWith(),
    );
  }
}

class ArtworkTagsTable extends _i1.Table<int?> {
  ArtworkTagsTable({super.tableRelation}) : super(tableName: 'artwork_tags') {
    artworkId = _i1.ColumnInt(
      'artworkId',
      this,
    );
    tagId = _i1.ColumnInt(
      'tagId',
      this,
    );
  }

  late final _i1.ColumnInt artworkId;

  _i2.ArtworkTable? _artwork;

  late final _i1.ColumnInt tagId;

  _i3.TagTable? _tag;

  _i2.ArtworkTable get artwork {
    if (_artwork != null) return _artwork!;
    _artwork = _i1.createRelationTable(
      relationFieldName: 'artwork',
      field: ArtworkTags.t.artworkId,
      foreignField: _i2.Artwork.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ArtworkTable(tableRelation: foreignTableRelation),
    );
    return _artwork!;
  }

  _i3.TagTable get tag {
    if (_tag != null) return _tag!;
    _tag = _i1.createRelationTable(
      relationFieldName: 'tag',
      field: ArtworkTags.t.tagId,
      foreignField: _i3.Tag.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.TagTable(tableRelation: foreignTableRelation),
    );
    return _tag!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        artworkId,
        tagId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'artwork') {
      return artwork;
    }
    if (relationField == 'tag') {
      return tag;
    }
    return null;
  }
}

class ArtworkTagsInclude extends _i1.IncludeObject {
  ArtworkTagsInclude._({
    _i2.ArtworkInclude? artwork,
    _i3.TagInclude? tag,
  }) {
    _artwork = artwork;
    _tag = tag;
  }

  _i2.ArtworkInclude? _artwork;

  _i3.TagInclude? _tag;

  @override
  Map<String, _i1.Include?> get includes => {
        'artwork': _artwork,
        'tag': _tag,
      };

  @override
  _i1.Table<int?> get table => ArtworkTags.t;
}

class ArtworkTagsIncludeList extends _i1.IncludeList {
  ArtworkTagsIncludeList._({
    _i1.WhereExpressionBuilder<ArtworkTagsTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ArtworkTags.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ArtworkTags.t;
}

class ArtworkTagsRepository {
  const ArtworkTagsRepository._();

  final attachRow = const ArtworkTagsAttachRowRepository._();

  /// Returns a list of [ArtworkTags]s matching the given query parameters.
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
  Future<List<ArtworkTags>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkTagsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArtworkTagsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkTagsTable>? orderByList,
    _i1.Transaction? transaction,
    ArtworkTagsInclude? include,
  }) async {
    return session.db.find<ArtworkTags>(
      where: where?.call(ArtworkTags.t),
      orderBy: orderBy?.call(ArtworkTags.t),
      orderByList: orderByList?.call(ArtworkTags.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [ArtworkTags] matching the given query parameters.
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
  Future<ArtworkTags?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkTagsTable>? where,
    int? offset,
    _i1.OrderByBuilder<ArtworkTagsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkTagsTable>? orderByList,
    _i1.Transaction? transaction,
    ArtworkTagsInclude? include,
  }) async {
    return session.db.findFirstRow<ArtworkTags>(
      where: where?.call(ArtworkTags.t),
      orderBy: orderBy?.call(ArtworkTags.t),
      orderByList: orderByList?.call(ArtworkTags.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [ArtworkTags] by its [id] or null if no such row exists.
  Future<ArtworkTags?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ArtworkTagsInclude? include,
  }) async {
    return session.db.findById<ArtworkTags>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [ArtworkTags]s in the list and returns the inserted rows.
  ///
  /// The returned [ArtworkTags]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ArtworkTags>> insert(
    _i1.Session session,
    List<ArtworkTags> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ArtworkTags>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ArtworkTags] and returns the inserted row.
  ///
  /// The returned [ArtworkTags] will have its `id` field set.
  Future<ArtworkTags> insertRow(
    _i1.Session session,
    ArtworkTags row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ArtworkTags>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ArtworkTags]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ArtworkTags>> update(
    _i1.Session session,
    List<ArtworkTags> rows, {
    _i1.ColumnSelections<ArtworkTagsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ArtworkTags>(
      rows,
      columns: columns?.call(ArtworkTags.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ArtworkTags]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ArtworkTags> updateRow(
    _i1.Session session,
    ArtworkTags row, {
    _i1.ColumnSelections<ArtworkTagsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ArtworkTags>(
      row,
      columns: columns?.call(ArtworkTags.t),
      transaction: transaction,
    );
  }

  /// Deletes all [ArtworkTags]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ArtworkTags>> delete(
    _i1.Session session,
    List<ArtworkTags> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ArtworkTags>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ArtworkTags].
  Future<ArtworkTags> deleteRow(
    _i1.Session session,
    ArtworkTags row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ArtworkTags>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ArtworkTags>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ArtworkTagsTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ArtworkTags>(
      where: where(ArtworkTags.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkTagsTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ArtworkTags>(
      where: where?.call(ArtworkTags.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ArtworkTagsAttachRowRepository {
  const ArtworkTagsAttachRowRepository._();

  /// Creates a relation between the given [ArtworkTags] and [Artwork]
  /// by setting the [ArtworkTags]'s foreign key `artworkId` to refer to the [Artwork].
  Future<void> artwork(
    _i1.Session session,
    ArtworkTags artworkTags,
    _i2.Artwork artwork, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkTags.id == null) {
      throw ArgumentError.notNull('artworkTags.id');
    }
    if (artwork.id == null) {
      throw ArgumentError.notNull('artwork.id');
    }

    var $artworkTags = artworkTags.copyWith(artworkId: artwork.id);
    await session.db.updateRow<ArtworkTags>(
      $artworkTags,
      columns: [ArtworkTags.t.artworkId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [ArtworkTags] and [Tag]
  /// by setting the [ArtworkTags]'s foreign key `tagId` to refer to the [Tag].
  Future<void> tag(
    _i1.Session session,
    ArtworkTags artworkTags,
    _i3.Tag tag, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkTags.id == null) {
      throw ArgumentError.notNull('artworkTags.id');
    }
    if (tag.id == null) {
      throw ArgumentError.notNull('tag.id');
    }

    var $artworkTags = artworkTags.copyWith(tagId: tag.id);
    await session.db.updateRow<ArtworkTags>(
      $artworkTags,
      columns: [ArtworkTags.t.tagId],
      transaction: transaction,
    );
  }
}
