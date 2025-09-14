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

abstract class ArtworkLikes implements _i1.SerializableModel {
  ArtworkLikes._({
    this.id,
    required this.artworkId,
    this.artwork,
    required this.likedById,
    this.likedBy,
    DateTime? dateCreated,
  }) : dateCreated = dateCreated ?? DateTime.now();

  factory ArtworkLikes({
    int? id,
    required int artworkId,
    _i2.Artwork? artwork,
    required int likedById,
    _i3.User? likedBy,
    DateTime? dateCreated,
  }) = _ArtworkLikesImpl;

  factory ArtworkLikes.fromJson(Map<String, dynamic> jsonSerialization) {
    return ArtworkLikes(
      id: jsonSerialization['id'] as int?,
      artworkId: jsonSerialization['artworkId'] as int,
      artwork: jsonSerialization['artwork'] == null
          ? null
          : _i2.Artwork.fromJson(
              (jsonSerialization['artwork'] as Map<String, dynamic>)),
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

  int artworkId;

  _i2.Artwork? artwork;

  int likedById;

  _i3.User? likedBy;

  DateTime? dateCreated;

  /// Returns a shallow copy of this [ArtworkLikes]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ArtworkLikes copyWith({
    int? id,
    int? artworkId,
    _i2.Artwork? artwork,
    int? likedById,
    _i3.User? likedBy,
    DateTime? dateCreated,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'artworkId': artworkId,
      if (artwork != null) 'artwork': artwork?.toJson(),
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

class _ArtworkLikesImpl extends ArtworkLikes {
  _ArtworkLikesImpl({
    int? id,
    required int artworkId,
    _i2.Artwork? artwork,
    required int likedById,
    _i3.User? likedBy,
    DateTime? dateCreated,
  }) : super._(
          id: id,
          artworkId: artworkId,
          artwork: artwork,
          likedById: likedById,
          likedBy: likedBy,
          dateCreated: dateCreated,
        );

  /// Returns a shallow copy of this [ArtworkLikes]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ArtworkLikes copyWith({
    Object? id = _Undefined,
    int? artworkId,
    Object? artwork = _Undefined,
    int? likedById,
    Object? likedBy = _Undefined,
    Object? dateCreated = _Undefined,
  }) {
    return ArtworkLikes(
      id: id is int? ? id : this.id,
      artworkId: artworkId ?? this.artworkId,
      artwork: artwork is _i2.Artwork? ? artwork : this.artwork?.copyWith(),
      likedById: likedById ?? this.likedById,
      likedBy: likedBy is _i3.User? ? likedBy : this.likedBy?.copyWith(),
      dateCreated: dateCreated is DateTime? ? dateCreated : this.dateCreated,
    );
  }
}
