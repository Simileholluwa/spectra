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
import 'artwork_models.dart' as _i2;

abstract class Model implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Model._({
    this.id,
    this.models,
    required this.name,
    int? usageCount,
  }) : usageCount = usageCount ?? 1;

  factory Model({
    int? id,
    List<_i2.ArtworkModels>? models,
    required String name,
    int? usageCount,
  }) = _ModelImpl;

  factory Model.fromJson(Map<String, dynamic> jsonSerialization) {
    return Model(
      id: jsonSerialization['id'] as int?,
      models: (jsonSerialization['models'] as List?)
          ?.map((e) => _i2.ArtworkModels.fromJson((e as Map<String, dynamic>)))
          .toList(),
      name: jsonSerialization['name'] as String,
      usageCount: jsonSerialization['usageCount'] as int?,
    );
  }

  static final t = ModelTable();

  static const db = ModelRepository._();

  @override
  int? id;

  List<_i2.ArtworkModels>? models;

  String name;

  int? usageCount;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Model]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Model copyWith({
    int? id,
    List<_i2.ArtworkModels>? models,
    String? name,
    int? usageCount,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (models != null)
        'models': models?.toJson(valueToJson: (v) => v.toJson()),
      'name': name,
      if (usageCount != null) 'usageCount': usageCount,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      if (models != null)
        'models': models?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'name': name,
      if (usageCount != null) 'usageCount': usageCount,
    };
  }

  static ModelInclude include({_i2.ArtworkModelsIncludeList? models}) {
    return ModelInclude._(models: models);
  }

  static ModelIncludeList includeList({
    _i1.WhereExpressionBuilder<ModelTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ModelTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ModelTable>? orderByList,
    ModelInclude? include,
  }) {
    return ModelIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Model.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Model.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ModelImpl extends Model {
  _ModelImpl({
    int? id,
    List<_i2.ArtworkModels>? models,
    required String name,
    int? usageCount,
  }) : super._(
          id: id,
          models: models,
          name: name,
          usageCount: usageCount,
        );

  /// Returns a shallow copy of this [Model]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Model copyWith({
    Object? id = _Undefined,
    Object? models = _Undefined,
    String? name,
    Object? usageCount = _Undefined,
  }) {
    return Model(
      id: id is int? ? id : this.id,
      models: models is List<_i2.ArtworkModels>?
          ? models
          : this.models?.map((e0) => e0.copyWith()).toList(),
      name: name ?? this.name,
      usageCount: usageCount is int? ? usageCount : this.usageCount,
    );
  }
}

class ModelTable extends _i1.Table<int?> {
  ModelTable({super.tableRelation}) : super(tableName: 'model') {
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

  _i2.ArtworkModelsTable? ___models;

  _i1.ManyRelation<_i2.ArtworkModelsTable>? _models;

  late final _i1.ColumnString name;

  late final _i1.ColumnInt usageCount;

  _i2.ArtworkModelsTable get __models {
    if (___models != null) return ___models!;
    ___models = _i1.createRelationTable(
      relationFieldName: '__models',
      field: Model.t.id,
      foreignField: _i2.ArtworkModels.t.modelId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ArtworkModelsTable(tableRelation: foreignTableRelation),
    );
    return ___models!;
  }

  _i1.ManyRelation<_i2.ArtworkModelsTable> get models {
    if (_models != null) return _models!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'models',
      field: Model.t.id,
      foreignField: _i2.ArtworkModels.t.modelId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ArtworkModelsTable(tableRelation: foreignTableRelation),
    );
    _models = _i1.ManyRelation<_i2.ArtworkModelsTable>(
      tableWithRelations: relationTable,
      table: _i2.ArtworkModelsTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _models!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        usageCount,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'models') {
      return __models;
    }
    return null;
  }
}

class ModelInclude extends _i1.IncludeObject {
  ModelInclude._({_i2.ArtworkModelsIncludeList? models}) {
    _models = models;
  }

  _i2.ArtworkModelsIncludeList? _models;

  @override
  Map<String, _i1.Include?> get includes => {'models': _models};

  @override
  _i1.Table<int?> get table => Model.t;
}

class ModelIncludeList extends _i1.IncludeList {
  ModelIncludeList._({
    _i1.WhereExpressionBuilder<ModelTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Model.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Model.t;
}

class ModelRepository {
  const ModelRepository._();

  final attach = const ModelAttachRepository._();

  final attachRow = const ModelAttachRowRepository._();

  /// Returns a list of [Model]s matching the given query parameters.
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
  Future<List<Model>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ModelTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ModelTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ModelTable>? orderByList,
    _i1.Transaction? transaction,
    ModelInclude? include,
  }) async {
    return session.db.find<Model>(
      where: where?.call(Model.t),
      orderBy: orderBy?.call(Model.t),
      orderByList: orderByList?.call(Model.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Model] matching the given query parameters.
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
  Future<Model?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ModelTable>? where,
    int? offset,
    _i1.OrderByBuilder<ModelTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ModelTable>? orderByList,
    _i1.Transaction? transaction,
    ModelInclude? include,
  }) async {
    return session.db.findFirstRow<Model>(
      where: where?.call(Model.t),
      orderBy: orderBy?.call(Model.t),
      orderByList: orderByList?.call(Model.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Model] by its [id] or null if no such row exists.
  Future<Model?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ModelInclude? include,
  }) async {
    return session.db.findById<Model>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Model]s in the list and returns the inserted rows.
  ///
  /// The returned [Model]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Model>> insert(
    _i1.Session session,
    List<Model> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Model>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Model] and returns the inserted row.
  ///
  /// The returned [Model] will have its `id` field set.
  Future<Model> insertRow(
    _i1.Session session,
    Model row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Model>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Model]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Model>> update(
    _i1.Session session,
    List<Model> rows, {
    _i1.ColumnSelections<ModelTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Model>(
      rows,
      columns: columns?.call(Model.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Model]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Model> updateRow(
    _i1.Session session,
    Model row, {
    _i1.ColumnSelections<ModelTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Model>(
      row,
      columns: columns?.call(Model.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Model]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Model>> delete(
    _i1.Session session,
    List<Model> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Model>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Model].
  Future<Model> deleteRow(
    _i1.Session session,
    Model row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Model>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Model>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ModelTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Model>(
      where: where(Model.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ModelTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Model>(
      where: where?.call(Model.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ModelAttachRepository {
  const ModelAttachRepository._();

  /// Creates a relation between this [Model] and the given [ArtworkModels]s
  /// by setting each [ArtworkModels]'s foreign key `modelId` to refer to this [Model].
  Future<void> models(
    _i1.Session session,
    Model model,
    List<_i2.ArtworkModels> artworkModels, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkModels.any((e) => e.id == null)) {
      throw ArgumentError.notNull('artworkModels.id');
    }
    if (model.id == null) {
      throw ArgumentError.notNull('model.id');
    }

    var $artworkModels =
        artworkModels.map((e) => e.copyWith(modelId: model.id)).toList();
    await session.db.update<_i2.ArtworkModels>(
      $artworkModels,
      columns: [_i2.ArtworkModels.t.modelId],
      transaction: transaction,
    );
  }
}

class ModelAttachRowRepository {
  const ModelAttachRowRepository._();

  /// Creates a relation between this [Model] and the given [ArtworkModels]
  /// by setting the [ArtworkModels]'s foreign key `modelId` to refer to this [Model].
  Future<void> models(
    _i1.Session session,
    Model model,
    _i2.ArtworkModels artworkModels, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkModels.id == null) {
      throw ArgumentError.notNull('artworkModels.id');
    }
    if (model.id == null) {
      throw ArgumentError.notNull('model.id');
    }

    var $artworkModels = artworkModels.copyWith(modelId: model.id);
    await session.db.updateRow<_i2.ArtworkModels>(
      $artworkModels,
      columns: [_i2.ArtworkModels.t.modelId],
      transaction: transaction,
    );
  }
}
