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
import 'model.dart' as _i3;

abstract class ArtworkModels implements _i1.SerializableModel {
  ArtworkModels._({
    this.id,
    required this.artworkId,
    this.artwork,
    required this.modelId,
    this.model,
  });

  factory ArtworkModels({
    int? id,
    required int artworkId,
    _i2.Artwork? artwork,
    required int modelId,
    _i3.Model? model,
  }) = _ArtworkModelsImpl;

  factory ArtworkModels.fromJson(Map<String, dynamic> jsonSerialization) {
    return ArtworkModels(
      id: jsonSerialization['id'] as int?,
      artworkId: jsonSerialization['artworkId'] as int,
      artwork: jsonSerialization['artwork'] == null
          ? null
          : _i2.Artwork.fromJson(
              (jsonSerialization['artwork'] as Map<String, dynamic>)),
      modelId: jsonSerialization['modelId'] as int,
      model: jsonSerialization['model'] == null
          ? null
          : _i3.Model.fromJson(
              (jsonSerialization['model'] as Map<String, dynamic>)),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int artworkId;

  _i2.Artwork? artwork;

  int modelId;

  _i3.Model? model;

  /// Returns a shallow copy of this [ArtworkModels]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ArtworkModels copyWith({
    int? id,
    int? artworkId,
    _i2.Artwork? artwork,
    int? modelId,
    _i3.Model? model,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'artworkId': artworkId,
      if (artwork != null) 'artwork': artwork?.toJson(),
      'modelId': modelId,
      if (model != null) 'model': model?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ArtworkModelsImpl extends ArtworkModels {
  _ArtworkModelsImpl({
    int? id,
    required int artworkId,
    _i2.Artwork? artwork,
    required int modelId,
    _i3.Model? model,
  }) : super._(
          id: id,
          artworkId: artworkId,
          artwork: artwork,
          modelId: modelId,
          model: model,
        );

  /// Returns a shallow copy of this [ArtworkModels]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ArtworkModels copyWith({
    Object? id = _Undefined,
    int? artworkId,
    Object? artwork = _Undefined,
    int? modelId,
    Object? model = _Undefined,
  }) {
    return ArtworkModels(
      id: id is int? ? id : this.id,
      artworkId: artworkId ?? this.artworkId,
      artwork: artwork is _i2.Artwork? ? artwork : this.artwork?.copyWith(),
      modelId: modelId ?? this.modelId,
      model: model is _i3.Model? ? model : this.model?.copyWith(),
    );
  }
}
