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
import 'tag.dart' as _i3;

abstract class ArtworkTags implements _i1.SerializableModel {
  ArtworkTags._({
    this.id,
    required this.artworkId,
    this.artwork,
    required this.tagId,
    this.tag,
  });

  factory ArtworkTags({
    int? id,
    required int artworkId,
    _i2.Artwork? artwork,
    required int tagId,
    _i3.Tag? tag,
  }) = _ArtworkTagsImpl;

  factory ArtworkTags.fromJson(Map<String, dynamic> jsonSerialization) {
    return ArtworkTags(
      id: jsonSerialization['id'] as int?,
      artworkId: jsonSerialization['artworkId'] as int,
      artwork: jsonSerialization['artwork'] == null
          ? null
          : _i2.Artwork.fromJson(
              (jsonSerialization['artwork'] as Map<String, dynamic>)),
      tagId: jsonSerialization['tagId'] as int,
      tag: jsonSerialization['tag'] == null
          ? null
          : _i3.Tag.fromJson(
              (jsonSerialization['tag'] as Map<String, dynamic>)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int artworkId;

  _i2.Artwork? artwork;

  int tagId;

  _i3.Tag? tag;

  /// Returns a shallow copy of this [ArtworkTags]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ArtworkTags copyWith({
    int? id,
    int? artworkId,
    _i2.Artwork? artwork,
    int? tagId,
    _i3.Tag? tag,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'artworkId': artworkId,
      if (artwork != null) 'artwork': artwork?.toJson(),
      'tagId': tagId,
      if (tag != null) 'tag': tag?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ArtworkTagsImpl extends ArtworkTags {
  _ArtworkTagsImpl({
    int? id,
    required int artworkId,
    _i2.Artwork? artwork,
    required int tagId,
    _i3.Tag? tag,
  }) : super._(
          id: id,
          artworkId: artworkId,
          artwork: artwork,
          tagId: tagId,
          tag: tag,
        );

  /// Returns a shallow copy of this [ArtworkTags]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ArtworkTags copyWith({
    Object? id = _Undefined,
    int? artworkId,
    Object? artwork = _Undefined,
    int? tagId,
    Object? tag = _Undefined,
  }) {
    return ArtworkTags(
      id: id is int? ? id : this.id,
      artworkId: artworkId ?? this.artworkId,
      artwork: artwork is _i2.Artwork? ? artwork : this.artwork?.copyWith(),
      tagId: tagId ?? this.tagId,
      tag: tag is _i3.Tag? ? tag : this.tag?.copyWith(),
    );
  }
}
