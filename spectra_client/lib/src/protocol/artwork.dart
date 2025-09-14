/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'user.dart' as _i2;
import 'media_type.dart' as _i3;
import 'artwork_tags.dart' as _i4;
import 'artwork_models.dart' as _i5;

abstract class Artwork implements _i1.SerializableModel {
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

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
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
