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
import 'artwork_models.dart' as _i2;

abstract class Model implements _i1.SerializableModel {
  Model._({
    this.id,
    this.models,
    required this.name,
    int? usageCount,
  }) : usageCount = usageCount ?? 1;

  factory Model({
    int? id,
    List<_i2.ArtworkModels>? models,
    required String name,
    int? usageCount,
  }) = _ModelImpl;

  factory Model.fromJson(Map<String, dynamic> jsonSerialization) {
    return Model(
      id: jsonSerialization['id'] as int?,
      models: (jsonSerialization['models'] as List?)
          ?.map((e) => _i2.ArtworkModels.fromJson((e as Map<String, dynamic>)))
          .toList(),
      name: jsonSerialization['name'] as String,
      usageCount: jsonSerialization['usageCount'] as int?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  List<_i2.ArtworkModels>? models;

  String name;

  int? usageCount;

  /// Returns a shallow copy of this [Model]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Model copyWith({
    int? id,
    List<_i2.ArtworkModels>? models,
    String? name,
    int? usageCount,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (models != null)
        'models': models?.toJson(valueToJson: (v) => v.toJson()),
      'name': name,
      if (usageCount != null) 'usageCount': usageCount,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ModelImpl extends Model {
  _ModelImpl({
    int? id,
    List<_i2.ArtworkModels>? models,
    required String name,
    int? usageCount,
  }) : super._(
          id: id,
          models: models,
          name: name,
          usageCount: usageCount,
        );

  /// Returns a shallow copy of this [Model]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Model copyWith({
    Object? id = _Undefined,
    Object? models = _Undefined,
    String? name,
    Object? usageCount = _Undefined,
  }) {
    return Model(
      id: id is int? ? id : this.id,
      models: models is List<_i2.ArtworkModels>?
          ? models
          : this.models?.map((e0) => e0.copyWith()).toList(),
      name: name ?? this.name,
      usageCount: usageCount is int? ? usageCount : this.usageCount,
    );
  }
}
