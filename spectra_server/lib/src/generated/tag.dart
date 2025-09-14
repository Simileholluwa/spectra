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
import 'artwork_tags.dart' as _i2;

abstract class Tag implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Tag._({
    this.id,
    this.tags,
    required this.name,
    int? usageCount,
  }) : usageCount = usageCount ?? 1;

  factory Tag({
    int? id,
    List<_i2.ArtworkTags>? tags,
    required String name,
    int? usageCount,
  }) = _TagImpl;

  factory Tag.fromJson(Map<String, dynamic> jsonSerialization) {
    return Tag(
      id: jsonSerialization['id'] as int?,
      tags: (jsonSerialization['tags'] as List?)
          ?.map((e) => _i2.ArtworkTags.fromJson((e as Map<String, dynamic>)))
          .toList(),
      name: jsonSerialization['name'] as String,
      usageCount: jsonSerialization['usageCount'] as int?,
    );
  }

  static final t = TagTable();

  static const db = TagRepository._();

  @override
  int? id;

  List<_i2.ArtworkTags>? tags;

  String name;

  int? usageCount;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Tag]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Tag copyWith({
    int? id,
    List<_i2.ArtworkTags>? tags,
    String? name,
    int? usageCount,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (tags != null) 'tags': tags?.toJson(valueToJson: (v) => v.toJson()),
      'name': name,
      if (usageCount != null) 'usageCount': usageCount,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      if (tags != null)
        'tags': tags?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'name': name,
      if (usageCount != null) 'usageCount': usageCount,
    };
  }

  static TagInclude include({_i2.ArtworkTagsIncludeList? tags}) {
    return TagInclude._(tags: tags);
  }

  static TagIncludeList includeList({
    _i1.WhereExpressionBuilder<TagTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TagTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TagTable>? orderByList,
    TagInclude? include,
  }) {
    return TagIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Tag.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Tag.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TagImpl extends Tag {
  _TagImpl({
    int? id,
    List<_i2.ArtworkTags>? tags,
    required String name,
    int? usageCount,
  }) : super._(
          id: id,
          tags: tags,
          name: name,
          usageCount: usageCount,
        );

  /// Returns a shallow copy of this [Tag]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Tag copyWith({
    Object? id = _Undefined,
    Object? tags = _Undefined,
    String? name,
    Object? usageCount = _Undefined,
  }) {
    return Tag(
      id: id is int? ? id : this.id,
      tags: tags is List<_i2.ArtworkTags>?
          ? tags
          : this.tags?.map((e0) => e0.copyWith()).toList(),
      name: name ?? this.name,
      usageCount: usageCount is int? ? usageCount : this.usageCount,
    );
  }
}

class TagTable extends _i1.Table<int?> {
  TagTable({super.tableRelation}) : super(tableName: 'tag') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    usageCount = _i1.ColumnInt(
      'usageCount',
      this,
      hasDefault: true,
    );
  }

  _i2.ArtworkTagsTable? ___tags;

  _i1.ManyRelation<_i2.ArtworkTagsTable>? _tags;

  late final _i1.ColumnString name;

  late final _i1.ColumnInt usageCount;

  _i2.ArtworkTagsTable get __tags {
    if (___tags != null) return ___tags!;
    ___tags = _i1.createRelationTable(
      relationFieldName: '__tags',
      field: Tag.t.id,
      foreignField: _i2.ArtworkTags.t.tagId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ArtworkTagsTable(tableRelation: foreignTableRelation),
    );
    return ___tags!;
  }

  _i1.ManyRelation<_i2.ArtworkTagsTable> get tags {
    if (_tags != null) return _tags!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'tags',
      field: Tag.t.id,
      foreignField: _i2.ArtworkTags.t.tagId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ArtworkTagsTable(tableRelation: foreignTableRelation),
    );
    _tags = _i1.ManyRelation<_i2.ArtworkTagsTable>(
      tableWithRelations: relationTable,
      table: _i2.ArtworkTagsTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _tags!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        usageCount,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'tags') {
      return __tags;
    }
    return null;
  }
}

class TagInclude extends _i1.IncludeObject {
  TagInclude._({_i2.ArtworkTagsIncludeList? tags}) {
    _tags = tags;
  }

  _i2.ArtworkTagsIncludeList? _tags;

  @override
  Map<String, _i1.Include?> get includes => {'tags': _tags};

  @override
  _i1.Table<int?> get table => Tag.t;
}

class TagIncludeList extends _i1.IncludeList {
  TagIncludeList._({
    _i1.WhereExpressionBuilder<TagTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Tag.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Tag.t;
}

class TagRepository {
  const TagRepository._();

  final attach = const TagAttachRepository._();

  final attachRow = const TagAttachRowRepository._();

  /// Returns a list of [Tag]s matching the given query parameters.
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
  Future<List<Tag>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TagTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<TagTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TagTable>? orderByList,
    _i1.Transaction? transaction,
    TagInclude? include,
  }) async {
    return session.db.find<Tag>(
      where: where?.call(Tag.t),
      orderBy: orderBy?.call(Tag.t),
      orderByList: orderByList?.call(Tag.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Tag] matching the given query parameters.
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
  Future<Tag?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TagTable>? where,
    int? offset,
    _i1.OrderByBuilder<TagTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<TagTable>? orderByList,
    _i1.Transaction? transaction,
    TagInclude? include,
  }) async {
    return session.db.findFirstRow<Tag>(
      where: where?.call(Tag.t),
      orderBy: orderBy?.call(Tag.t),
      orderByList: orderByList?.call(Tag.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Tag] by its [id] or null if no such row exists.
  Future<Tag?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    TagInclude? include,
  }) async {
    return session.db.findById<Tag>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Tag]s in the list and returns the inserted rows.
  ///
  /// The returned [Tag]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Tag>> insert(
    _i1.Session session,
    List<Tag> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Tag>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Tag] and returns the inserted row.
  ///
  /// The returned [Tag] will have its `id` field set.
  Future<Tag> insertRow(
    _i1.Session session,
    Tag row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Tag>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Tag]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Tag>> update(
    _i1.Session session,
    List<Tag> rows, {
    _i1.ColumnSelections<TagTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Tag>(
      rows,
      columns: columns?.call(Tag.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Tag]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Tag> updateRow(
    _i1.Session session,
    Tag row, {
    _i1.ColumnSelections<TagTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Tag>(
      row,
      columns: columns?.call(Tag.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Tag]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Tag>> delete(
    _i1.Session session,
    List<Tag> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Tag>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Tag].
  Future<Tag> deleteRow(
    _i1.Session session,
    Tag row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Tag>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Tag>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<TagTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Tag>(
      where: where(Tag.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<TagTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Tag>(
      where: where?.call(Tag.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class TagAttachRepository {
  const TagAttachRepository._();

  /// Creates a relation between this [Tag] and the given [ArtworkTags]s
  /// by setting each [ArtworkTags]'s foreign key `tagId` to refer to this [Tag].
  Future<void> tags(
    _i1.Session session,
    Tag tag,
    List<_i2.ArtworkTags> artworkTags, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkTags.any((e) => e.id == null)) {
      throw ArgumentError.notNull('artworkTags.id');
    }
    if (tag.id == null) {
      throw ArgumentError.notNull('tag.id');
    }

    var $artworkTags =
        artworkTags.map((e) => e.copyWith(tagId: tag.id)).toList();
    await session.db.update<_i2.ArtworkTags>(
      $artworkTags,
      columns: [_i2.ArtworkTags.t.tagId],
      transaction: transaction,
    );
  }
}

class TagAttachRowRepository {
  const TagAttachRowRepository._();

  /// Creates a relation between this [Tag] and the given [ArtworkTags]
  /// by setting the [ArtworkTags]'s foreign key `tagId` to refer to this [Tag].
  Future<void> tags(
    _i1.Session session,
    Tag tag,
    _i2.ArtworkTags artworkTags, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkTags.id == null) {
      throw ArgumentError.notNull('artworkTags.id');
    }
    if (tag.id == null) {
      throw ArgumentError.notNull('tag.id');
    }

    var $artworkTags = artworkTags.copyWith(tagId: tag.id);
    await session.db.updateRow<_i2.ArtworkTags>(
      $artworkTags,
      columns: [_i2.ArtworkTags.t.tagId],
      transaction: transaction,
    );
  }
}
