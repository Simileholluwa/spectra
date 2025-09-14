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
import 'user.dart' as _i2;

abstract class Follower
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Follower._({
    this.id,
    required this.followerId,
    this.follower,
    required this.followingId,
    this.following,
    DateTime? followedAt,
  }) : followedAt = followedAt ?? DateTime.now();

  factory Follower({
    int? id,
    required int followerId,
    _i2.User? follower,
    required int followingId,
    _i2.User? following,
    DateTime? followedAt,
  }) = _FollowerImpl;

  factory Follower.fromJson(Map<String, dynamic> jsonSerialization) {
    return Follower(
      id: jsonSerialization['id'] as int?,
      followerId: jsonSerialization['followerId'] as int,
      follower: jsonSerialization['follower'] == null
          ? null
          : _i2.User.fromJson(
              (jsonSerialization['follower'] as Map<String, dynamic>)),
      followingId: jsonSerialization['followingId'] as int,
      following: jsonSerialization['following'] == null
          ? null
          : _i2.User.fromJson(
              (jsonSerialization['following'] as Map<String, dynamic>)),
      followedAt: jsonSerialization['followedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['followedAt']),
    );
  }

  static final t = FollowerTable();

  static const db = FollowerRepository._();

  @override
  int? id;

  int followerId;

  _i2.User? follower;

  int followingId;

  _i2.User? following;

  DateTime? followedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Follower]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Follower copyWith({
    int? id,
    int? followerId,
    _i2.User? follower,
    int? followingId,
    _i2.User? following,
    DateTime? followedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'followerId': followerId,
      if (follower != null) 'follower': follower?.toJson(),
      'followingId': followingId,
      if (following != null) 'following': following?.toJson(),
      if (followedAt != null) 'followedAt': followedAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'followerId': followerId,
      if (follower != null) 'follower': follower?.toJsonForProtocol(),
      'followingId': followingId,
      if (following != null) 'following': following?.toJsonForProtocol(),
      if (followedAt != null) 'followedAt': followedAt?.toJson(),
    };
  }

  static FollowerInclude include({
    _i2.UserInclude? follower,
    _i2.UserInclude? following,
  }) {
    return FollowerInclude._(
      follower: follower,
      following: following,
    );
  }

  static FollowerIncludeList includeList({
    _i1.WhereExpressionBuilder<FollowerTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FollowerTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FollowerTable>? orderByList,
    FollowerInclude? include,
  }) {
    return FollowerIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Follower.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Follower.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _FollowerImpl extends Follower {
  _FollowerImpl({
    int? id,
    required int followerId,
    _i2.User? follower,
    required int followingId,
    _i2.User? following,
    DateTime? followedAt,
  }) : super._(
          id: id,
          followerId: followerId,
          follower: follower,
          followingId: followingId,
          following: following,
          followedAt: followedAt,
        );

  /// Returns a shallow copy of this [Follower]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Follower copyWith({
    Object? id = _Undefined,
    int? followerId,
    Object? follower = _Undefined,
    int? followingId,
    Object? following = _Undefined,
    Object? followedAt = _Undefined,
  }) {
    return Follower(
      id: id is int? ? id : this.id,
      followerId: followerId ?? this.followerId,
      follower: follower is _i2.User? ? follower : this.follower?.copyWith(),
      followingId: followingId ?? this.followingId,
      following:
          following is _i2.User? ? following : this.following?.copyWith(),
      followedAt: followedAt is DateTime? ? followedAt : this.followedAt,
    );
  }
}

class FollowerTable extends _i1.Table<int?> {
  FollowerTable({super.tableRelation}) : super(tableName: 'follower') {
    followerId = _i1.ColumnInt(
      'followerId',
      this,
    );
    followingId = _i1.ColumnInt(
      'followingId',
      this,
    );
    followedAt = _i1.ColumnDateTime(
      'followedAt',
      this,
      hasDefault: true,
    );
  }

  late final _i1.ColumnInt followerId;

  _i2.UserTable? _follower;

  late final _i1.ColumnInt followingId;

  _i2.UserTable? _following;

  late final _i1.ColumnDateTime followedAt;

  _i2.UserTable get follower {
    if (_follower != null) return _follower!;
    _follower = _i1.createRelationTable(
      relationFieldName: 'follower',
      field: Follower.t.followerId,
      foreignField: _i2.User.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserTable(tableRelation: foreignTableRelation),
    );
    return _follower!;
  }

  _i2.UserTable get following {
    if (_following != null) return _following!;
    _following = _i1.createRelationTable(
      relationFieldName: 'following',
      field: Follower.t.followingId,
      foreignField: _i2.User.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserTable(tableRelation: foreignTableRelation),
    );
    return _following!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        followerId,
        followingId,
        followedAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'follower') {
      return follower;
    }
    if (relationField == 'following') {
      return following;
    }
    return null;
  }
}

class FollowerInclude extends _i1.IncludeObject {
  FollowerInclude._({
    _i2.UserInclude? follower,
    _i2.UserInclude? following,
  }) {
    _follower = follower;
    _following = following;
  }

  _i2.UserInclude? _follower;

  _i2.UserInclude? _following;

  @override
  Map<String, _i1.Include?> get includes => {
        'follower': _follower,
        'following': _following,
      };

  @override
  _i1.Table<int?> get table => Follower.t;
}

class FollowerIncludeList extends _i1.IncludeList {
  FollowerIncludeList._({
    _i1.WhereExpressionBuilder<FollowerTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Follower.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Follower.t;
}

class FollowerRepository {
  const FollowerRepository._();

  final attachRow = const FollowerAttachRowRepository._();

  /// Returns a list of [Follower]s matching the given query parameters.
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
  Future<List<Follower>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FollowerTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<FollowerTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FollowerTable>? orderByList,
    _i1.Transaction? transaction,
    FollowerInclude? include,
  }) async {
    return session.db.find<Follower>(
      where: where?.call(Follower.t),
      orderBy: orderBy?.call(Follower.t),
      orderByList: orderByList?.call(Follower.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Follower] matching the given query parameters.
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
  Future<Follower?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FollowerTable>? where,
    int? offset,
    _i1.OrderByBuilder<FollowerTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<FollowerTable>? orderByList,
    _i1.Transaction? transaction,
    FollowerInclude? include,
  }) async {
    return session.db.findFirstRow<Follower>(
      where: where?.call(Follower.t),
      orderBy: orderBy?.call(Follower.t),
      orderByList: orderByList?.call(Follower.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Follower] by its [id] or null if no such row exists.
  Future<Follower?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    FollowerInclude? include,
  }) async {
    return session.db.findById<Follower>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Follower]s in the list and returns the inserted rows.
  ///
  /// The returned [Follower]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Follower>> insert(
    _i1.Session session,
    List<Follower> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Follower>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Follower] and returns the inserted row.
  ///
  /// The returned [Follower] will have its `id` field set.
  Future<Follower> insertRow(
    _i1.Session session,
    Follower row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Follower>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Follower]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Follower>> update(
    _i1.Session session,
    List<Follower> rows, {
    _i1.ColumnSelections<FollowerTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Follower>(
      rows,
      columns: columns?.call(Follower.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Follower]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Follower> updateRow(
    _i1.Session session,
    Follower row, {
    _i1.ColumnSelections<FollowerTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Follower>(
      row,
      columns: columns?.call(Follower.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Follower]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Follower>> delete(
    _i1.Session session,
    List<Follower> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Follower>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Follower].
  Future<Follower> deleteRow(
    _i1.Session session,
    Follower row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Follower>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Follower>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<FollowerTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Follower>(
      where: where(Follower.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<FollowerTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Follower>(
      where: where?.call(Follower.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class FollowerAttachRowRepository {
  const FollowerAttachRowRepository._();

  /// Creates a relation between the given [Follower] and [User]
  /// by setting the [Follower]'s foreign key `followerId` to refer to the [User].
  Future<void> follower(
    _i1.Session session,
    Follower follower,
    _i2.User nestedFollower, {
    _i1.Transaction? transaction,
  }) async {
    if (follower.id == null) {
      throw ArgumentError.notNull('follower.id');
    }
    if (nestedFollower.id == null) {
      throw ArgumentError.notNull('nestedFollower.id');
    }

    var $follower = follower.copyWith(followerId: nestedFollower.id);
    await session.db.updateRow<Follower>(
      $follower,
      columns: [Follower.t.followerId],
      transaction: transaction,
    );
  }

  /// Creates a relation between the given [Follower] and [User]
  /// by setting the [Follower]'s foreign key `followingId` to refer to the [User].
  Future<void> following(
    _i1.Session session,
    Follower follower,
    _i2.User following, {
    _i1.Transaction? transaction,
  }) async {
    if (follower.id == null) {
      throw ArgumentError.notNull('follower.id');
    }
    if (following.id == null) {
      throw ArgumentError.notNull('following.id');
    }

    var $follower = follower.copyWith(followingId: following.id);
    await session.db.updateRow<Follower>(
      $follower,
      columns: [Follower.t.followingId],
      transaction: transaction,
    );
  }
}
