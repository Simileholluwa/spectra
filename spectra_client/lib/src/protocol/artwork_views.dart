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

abstract class ArtworkViews implements _i1.SerializableModel {
  ArtworkViews._({
    this.id,
    required this.artworkId,
    this.artwork,
    required this.viewedById,
    this.viewedBy,
    DateTime? dateCreated,
  }) : dateCreated = dateCreated ?? DateTime.now();

  factory ArtworkViews({
    int? id,
    required int artworkId,
    _i2.Artwork? artwork,
    required int viewedById,
    _i3.User? viewedBy,
    DateTime? dateCreated,
  }) = _ArtworkViewsImpl;

  factory ArtworkViews.fromJson(Map<String, dynamic> jsonSerialization) {
    return ArtworkViews(
      id: jsonSerialization['id'] as int?,
      artworkId: jsonSerialization['artworkId'] as int,
      artwork: jsonSerialization['artwork'] == null
          ? null
          : _i2.Artwork.fromJson(
              (jsonSerialization['artwork'] as Map<String, dynamic>)),
      viewedById: jsonSerialization['viewedById'] as int,
      viewedBy: jsonSerialization['viewedBy'] == null
          ? null
          : _i3.User.fromJson(
              (jsonSerialization['viewedBy'] as Map<String, dynamic>)),
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

  int viewedById;

  _i3.User? viewedBy;

  DateTime? dateCreated;

  /// Returns a shallow copy of this [ArtworkViews]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ArtworkViews copyWith({
    int? id,
    int? artworkId,
    _i2.Artwork? artwork,
    int? viewedById,
    _i3.User? viewedBy,
    DateTime? dateCreated,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'artworkId': artworkId,
      if (artwork != null) 'artwork': artwork?.toJson(),
      'viewedById': viewedById,
      if (viewedBy != null) 'viewedBy': viewedBy?.toJson(),
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ArtworkViewsImpl extends ArtworkViews {
  _ArtworkViewsImpl({
    int? id,
    required int artworkId,
    _i2.Artwork? artwork,
    required int viewedById,
    _i3.User? viewedBy,
    DateTime? dateCreated,
  }) : super._(
          id: id,
          artworkId: artworkId,
          artwork: artwork,
          viewedById: viewedById,
          viewedBy: viewedBy,
          dateCreated: dateCreated,
        );

  /// Returns a shallow copy of this [ArtworkViews]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ArtworkViews copyWith({
    Object? id = _Undefined,
    int? artworkId,
    Object? artwork = _Undefined,
    int? viewedById,
    Object? viewedBy = _Undefined,
    Object? dateCreated = _Undefined,
  }) {
    return ArtworkViews(
      id: id is int? ? id : this.id,
      artworkId: artworkId ?? this.artworkId,
      artwork: artwork is _i2.Artwork? ? artwork : this.artwork?.copyWith(),
      viewedById: viewedById ?? this.viewedById,
      viewedBy: viewedBy is _i3.User? ? viewedBy : this.viewedBy?.copyWith(),
      dateCreated: dateCreated is DateTime? ? dateCreated : this.dateCreated,
    );
  }
}
