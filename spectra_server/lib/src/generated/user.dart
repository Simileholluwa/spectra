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
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i2;

abstract class User implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  User._({
    this.id,
    required this.userId,
    this.user,
    this.email,
    this.username,
    String? bio,
    this.profileImageUrl,
    this.website,
    this.location,
    int? followersCount,
    int? followingCount,
    int? artworksCount,
    int? likesCount,
    this.interests,
    this.likedArtworks,
    DateTime? createdAt,
    this.updatedAt,
  })  : bio = bio ?? 'Hello there, welcome to my profile!',
        followersCount = followersCount ?? 0,
        followingCount = followingCount ?? 0,
        artworksCount = artworksCount ?? 0,
        likesCount = likesCount ?? 0,
        createdAt = createdAt ?? DateTime.now();

  factory User({
    int? id,
    required int userId,
    _i2.UserInfo? user,
    String? email,
    String? username,
    String? bio,
    String? profileImageUrl,
    String? website,
    String? location,
    int? followersCount,
    int? followingCount,
    int? artworksCount,
    int? likesCount,
    List<String>? interests,
    List<int>? likedArtworks,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _UserImpl;

  factory User.fromJson(Map<String, dynamic> jsonSerialization) {
    return User(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      user: jsonSerialization['user'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['user'] as Map<String, dynamic>)),
      email: jsonSerialization['email'] as String?,
      username: jsonSerialization['username'] as String?,
      bio: jsonSerialization['bio'] as String?,
      profileImageUrl: jsonSerialization['profileImageUrl'] as String?,
      website: jsonSerialization['website'] as String?,
      location: jsonSerialization['location'] as String?,
      followersCount: jsonSerialization['followersCount'] as int?,
      followingCount: jsonSerialization['followingCount'] as int?,
      artworksCount: jsonSerialization['artworksCount'] as int?,
      likesCount: jsonSerialization['likesCount'] as int?,
      interests: (jsonSerialization['interests'] as List?)
          ?.map((e) => e as String)
          .toList(),
      likedArtworks: (jsonSerialization['likedArtworks'] as List?)
          ?.map((e) => e as int)
          .toList(),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = UserTable();

  static const db = UserRepository._();

  @override
  int? id;

  int userId;

  _i2.UserInfo? user;

  String? email;

  String? username;

  String? bio;

  String? profileImageUrl;

  String? website;

  String? location;

  int? followersCount;

  int? followingCount;

  int? artworksCount;

  int? likesCount;

  List<String>? interests;

  List<int>? likedArtworks;

  DateTime? createdAt;

  DateTime? updatedAt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [User]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  User copyWith({
    int? id,
    int? userId,
    _i2.UserInfo? user,
    String? email,
    String? username,
    String? bio,
    String? profileImageUrl,
    String? website,
    String? location,
    int? followersCount,
    int? followingCount,
    int? artworksCount,
    int? likesCount,
    List<String>? interests,
    List<int>? likedArtworks,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJson(),
      if (email != null) 'email': email,
      if (username != null) 'username': username,
      if (bio != null) 'bio': bio,
      if (profileImageUrl != null) 'profileImageUrl': profileImageUrl,
      if (website != null) 'website': website,
      if (location != null) 'location': location,
      if (followersCount != null) 'followersCount': followersCount,
      if (followingCount != null) 'followingCount': followingCount,
      if (artworksCount != null) 'artworksCount': artworksCount,
      if (likesCount != null) 'likesCount': likesCount,
      if (interests != null) 'interests': interests?.toJson(),
      if (likedArtworks != null) 'likedArtworks': likedArtworks?.toJson(),
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJsonForProtocol(),
      if (email != null) 'email': email,
      if (username != null) 'username': username,
      if (bio != null) 'bio': bio,
      if (profileImageUrl != null) 'profileImageUrl': profileImageUrl,
      if (website != null) 'website': website,
      if (location != null) 'location': location,
      if (followersCount != null) 'followersCount': followersCount,
      if (followingCount != null) 'followingCount': followingCount,
      if (artworksCount != null) 'artworksCount': artworksCount,
      if (likesCount != null) 'likesCount': likesCount,
      if (interests != null) 'interests': interests?.toJson(),
      if (likedArtworks != null) 'likedArtworks': likedArtworks?.toJson(),
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
    };
  }

  static UserInclude include({_i2.UserInfoInclude? user}) {
    return UserInclude._(user: user);
  }

  static UserIncludeList includeList({
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    UserInclude? include,
  }) {
    return UserIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(User.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(User.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserImpl extends User {
  _UserImpl({
    int? id,
    required int userId,
    _i2.UserInfo? user,
    String? email,
    String? username,
    String? bio,
    String? profileImageUrl,
    String? website,
    String? location,
    int? followersCount,
    int? followingCount,
    int? artworksCount,
    int? likesCount,
    List<String>? interests,
    List<int>? likedArtworks,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
          id: id,
          userId: userId,
          user: user,
          email: email,
          username: username,
          bio: bio,
          profileImageUrl: profileImageUrl,
          website: website,
          location: location,
          followersCount: followersCount,
          followingCount: followingCount,
          artworksCount: artworksCount,
          likesCount: likesCount,
          interests: interests,
          likedArtworks: likedArtworks,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [User]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  User copyWith({
    Object? id = _Undefined,
    int? userId,
    Object? user = _Undefined,
    Object? email = _Undefined,
    Object? username = _Undefined,
    Object? bio = _Undefined,
    Object? profileImageUrl = _Undefined,
    Object? website = _Undefined,
    Object? location = _Undefined,
    Object? followersCount = _Undefined,
    Object? followingCount = _Undefined,
    Object? artworksCount = _Undefined,
    Object? likesCount = _Undefined,
    Object? interests = _Undefined,
    Object? likedArtworks = _Undefined,
    Object? createdAt = _Undefined,
    Object? updatedAt = _Undefined,
  }) {
    return User(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2.UserInfo? ? user : this.user?.copyWith(),
      email: email is String? ? email : this.email,
      username: username is String? ? username : this.username,
      bio: bio is String? ? bio : this.bio,
      profileImageUrl:
          profileImageUrl is String? ? profileImageUrl : this.profileImageUrl,
      website: website is String? ? website : this.website,
      location: location is String? ? location : this.location,
      followersCount:
          followersCount is int? ? followersCount : this.followersCount,
      followingCount:
          followingCount is int? ? followingCount : this.followingCount,
      artworksCount: artworksCount is int? ? artworksCount : this.artworksCount,
      likesCount: likesCount is int? ? likesCount : this.likesCount,
      interests: interests is List<String>?
          ? interests
          : this.interests?.map((e0) => e0).toList(),
      likedArtworks: likedArtworks is List<int>?
          ? likedArtworks
          : this.likedArtworks?.map((e0) => e0).toList(),
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
    );
  }
}

class UserTable extends _i1.Table<int?> {
  UserTable({super.tableRelation}) : super(tableName: 'user') {
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    email = _i1.ColumnString(
      'email',
      this,
    );
    username = _i1.ColumnString(
      'username',
      this,
    );
    bio = _i1.ColumnString(
      'bio',
      this,
      hasDefault: true,
    );
    profileImageUrl = _i1.ColumnString(
      'profileImageUrl',
      this,
    );
    website = _i1.ColumnString(
      'website',
      this,
    );
    location = _i1.ColumnString(
      'location',
      this,
    );
    followersCount = _i1.ColumnInt(
      'followersCount',
      this,
      hasDefault: true,
    );
    followingCount = _i1.ColumnInt(
      'followingCount',
      this,
      hasDefault: true,
    );
    artworksCount = _i1.ColumnInt(
      'artworksCount',
      this,
      hasDefault: true,
    );
    likesCount = _i1.ColumnInt(
      'likesCount',
      this,
      hasDefault: true,
    );
    interests = _i1.ColumnSerializable(
      'interests',
      this,
    );
    likedArtworks = _i1.ColumnSerializable(
      'likedArtworks',
      this,
    );
    createdAt = _i1.ColumnDateTime(
      'createdAt',
      this,
      hasDefault: true,
    );
    updatedAt = _i1.ColumnDateTime(
      'updatedAt',
      this,
    );
  }

  late final _i1.ColumnInt userId;

  _i2.UserInfoTable? _user;

  late final _i1.ColumnString email;

  late final _i1.ColumnString username;

  late final _i1.ColumnString bio;

  late final _i1.ColumnString profileImageUrl;

  late final _i1.ColumnString website;

  late final _i1.ColumnString location;

  late final _i1.ColumnInt followersCount;

  late final _i1.ColumnInt followingCount;

  late final _i1.ColumnInt artworksCount;

  late final _i1.ColumnInt likesCount;

  late final _i1.ColumnSerializable interests;

  late final _i1.ColumnSerializable likedArtworks;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  _i2.UserInfoTable get user {
    if (_user != null) return _user!;
    _user = _i1.createRelationTable(
      relationFieldName: 'user',
      field: User.t.userId,
      foreignField: _i2.UserInfo.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserInfoTable(tableRelation: foreignTableRelation),
    );
    return _user!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        email,
        username,
        bio,
        profileImageUrl,
        website,
        location,
        followersCount,
        followingCount,
        artworksCount,
        likesCount,
        interests,
        likedArtworks,
        createdAt,
        updatedAt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    return null;
  }
}

class UserInclude extends _i1.IncludeObject {
  UserInclude._({_i2.UserInfoInclude? user}) {
    _user = user;
  }

  _i2.UserInfoInclude? _user;

  @override
  Map<String, _i1.Include?> get includes => {'user': _user};

  @override
  _i1.Table<int?> get table => User.t;
}

class UserIncludeList extends _i1.IncludeList {
  UserIncludeList._({
    _i1.WhereExpressionBuilder<UserTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(User.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => User.t;
}

class UserRepository {
  const UserRepository._();

  final attachRow = const UserAttachRowRepository._();

  /// Returns a list of [User]s matching the given query parameters.
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
  Future<List<User>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    _i1.Transaction? transaction,
    UserInclude? include,
  }) async {
    return session.db.find<User>(
      where: where?.call(User.t),
      orderBy: orderBy?.call(User.t),
      orderByList: orderByList?.call(User.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [User] matching the given query parameters.
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
  Future<User?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? offset,
    _i1.OrderByBuilder<UserTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<UserTable>? orderByList,
    _i1.Transaction? transaction,
    UserInclude? include,
  }) async {
    return session.db.findFirstRow<User>(
      where: where?.call(User.t),
      orderBy: orderBy?.call(User.t),
      orderByList: orderByList?.call(User.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [User] by its [id] or null if no such row exists.
  Future<User?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    UserInclude? include,
  }) async {
    return session.db.findById<User>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [User]s in the list and returns the inserted rows.
  ///
  /// The returned [User]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<User>> insert(
    _i1.Session session,
    List<User> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<User>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [User] and returns the inserted row.
  ///
  /// The returned [User] will have its `id` field set.
  Future<User> insertRow(
    _i1.Session session,
    User row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<User>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [User]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<User>> update(
    _i1.Session session,
    List<User> rows, {
    _i1.ColumnSelections<UserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<User>(
      rows,
      columns: columns?.call(User.t),
      transaction: transaction,
    );
  }

  /// Updates a single [User]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<User> updateRow(
    _i1.Session session,
    User row, {
    _i1.ColumnSelections<UserTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<User>(
      row,
      columns: columns?.call(User.t),
      transaction: transaction,
    );
  }

  /// Deletes all [User]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<User>> delete(
    _i1.Session session,
    List<User> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<User>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [User].
  Future<User> deleteRow(
    _i1.Session session,
    User row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<User>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<User>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<UserTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<User>(
      where: where(User.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<UserTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<User>(
      where: where?.call(User.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class UserAttachRowRepository {
  const UserAttachRowRepository._();

  /// Creates a relation between the given [User] and [UserInfo]
  /// by setting the [User]'s foreign key `userId` to refer to the [UserInfo].
  Future<void> user(
    _i1.Session session,
    User user,
    _i2.UserInfo nestedUser, {
    _i1.Transaction? transaction,
  }) async {
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }
    if (nestedUser.id == null) {
      throw ArgumentError.notNull('nestedUser.id');
    }

    var $user = user.copyWith(userId: nestedUser.id);
    await session.db.updateRow<User>(
      $user,
      columns: [User.t.userId],
      transaction: transaction,
    );
  }
}
