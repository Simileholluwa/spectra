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

abstract class ArtworkDownloads implements _i1.SerializableModel {
  ArtworkDownloads._({
    this.id,
    required this.artworkId,
    this.artwork,
    required this.downloadedById,
    this.downloadedBy,
    DateTime? dateCreated,
  }) : dateCreated = dateCreated ?? DateTime.now();

  factory ArtworkDownloads({
    int? id,
    required int artworkId,
    _i2.Artwork? artwork,
    required int downloadedById,
    _i3.User? downloadedBy,
    DateTime? dateCreated,
  }) = _ArtworkDownloadsImpl;

  factory ArtworkDownloads.fromJson(Map<String, dynamic> jsonSerialization) {
    return ArtworkDownloads(
      id: jsonSerialization['id'] as int?,
      artworkId: jsonSerialization['artworkId'] as int,
      artwork: jsonSerialization['artwork'] == null
          ? null
          : _i2.Artwork.fromJson(
              (jsonSerialization['artwork'] as Map<String, dynamic>)),
      downloadedById: jsonSerialization['downloadedById'] as int,
      downloadedBy: jsonSerialization['downloadedBy'] == null
          ? null
          : _i3.User.fromJson(
              (jsonSerialization['downloadedBy'] as Map<String, dynamic>)),
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

  int downloadedById;

  _i3.User? downloadedBy;

  DateTime? dateCreated;

  /// Returns a shallow copy of this [ArtworkDownloads]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ArtworkDownloads copyWith({
    int? id,
    int? artworkId,
    _i2.Artwork? artwork,
    int? downloadedById,
    _i3.User? downloadedBy,
    DateTime? dateCreated,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'artworkId': artworkId,
      if (artwork != null) 'artwork': artwork?.toJson(),
      'downloadedById': downloadedById,
      if (downloadedBy != null) 'downloadedBy': downloadedBy?.toJson(),
      if (dateCreated != null) 'dateCreated': dateCreated?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ArtworkDownloadsImpl extends ArtworkDownloads {
  _ArtworkDownloadsImpl({
    int? id,
    required int artworkId,
    _i2.Artwork? artwork,
    required int downloadedById,
    _i3.User? downloadedBy,
    DateTime? dateCreated,
  }) : super._(
          id: id,
          artworkId: artworkId,
          artwork: artwork,
          downloadedById: downloadedById,
          downloadedBy: downloadedBy,
          dateCreated: dateCreated,
        );

  /// Returns a shallow copy of this [ArtworkDownloads]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ArtworkDownloads copyWith({
    Object? id = _Undefined,
    int? artworkId,
    Object? artwork = _Undefined,
    int? downloadedById,
    Object? downloadedBy = _Undefined,
    Object? dateCreated = _Undefined,
  }) {
    return ArtworkDownloads(
      id: id is int? ? id : this.id,
      artworkId: artworkId ?? this.artworkId,
      artwork: artwork is _i2.Artwork? ? artwork : this.artwork?.copyWith(),
      downloadedById: downloadedById ?? this.downloadedById,
      downloadedBy: downloadedBy is _i3.User?
          ? downloadedBy
          : this.downloadedBy?.copyWith(),
      dateCreated: dateCreated is DateTime? ? dateCreated : this.dateCreated,
    );
  }
}
