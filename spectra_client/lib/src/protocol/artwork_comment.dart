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
import 'artwork.dart' as _i2;
import 'user.dart' as _i3;
import 'artwork_comment.dart' as _i4;
import 'comment_type.dart' as _i5;

abstract class ArtworkComment implements _i1.SerializableModel {
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
    this.type,
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
    _i5.CommentType? type,
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
      type: jsonSerialization['type'] == null
          ? null
          : _i5.CommentType.fromJson((jsonSerialization['type'] as int)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
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

  _i5.CommentType? type;

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
    _i5.CommentType? type,
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
      if (type != null) 'type': type?.toJson(),
    };
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
    _i5.CommentType? type,
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
          type: type,
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
    Object? type = _Undefined,
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
      type: type is _i5.CommentType? ? type : this.type,
    );
  }
}
