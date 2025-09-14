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
import 'media_type.dart' as _i3;
import 'artwork_tags.dart' as _i4;
import 'artwork_models.dart' as _i5;

abstract class Artwork
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
  Artwork._({
    this.id,
    required this.userId,
    this.user,
    this.mediaUrl,
    this.thumbnailUrl,
    this.mediaType,
    this.tags,
    this.tagNames,
    this.prompt,
    this.models,
    this.modelNames,
    this.resolution,
    bool? allowDownload,
    int? views,
    int? likes,
    int? downloads,
    this.taggedUsers,
    int? commentsCount,
    DateTime? createdAt,
    this.updatedAt,
    this.videoDuration,
    bool? showPrompt,
  })  : allowDownload = allowDownload ?? true,
        views = views ?? 0,
        likes = likes ?? 0,
        downloads = downloads ?? 0,
        commentsCount = commentsCount ?? 0,
        createdAt = createdAt ?? DateTime.now(),
        showPrompt = showPrompt ?? true;

  factory Artwork({
    int? id,
    required int userId,
    _i2.User? user,
    List<String>? mediaUrl,
    List<String>? thumbnailUrl,
    _i3.MediaType? mediaType,
    List<_i4.ArtworkTags>? tags,
    List<String>? tagNames,
    String? prompt,
    List<_i5.ArtworkModels>? models,
    List<String>? modelNames,
    List<String>? resolution,
    bool? allowDownload,
    int? views,
    int? likes,
    int? downloads,
    List<_i2.User>? taggedUsers,
    int? commentsCount,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? videoDuration,
    bool? showPrompt,
  }) = _ArtworkImpl;

  factory Artwork.fromJson(Map<String, dynamic> jsonSerialization) {
    return Artwork(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      user: jsonSerialization['user'] == null
          ? null
          : _i2.User.fromJson(
              (jsonSerialization['user'] as Map<String, dynamic>)),
      mediaUrl: (jsonSerialization['mediaUrl'] as List?)
          ?.map((e) => e as String)
          .toList(),
      thumbnailUrl: (jsonSerialization['thumbnailUrl'] as List?)
          ?.map((e) => e as String)
          .toList(),
      mediaType: jsonSerialization['mediaType'] == null
          ? null
          : _i3.MediaType.fromJson((jsonSerialization['mediaType'] as int)),
      tags: (jsonSerialization['tags'] as List?)
          ?.map((e) => _i4.ArtworkTags.fromJson((e as Map<String, dynamic>)))
          .toList(),
      tagNames: (jsonSerialization['tagNames'] as List?)
          ?.map((e) => e as String)
          .toList(),
      prompt: jsonSerialization['prompt'] as String?,
      models: (jsonSerialization['models'] as List?)
          ?.map((e) => _i5.ArtworkModels.fromJson((e as Map<String, dynamic>)))
          .toList(),
      modelNames: (jsonSerialization['modelNames'] as List?)
          ?.map((e) => e as String)
          .toList(),
      resolution: (jsonSerialization['resolution'] as List?)
          ?.map((e) => e as String)
          .toList(),
      allowDownload: jsonSerialization['allowDownload'] as bool?,
      views: jsonSerialization['views'] as int?,
      likes: jsonSerialization['likes'] as int?,
      downloads: jsonSerialization['downloads'] as int?,
      taggedUsers: (jsonSerialization['taggedUsers'] as List?)
          ?.map((e) => _i2.User.fromJson((e as Map<String, dynamic>)))
          .toList(),
      commentsCount: jsonSerialization['commentsCount'] as int?,
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
      videoDuration: jsonSerialization['videoDuration'] as String?,
      showPrompt: jsonSerialization['showPrompt'] as bool?,
    );
  }

  static final t = ArtworkTable();

  static const db = ArtworkRepository._();

  @override
  int? id;

  int userId;

  _i2.User? user;

  List<String>? mediaUrl;

  List<String>? thumbnailUrl;

  _i3.MediaType? mediaType;

  List<_i4.ArtworkTags>? tags;

  List<String>? tagNames;

  String? prompt;

  List<_i5.ArtworkModels>? models;

  List<String>? modelNames;

  List<String>? resolution;

  bool? allowDownload;

  int? views;

  int? likes;

  int? downloads;

  List<_i2.User>? taggedUsers;

  int? commentsCount;

  DateTime? createdAt;

  DateTime? updatedAt;

  String? videoDuration;

  bool? showPrompt;

  @override
  _i1.Table<int?> get table => t;

  /// Returns a shallow copy of this [Artwork]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Artwork copyWith({
    int? id,
    int? userId,
    _i2.User? user,
    List<String>? mediaUrl,
    List<String>? thumbnailUrl,
    _i3.MediaType? mediaType,
    List<_i4.ArtworkTags>? tags,
    List<String>? tagNames,
    String? prompt,
    List<_i5.ArtworkModels>? models,
    List<String>? modelNames,
    List<String>? resolution,
    bool? allowDownload,
    int? views,
    int? likes,
    int? downloads,
    List<_i2.User>? taggedUsers,
    int? commentsCount,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? videoDuration,
    bool? showPrompt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJson(),
      if (mediaUrl != null) 'mediaUrl': mediaUrl?.toJson(),
      if (thumbnailUrl != null) 'thumbnailUrl': thumbnailUrl?.toJson(),
      if (mediaType != null) 'mediaType': mediaType?.toJson(),
      if (tags != null) 'tags': tags?.toJson(valueToJson: (v) => v.toJson()),
      if (tagNames != null) 'tagNames': tagNames?.toJson(),
      if (prompt != null) 'prompt': prompt,
      if (models != null)
        'models': models?.toJson(valueToJson: (v) => v.toJson()),
      if (modelNames != null) 'modelNames': modelNames?.toJson(),
      if (resolution != null) 'resolution': resolution?.toJson(),
      if (allowDownload != null) 'allowDownload': allowDownload,
      if (views != null) 'views': views,
      if (likes != null) 'likes': likes,
      if (downloads != null) 'downloads': downloads,
      if (taggedUsers != null)
        'taggedUsers': taggedUsers?.toJson(valueToJson: (v) => v.toJson()),
      if (commentsCount != null) 'commentsCount': commentsCount,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (videoDuration != null) 'videoDuration': videoDuration,
      if (showPrompt != null) 'showPrompt': showPrompt,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJsonForProtocol(),
      if (mediaUrl != null) 'mediaUrl': mediaUrl?.toJson(),
      if (thumbnailUrl != null) 'thumbnailUrl': thumbnailUrl?.toJson(),
      if (mediaType != null) 'mediaType': mediaType?.toJson(),
      if (tags != null)
        'tags': tags?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (tagNames != null) 'tagNames': tagNames?.toJson(),
      if (prompt != null) 'prompt': prompt,
      if (models != null)
        'models': models?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (modelNames != null) 'modelNames': modelNames?.toJson(),
      if (resolution != null) 'resolution': resolution?.toJson(),
      if (allowDownload != null) 'allowDownload': allowDownload,
      if (views != null) 'views': views,
      if (likes != null) 'likes': likes,
      if (downloads != null) 'downloads': downloads,
      if (taggedUsers != null)
        'taggedUsers':
            taggedUsers?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (commentsCount != null) 'commentsCount': commentsCount,
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
      if (videoDuration != null) 'videoDuration': videoDuration,
      if (showPrompt != null) 'showPrompt': showPrompt,
    };
  }

  static ArtworkInclude include({
    _i2.UserInclude? user,
    _i4.ArtworkTagsIncludeList? tags,
    _i5.ArtworkModelsIncludeList? models,
  }) {
    return ArtworkInclude._(
      user: user,
      tags: tags,
      models: models,
    );
  }

  static ArtworkIncludeList includeList({
    _i1.WhereExpressionBuilder<ArtworkTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArtworkTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkTable>? orderByList,
    ArtworkInclude? include,
  }) {
    return ArtworkIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Artwork.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Artwork.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ArtworkImpl extends Artwork {
  _ArtworkImpl({
    int? id,
    required int userId,
    _i2.User? user,
    List<String>? mediaUrl,
    List<String>? thumbnailUrl,
    _i3.MediaType? mediaType,
    List<_i4.ArtworkTags>? tags,
    List<String>? tagNames,
    String? prompt,
    List<_i5.ArtworkModels>? models,
    List<String>? modelNames,
    List<String>? resolution,
    bool? allowDownload,
    int? views,
    int? likes,
    int? downloads,
    List<_i2.User>? taggedUsers,
    int? commentsCount,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? videoDuration,
    bool? showPrompt,
  }) : super._(
          id: id,
          userId: userId,
          user: user,
          mediaUrl: mediaUrl,
          thumbnailUrl: thumbnailUrl,
          mediaType: mediaType,
          tags: tags,
          tagNames: tagNames,
          prompt: prompt,
          models: models,
          modelNames: modelNames,
          resolution: resolution,
          allowDownload: allowDownload,
          views: views,
          likes: likes,
          downloads: downloads,
          taggedUsers: taggedUsers,
          commentsCount: commentsCount,
          createdAt: createdAt,
          updatedAt: updatedAt,
          videoDuration: videoDuration,
          showPrompt: showPrompt,
        );

  /// Returns a shallow copy of this [Artwork]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Artwork copyWith({
    Object? id = _Undefined,
    int? userId,
    Object? user = _Undefined,
    Object? mediaUrl = _Undefined,
    Object? thumbnailUrl = _Undefined,
    Object? mediaType = _Undefined,
    Object? tags = _Undefined,
    Object? tagNames = _Undefined,
    Object? prompt = _Undefined,
    Object? models = _Undefined,
    Object? modelNames = _Undefined,
    Object? resolution = _Undefined,
    Object? allowDownload = _Undefined,
    Object? views = _Undefined,
    Object? likes = _Undefined,
    Object? downloads = _Undefined,
    Object? taggedUsers = _Undefined,
    Object? commentsCount = _Undefined,
    Object? createdAt = _Undefined,
    Object? updatedAt = _Undefined,
    Object? videoDuration = _Undefined,
    Object? showPrompt = _Undefined,
  }) {
    return Artwork(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2.User? ? user : this.user?.copyWith(),
      mediaUrl: mediaUrl is List<String>?
          ? mediaUrl
          : this.mediaUrl?.map((e0) => e0).toList(),
      thumbnailUrl: thumbnailUrl is List<String>?
          ? thumbnailUrl
          : this.thumbnailUrl?.map((e0) => e0).toList(),
      mediaType: mediaType is _i3.MediaType? ? mediaType : this.mediaType,
      tags: tags is List<_i4.ArtworkTags>?
          ? tags
          : this.tags?.map((e0) => e0.copyWith()).toList(),
      tagNames: tagNames is List<String>?
          ? tagNames
          : this.tagNames?.map((e0) => e0).toList(),
      prompt: prompt is String? ? prompt : this.prompt,
      models: models is List<_i5.ArtworkModels>?
          ? models
          : this.models?.map((e0) => e0.copyWith()).toList(),
      modelNames: modelNames is List<String>?
          ? modelNames
          : this.modelNames?.map((e0) => e0).toList(),
      resolution: resolution is List<String>?
          ? resolution
          : this.resolution?.map((e0) => e0).toList(),
      allowDownload:
          allowDownload is bool? ? allowDownload : this.allowDownload,
      views: views is int? ? views : this.views,
      likes: likes is int? ? likes : this.likes,
      downloads: downloads is int? ? downloads : this.downloads,
      taggedUsers: taggedUsers is List<_i2.User>?
          ? taggedUsers
          : this.taggedUsers?.map((e0) => e0.copyWith()).toList(),
      commentsCount: commentsCount is int? ? commentsCount : this.commentsCount,
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
      videoDuration:
          videoDuration is String? ? videoDuration : this.videoDuration,
      showPrompt: showPrompt is bool? ? showPrompt : this.showPrompt,
    );
  }
}

class ArtworkTable extends _i1.Table<int?> {
  ArtworkTable({super.tableRelation}) : super(tableName: 'artwork') {
    userId = _i1.ColumnInt(
      'userId',
      this,
    );
    mediaUrl = _i1.ColumnSerializable(
      'mediaUrl',
      this,
    );
    thumbnailUrl = _i1.ColumnSerializable(
      'thumbnailUrl',
      this,
    );
    mediaType = _i1.ColumnEnum(
      'mediaType',
      this,
      _i1.EnumSerialization.byIndex,
    );
    tagNames = _i1.ColumnSerializable(
      'tagNames',
      this,
    );
    prompt = _i1.ColumnString(
      'prompt',
      this,
    );
    modelNames = _i1.ColumnSerializable(
      'modelNames',
      this,
    );
    resolution = _i1.ColumnSerializable(
      'resolution',
      this,
    );
    allowDownload = _i1.ColumnBool(
      'allowDownload',
      this,
      hasDefault: true,
    );
    views = _i1.ColumnInt(
      'views',
      this,
      hasDefault: true,
    );
    likes = _i1.ColumnInt(
      'likes',
      this,
      hasDefault: true,
    );
    downloads = _i1.ColumnInt(
      'downloads',
      this,
      hasDefault: true,
    );
    taggedUsers = _i1.ColumnSerializable(
      'taggedUsers',
      this,
    );
    commentsCount = _i1.ColumnInt(
      'commentsCount',
      this,
      hasDefault: true,
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
    videoDuration = _i1.ColumnString(
      'videoDuration',
      this,
    );
    showPrompt = _i1.ColumnBool(
      'showPrompt',
      this,
      hasDefault: true,
    );
  }

  late final _i1.ColumnInt userId;

  _i2.UserTable? _user;

  late final _i1.ColumnSerializable mediaUrl;

  late final _i1.ColumnSerializable thumbnailUrl;

  late final _i1.ColumnEnum<_i3.MediaType> mediaType;

  _i4.ArtworkTagsTable? ___tags;

  _i1.ManyRelation<_i4.ArtworkTagsTable>? _tags;

  late final _i1.ColumnSerializable tagNames;

  late final _i1.ColumnString prompt;

  _i5.ArtworkModelsTable? ___models;

  _i1.ManyRelation<_i5.ArtworkModelsTable>? _models;

  late final _i1.ColumnSerializable modelNames;

  late final _i1.ColumnSerializable resolution;

  late final _i1.ColumnBool allowDownload;

  late final _i1.ColumnInt views;

  late final _i1.ColumnInt likes;

  late final _i1.ColumnInt downloads;

  late final _i1.ColumnSerializable taggedUsers;

  late final _i1.ColumnInt commentsCount;

  late final _i1.ColumnDateTime createdAt;

  late final _i1.ColumnDateTime updatedAt;

  late final _i1.ColumnString videoDuration;

  late final _i1.ColumnBool showPrompt;

  _i2.UserTable get user {
    if (_user != null) return _user!;
    _user = _i1.createRelationTable(
      relationFieldName: 'user',
      field: Artwork.t.userId,
      foreignField: _i2.User.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.UserTable(tableRelation: foreignTableRelation),
    );
    return _user!;
  }

  _i4.ArtworkTagsTable get __tags {
    if (___tags != null) return ___tags!;
    ___tags = _i1.createRelationTable(
      relationFieldName: '__tags',
      field: Artwork.t.id,
      foreignField: _i4.ArtworkTags.t.artworkId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.ArtworkTagsTable(tableRelation: foreignTableRelation),
    );
    return ___tags!;
  }

  _i5.ArtworkModelsTable get __models {
    if (___models != null) return ___models!;
    ___models = _i1.createRelationTable(
      relationFieldName: '__models',
      field: Artwork.t.id,
      foreignField: _i5.ArtworkModels.t.artworkId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.ArtworkModelsTable(tableRelation: foreignTableRelation),
    );
    return ___models!;
  }

  _i1.ManyRelation<_i4.ArtworkTagsTable> get tags {
    if (_tags != null) return _tags!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'tags',
      field: Artwork.t.id,
      foreignField: _i4.ArtworkTags.t.artworkId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i4.ArtworkTagsTable(tableRelation: foreignTableRelation),
    );
    _tags = _i1.ManyRelation<_i4.ArtworkTagsTable>(
      tableWithRelations: relationTable,
      table: _i4.ArtworkTagsTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _tags!;
  }

  _i1.ManyRelation<_i5.ArtworkModelsTable> get models {
    if (_models != null) return _models!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'models',
      field: Artwork.t.id,
      foreignField: _i5.ArtworkModels.t.artworkId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i5.ArtworkModelsTable(tableRelation: foreignTableRelation),
    );
    _models = _i1.ManyRelation<_i5.ArtworkModelsTable>(
      tableWithRelations: relationTable,
      table: _i5.ArtworkModelsTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _models!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        mediaUrl,
        thumbnailUrl,
        mediaType,
        tagNames,
        prompt,
        modelNames,
        resolution,
        allowDownload,
        views,
        likes,
        downloads,
        taggedUsers,
        commentsCount,
        createdAt,
        updatedAt,
        videoDuration,
        showPrompt,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'user') {
      return user;
    }
    if (relationField == 'tags') {
      return __tags;
    }
    if (relationField == 'models') {
      return __models;
    }
    return null;
  }
}

class ArtworkInclude extends _i1.IncludeObject {
  ArtworkInclude._({
    _i2.UserInclude? user,
    _i4.ArtworkTagsIncludeList? tags,
    _i5.ArtworkModelsIncludeList? models,
  }) {
    _user = user;
    _tags = tags;
    _models = models;
  }

  _i2.UserInclude? _user;

  _i4.ArtworkTagsIncludeList? _tags;

  _i5.ArtworkModelsIncludeList? _models;

  @override
  Map<String, _i1.Include?> get includes => {
        'user': _user,
        'tags': _tags,
        'models': _models,
      };

  @override
  _i1.Table<int?> get table => Artwork.t;
}

class ArtworkIncludeList extends _i1.IncludeList {
  ArtworkIncludeList._({
    _i1.WhereExpressionBuilder<ArtworkTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Artwork.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => Artwork.t;
}

class ArtworkRepository {
  const ArtworkRepository._();

  final attach = const ArtworkAttachRepository._();

  final attachRow = const ArtworkAttachRowRepository._();

  final detach = const ArtworkDetachRepository._();

  final detachRow = const ArtworkDetachRowRepository._();

  /// Returns a list of [Artwork]s matching the given query parameters.
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
  Future<List<Artwork>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<ArtworkTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkTable>? orderByList,
    _i1.Transaction? transaction,
    ArtworkInclude? include,
  }) async {
    return session.db.find<Artwork>(
      where: where?.call(Artwork.t),
      orderBy: orderBy?.call(Artwork.t),
      orderByList: orderByList?.call(Artwork.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Returns the first matching [Artwork] matching the given query parameters.
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
  Future<Artwork?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkTable>? where,
    int? offset,
    _i1.OrderByBuilder<ArtworkTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<ArtworkTable>? orderByList,
    _i1.Transaction? transaction,
    ArtworkInclude? include,
  }) async {
    return session.db.findFirstRow<Artwork>(
      where: where?.call(Artwork.t),
      orderBy: orderBy?.call(Artwork.t),
      orderByList: orderByList?.call(Artwork.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  /// Finds a single [Artwork] by its [id] or null if no such row exists.
  Future<Artwork?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    ArtworkInclude? include,
  }) async {
    return session.db.findById<Artwork>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  /// Inserts all [Artwork]s in the list and returns the inserted rows.
  ///
  /// The returned [Artwork]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<Artwork>> insert(
    _i1.Session session,
    List<Artwork> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Artwork>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [Artwork] and returns the inserted row.
  ///
  /// The returned [Artwork] will have its `id` field set.
  Future<Artwork> insertRow(
    _i1.Session session,
    Artwork row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Artwork>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [Artwork]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<Artwork>> update(
    _i1.Session session,
    List<Artwork> rows, {
    _i1.ColumnSelections<ArtworkTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Artwork>(
      rows,
      columns: columns?.call(Artwork.t),
      transaction: transaction,
    );
  }

  /// Updates a single [Artwork]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<Artwork> updateRow(
    _i1.Session session,
    Artwork row, {
    _i1.ColumnSelections<ArtworkTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Artwork>(
      row,
      columns: columns?.call(Artwork.t),
      transaction: transaction,
    );
  }

  /// Deletes all [Artwork]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<Artwork>> delete(
    _i1.Session session,
    List<Artwork> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Artwork>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [Artwork].
  Future<Artwork> deleteRow(
    _i1.Session session,
    Artwork row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Artwork>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<Artwork>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<ArtworkTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Artwork>(
      where: where(Artwork.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<ArtworkTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Artwork>(
      where: where?.call(Artwork.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class ArtworkAttachRepository {
  const ArtworkAttachRepository._();

  /// Creates a relation between this [Artwork] and the given [ArtworkTags]s
  /// by setting each [ArtworkTags]'s foreign key `artworkId` to refer to this [Artwork].
  Future<void> tags(
    _i1.Session session,
    Artwork artwork,
    List<_i4.ArtworkTags> artworkTags, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkTags.any((e) => e.id == null)) {
      throw ArgumentError.notNull('artworkTags.id');
    }
    if (artwork.id == null) {
      throw ArgumentError.notNull('artwork.id');
    }

    var $artworkTags =
        artworkTags.map((e) => e.copyWith(artworkId: artwork.id)).toList();
    await session.db.update<_i4.ArtworkTags>(
      $artworkTags,
      columns: [_i4.ArtworkTags.t.artworkId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Artwork] and the given [ArtworkModels]s
  /// by setting each [ArtworkModels]'s foreign key `artworkId` to refer to this [Artwork].
  Future<void> models(
    _i1.Session session,
    Artwork artwork,
    List<_i5.ArtworkModels> artworkModels, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkModels.any((e) => e.id == null)) {
      throw ArgumentError.notNull('artworkModels.id');
    }
    if (artwork.id == null) {
      throw ArgumentError.notNull('artwork.id');
    }

    var $artworkModels =
        artworkModels.map((e) => e.copyWith(artworkId: artwork.id)).toList();
    await session.db.update<_i5.ArtworkModels>(
      $artworkModels,
      columns: [_i5.ArtworkModels.t.artworkId],
      transaction: transaction,
    );
  }
}

class ArtworkAttachRowRepository {
  const ArtworkAttachRowRepository._();

  /// Creates a relation between the given [Artwork] and [User]
  /// by setting the [Artwork]'s foreign key `userId` to refer to the [User].
  Future<void> user(
    _i1.Session session,
    Artwork artwork,
    _i2.User user, {
    _i1.Transaction? transaction,
  }) async {
    if (artwork.id == null) {
      throw ArgumentError.notNull('artwork.id');
    }
    if (user.id == null) {
      throw ArgumentError.notNull('user.id');
    }

    var $artwork = artwork.copyWith(userId: user.id);
    await session.db.updateRow<Artwork>(
      $artwork,
      columns: [Artwork.t.userId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Artwork] and the given [ArtworkTags]
  /// by setting the [ArtworkTags]'s foreign key `artworkId` to refer to this [Artwork].
  Future<void> tags(
    _i1.Session session,
    Artwork artwork,
    _i4.ArtworkTags artworkTags, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkTags.id == null) {
      throw ArgumentError.notNull('artworkTags.id');
    }
    if (artwork.id == null) {
      throw ArgumentError.notNull('artwork.id');
    }

    var $artworkTags = artworkTags.copyWith(artworkId: artwork.id);
    await session.db.updateRow<_i4.ArtworkTags>(
      $artworkTags,
      columns: [_i4.ArtworkTags.t.artworkId],
      transaction: transaction,
    );
  }

  /// Creates a relation between this [Artwork] and the given [ArtworkModels]
  /// by setting the [ArtworkModels]'s foreign key `artworkId` to refer to this [Artwork].
  Future<void> models(
    _i1.Session session,
    Artwork artwork,
    _i5.ArtworkModels artworkModels, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkModels.id == null) {
      throw ArgumentError.notNull('artworkModels.id');
    }
    if (artwork.id == null) {
      throw ArgumentError.notNull('artwork.id');
    }

    var $artworkModels = artworkModels.copyWith(artworkId: artwork.id);
    await session.db.updateRow<_i5.ArtworkModels>(
      $artworkModels,
      columns: [_i5.ArtworkModels.t.artworkId],
      transaction: transaction,
    );
  }
}

class ArtworkDetachRepository {
  const ArtworkDetachRepository._();

  /// Detaches the relation between this [Artwork] and the given [ArtworkTags]
  /// by setting the [ArtworkTags]'s foreign key `artworkId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> tags(
    _i1.Session session,
    List<_i4.ArtworkTags> artworkTags, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkTags.any((e) => e.id == null)) {
      throw ArgumentError.notNull('artworkTags.id');
    }

    var $artworkTags =
        artworkTags.map((e) => e.copyWith(artworkId: null)).toList();
    await session.db.update<_i4.ArtworkTags>(
      $artworkTags,
      columns: [_i4.ArtworkTags.t.artworkId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Artwork] and the given [ArtworkModels]
  /// by setting the [ArtworkModels]'s foreign key `artworkId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> models(
    _i1.Session session,
    List<_i5.ArtworkModels> artworkModels, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkModels.any((e) => e.id == null)) {
      throw ArgumentError.notNull('artworkModels.id');
    }

    var $artworkModels =
        artworkModels.map((e) => e.copyWith(artworkId: null)).toList();
    await session.db.update<_i5.ArtworkModels>(
      $artworkModels,
      columns: [_i5.ArtworkModels.t.artworkId],
      transaction: transaction,
    );
  }
}

class ArtworkDetachRowRepository {
  const ArtworkDetachRowRepository._();

  /// Detaches the relation between this [Artwork] and the given [ArtworkTags]
  /// by setting the [ArtworkTags]'s foreign key `artworkId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> tags(
    _i1.Session session,
    _i4.ArtworkTags artworkTags, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkTags.id == null) {
      throw ArgumentError.notNull('artworkTags.id');
    }

    var $artworkTags = artworkTags.copyWith(artworkId: null);
    await session.db.updateRow<_i4.ArtworkTags>(
      $artworkTags,
      columns: [_i4.ArtworkTags.t.artworkId],
      transaction: transaction,
    );
  }

  /// Detaches the relation between this [Artwork] and the given [ArtworkModels]
  /// by setting the [ArtworkModels]'s foreign key `artworkId` to `null`.
  ///
  /// This removes the association between the two models without deleting
  /// the related record.
  Future<void> models(
    _i1.Session session,
    _i5.ArtworkModels artworkModels, {
    _i1.Transaction? transaction,
  }) async {
    if (artworkModels.id == null) {
      throw ArgumentError.notNull('artworkModels.id');
    }

    var $artworkModels = artworkModels.copyWith(artworkId: null);
    await session.db.updateRow<_i5.ArtworkModels>(
      $artworkModels,
      columns: [_i5.ArtworkModels.t.artworkId],
      transaction: transaction,
    );
  }
}
