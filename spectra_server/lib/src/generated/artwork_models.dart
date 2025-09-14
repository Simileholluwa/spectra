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
import 'model.dart' as _i3;

abstract class ArtworkModels
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  ArtworkModels._({
    this.id,
    required this.artworkId,
    this.artwork,
    required this.modelId,
    this.model,
  });

  factory ArtworkModels({
    int? id,
    required int artworkId,
    _i2.Artwork? artwork,
    required int modelId,
    _i3.Model? model,
  }) = _ArtworkModelsImpl;

  factory ArtworkModels.fromJson(Map<String, dynamic> jsonSerialization) {
    return ArtworkModels(
      id: jsonSerialization['id'] as int?,
      artworkId: jsonSerialization['artworkId'] as int,
      artwork: jsonSerialization['artwork'] == null
          ? null
          : _i2.Artwork.fromJson(
              (jsonSerialization['artwork'] as Map<String, dynamic>)),
      modelId: jsonSerialization['modelId'] as int,
      model: jsonSerialization['model'] == null
          ? null
          : _i3.Model.fromJson(
              (jsonSerialization['model'] as Map<String, dynamic>)),
    );
  }

  static final t = ArtworkModelsTable();

  static const db = ArtworkModelsRepository._();

  @override
  int? id;

  int artworkId;

  _i2.Artwork? artwork;

  int modelId;

  _i3.Model? model;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [ArtworkModels]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ArtworkModels copyWith({
    int? id,
    int? artworkId,
    _i2.Artwork? artwork,
    int? modelId,
    _i3.Model? model,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'artworkId': artworkId,
      if (artwork != null) 'artwork': artwork?.toJson(),
      'modelId': modelId,
      if (model != null) 'model': model?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'artworkId': artworkId,
      if (artwork != null) 'artwork': artwork?.toJsonForProtocol(),
      'modelId': modelId,
      if (model != null) 'model': model?.toJsonForProtocol(),
    };
  }

  static ArtworkModelsInclude include({
    _i2.ArtworkInclude? artwork,
    _i3.ModelInclude? model,
  }) {
    return ArtworkModelsInclude._(
      artwork: artwork,
      model: model,
    );
  }

  static ArtworkModelsIncludeList includeList({
    _i1.WhereExpressionBuilder<ArtworkModelsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArtworkModelsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkModelsTable>? orderByList,
    ArtworkModelsInclude? include,
  }) {
    return ArtworkModelsIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(ArtworkModels.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(ArtworkModels.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ArtworkModelsImpl extends ArtworkModels {
  _ArtworkModelsImpl({
    int? id,
    required int artworkId,
    _i2.Artwork? artwork,
    required int modelId,
    _i3.Model? model,
  }) : super._(
          id: id,
          artworkId: artworkId,
          artwork: artwork,
          modelId: modelId,
          model: model,
        );

  /// Returns a shallow copy of this [ArtworkModels]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ArtworkModels copyWith({
    Object? id = _Undefined,
    int? artworkId,
    Object? artwork = _Undefined,
    int? modelId,
    Object? model = _Undefined,
  }) {
    return ArtworkModels(
      id: id is int? ? id : this.id,
      artworkId: artworkId ?? this.artworkId,
      artwork: artwork is _i2.Artwork? ? artwork : this.artwork?.copyWith(),
      modelId: modelId ?? this.modelId,
      model: model is _i3.Model? ? model : this.model?.copyWith(),
    );
  }
}

class ArtworkModelsTable extends _i1.Table<int?> {
  ArtworkModelsTable({super.tableRelation})
      : super(tableName: 'artwork_models') {
    artworkId = _i1.ColumnInt(
      'artworkId',
      this,
    );
    modelId = _i1.ColumnInt(
      'modelId',
      this,
    );
  }

  late final _i1.ColumnInt artworkId;

  _i2.ArtworkTable? _artwork;

  late final _i1.ColumnInt modelId;

  _i3.ModelTable? _model;

  _i2.ArtworkTable get artwork {
    if (_artwork != null) return _artwork!;
    _artwork = _i1.createRelationTable(
      relationFieldName: 'artwork',
      field: ArtworkModels.t.artworkId,
      foreignField: _i2.Artwork.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.ArtworkTable(tableRelation: foreignTableRelation),
    );
    return _artwork!;
  }

  _i3.ModelTable get model {
    if (_model != null) return _model!;
    _model = _i1.createRelationTable(
      relationFieldName: 'model',
      field: ArtworkModels.t.modelId,
      foreignField: _i3.Model.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i3.ModelTable(tableRelation: foreignTableRelation),
    );
    return _model!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        artworkId,
        modelId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'artwork') {
      return artwork;
    }
    if (relationField == 'model') {
      return model;
    }
    return null;
  }
}

class ArtworkModelsInclude extends _i1.IncludeObject {
  ArtworkModelsInclude._({
    _i2.ArtworkInclude? artwork,
    _i3.ModelInclude? model,
  }) {
    _artwork = artwork;
    _model = model;
  }

  _i2.ArtworkInclude? _artwork;

  _i3.ModelInclude? _model;

  @override
  Map<String, _i1.Include?> get includes => {
        'artwork': _artwork,
        'model': _model,
      };

  @override
  _i1.Table<int?> get table => ArtworkModels.t;
}

class ArtworkModelsIncludeList extends _i1.IncludeList {
  ArtworkModelsIncludeList._({
    _i1.WhereExpressionBuilder<ArtworkModelsTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(ArtworkModels.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => ArtworkModels.t;
}

class ArtworkModelsRepository {
  const ArtworkModelsRepository._();

  final attachRow = const ArtworkModelsAttachRowRepository._();

  /// Returns a list of [ArtworkModels]s matching the given query parameters.
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
  Future<List<ArtworkModels>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkModelsTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArtworkModelsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkModelsTable>? orderByList,
    _i1.Transaction? transaction,
    ArtworkModelsInclude? include,
  }) async {
    return session.db.find<ArtworkModels>(
      where: where?.call(ArtworkModels.t),
      orderBy: orderBy?.call(ArtworkModels.t),
      orderByList: orderByList?.call(ArtworkModels.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [ArtworkModels] matching the given query parameters.
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
  Future<ArtworkModels?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkModelsTable>? where,
    int? offset,
    _i1.OrderByBuilder<ArtworkModelsTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkModelsTable>? orderByList,
    _i1.Transaction? transaction,
    ArtworkModelsInclude? include,
  }) async {
    return session.db.findFirstRow<ArtworkModels>(
      where: where?.call(ArtworkModels.t),
      orderBy: orderBy?.call(ArtworkModels.t),
      orderByList: orderByList?.call(ArtworkModels.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [ArtworkModels] by its [id] or null if no such row exists.
  Future<ArtworkModels?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ArtworkModelsInclude? include,
  }) async {
    return session.db.findById<ArtworkModels>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [ArtworkModels]s in the list and returns the inserted rows.
  ///
  /// The returned [ArtworkModels]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<ArtworkModels>> insert(
    _i1.Session session,
    List<ArtworkModels> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<ArtworkModels>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [ArtworkModels] and returns the inserted row.
  ///
  /// The returned [ArtworkModels] will have its `id` field set.
  Future<ArtworkModels> insertRow(
    _i1.Session session,
    ArtworkModels row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<ArtworkModels>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [ArtworkModels]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<ArtworkModels>> update(
    _i1.Session session,
    List<ArtworkModels> rows, {
    _i1.ColumnSelections<ArtworkModelsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<ArtworkModels>(
      rows,
      columns: columns?.call(ArtworkModels.t),
      transaction: transaction,
    );
  }

  /// Updates a single [ArtworkModels]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<ArtworkModels> updateRow(
    _i1.Session session,
    ArtworkModels row, {
    _i1.ColumnSelections<ArtworkModelsTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<ArtworkModels>(
      row,
      columns: columns?.call(ArtworkModels.t),
      transaction: transaction,
    );
  }

  /// Deletes all [ArtworkModels]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<ArtworkModels>> delete(
    _i1.Session session,
    List<ArtworkModels> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<ArtworkModels>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [ArtworkModels].
  Future<ArtworkModels> deleteRow(
    _i1.Session session,
    ArtworkModels row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<ArtworkModels>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<ArtworkModels>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ArtworkModelsTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<ArtworkModels>(
      where: where(ArtworkModels.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkModelsTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<ArtworkModels>(
      where: where?.call(ArtworkModels.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ArtworkModelsAttachRowRepository {
  const ArtworkModelsAttachRowRepository._();

  /// Creates a relation between the given [ArtworkModels] and [Artwork]
  /// by setting the [ArtworkModels]'s foreign key `artworkId` to refer to the [Artwork].
  Future<void> artwork(
    _i1.Session session,
    ArtworkModels artworkModels,
    _i2.Artwork artwork, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkModels.id == null) {
      throw ArgumentError.notNull('artworkModels.id');
    }
    if (artwork.id == null) {
      throw ArgumentError.notNull('artwork.id');
    }

    var $artworkModels = artworkModels.copyWith(artworkId: artwork.id);
    await session.db.updateRow<ArtworkModels>(
      $artworkModels,
      columns: [ArtworkModels.t.artworkId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [ArtworkModels] and [Model]
  /// by setting the [ArtworkModels]'s foreign key `modelId` to refer to the [Model].
  Future<void> model(
    _i1.Session session,
    ArtworkModels artworkModels,
    _i3.Model model, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkModels.id == null) {
      throw ArgumentError.notNull('artworkModels.id');
    }
    if (model.id == null) {
      throw ArgumentError.notNull('model.id');
    }

    var $artworkModels = artworkModels.copyWith(modelId: model.id);
    await session.db.updateRow<ArtworkModels>(
      $artworkModels,
      columns: [ArtworkModels.t.modelId],
      transaction: transaction,
    );
  }
}
