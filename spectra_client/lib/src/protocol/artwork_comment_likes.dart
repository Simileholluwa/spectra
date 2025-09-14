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
import 'artwork_comment.dart' as _i2;
import 'user.dart' as _i3;

abstract class ArtworkCommentLikes implements _i1.SerializableModel {
  ArtworkCommentLikes._({
    this.id,
    required this.artworkCommentId,
    this.artworkComment,
    required this.likedById,
    this.likedBy,
    DateTime? dateCreated,
  }) : dateCreated = dateCreated ?? DateTime.now();

  factory ArtworkCommentLikes({
    int? id,
    required int artworkCommentId,
    _i2.ArtworkComment? artworkComment,
    required int likedById,
    _i3.User? likedBy,
    DateTime? dateCreated,
  }) = _ArtworkCommentLikesImpl;

  factory ArtworkCommentLikes.fromJson(Map<String, dynamic> jsonSerialization) {
    return ArtworkCommentLikes(
      id: jsonSerialization['id'] as int?,
      artworkCommentId: jsonSerialization['artworkCommentId'] as int,
      artworkComment: jsonSerialization['artworkComment'] == null
          ? null
          : _i2.ArtworkComment.fromJson(
              (jsonSerialization['artworkComment'] as Map<String, dynamic>)),
      likedById: jsonSerialization['likedById'] as int,
      likedBy: jsonSerialization['likedBy'] == null
          ? null
          : _i3.User.fromJson(
              (jsonSerialization['likedBy'] as Map<String, dynamic>)),
      dateCreated: jsonSerialization['dateCreated'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(
              jsonSerialization['dateCreated']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int artworkCommentId;

  _i2.ArtworkComment? artworkComment;

  int likedById;

  _i3.User? likedBy;

  DateTime? dateCreated;

  /// Returns a shallow copy of this [ArtworkCommentLikes]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ArtworkCommentLikes copyWith({
    int? id,
    int? artworkCommentId,
    _i2.ArtworkComment? artworkComment,
    int? likedById,
    _i3.User? likedBy,
    DateTime? dateCreated,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'artworkCommentId': artworkCommentId,
      if (artworkComment != null) 'artworkComment': artworkComment?.toJson(),
      'likedById': likedById,
      if (likedBy != null) 'likedBy': likedBy?.toJson(),
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ArtworkCommentLikesImpl extends ArtworkCommentLikes {
  _ArtworkCommentLikesImpl({
    int? id,
    required int artworkCommentId,
    _i2.ArtworkComment? artworkComment,
    required int likedById,
    _i3.User? likedBy,
    DateTime? dateCreated,
  }) : super._(
          id: id,
          artworkCommentId: artworkCommentId,
          artworkComment: artworkComment,
          likedById: likedById,
          likedBy: likedBy,
          dateCreated: dateCreated,
        );

  /// Returns a shallow copy of this [ArtworkCommentLikes]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ArtworkCommentLikes copyWith({
    Object? id = _Undefined,
    int? artworkCommentId,
    Object? artworkComment = _Undefined,
    int? likedById,
    Object? likedBy = _Undefined,
    Object? dateCreated = _Undefined,
  }) {
    return ArtworkCommentLikes(
      id: id is int? ? id : this.id,
      artworkCommentId: artworkCommentId ?? this.artworkCommentId,
      artworkComment: artworkComment is _i2.ArtworkComment?
          ? artworkComment
          : this.artworkComment?.copyWith(),
      likedById: likedById ?? this.likedById,
      likedBy: likedBy is _i3.User? ? likedBy : this.likedBy?.copyWith(),
      dateCreated: dateCreated is DateTime? ? dateCreated : this.dateCreated,
    );
  }
}
