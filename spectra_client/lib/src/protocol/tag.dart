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
import 'artwork_tags.dart' as _i2;

abstract class Tag implements _i1.SerializableModel {
  Tag._({
    this.id,
    this.tags,
    required this.name,
    int? usageCount,
  }) : usageCount = usageCount ?? 1;

  factory Tag({
    int? id,
    List<_i2.ArtworkTags>? tags,
    required String name,
    int? usageCount,
  }) = _TagImpl;

  factory Tag.fromJson(Map<String, dynamic> jsonSerialization) {
    return Tag(
      id: jsonSerialization['id'] as int?,
      tags: (jsonSerialization['tags'] as List?)
          ?.map((e) => _i2.ArtworkTags.fromJson((e as Map<String, dynamic>)))
          .toList(),
      name: jsonSerialization['name'] as String,
      usageCount: jsonSerialization['usageCount'] as int?,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  List<_i2.ArtworkTags>? tags;

  String name;

  int? usageCount;

  /// Returns a shallow copy of this [Tag]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Tag copyWith({
    int? id,
    List<_i2.ArtworkTags>? tags,
    String? name,
    int? usageCount,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (tags != null) 'tags': tags?.toJson(valueToJson: (v) => v.toJson()),
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

class _TagImpl extends Tag {
  _TagImpl({
    int? id,
    List<_i2.ArtworkTags>? tags,
    required String name,
    int? usageCount,
  }) : super._(
          id: id,
          tags: tags,
          name: name,
          usageCount: usageCount,
        );

  /// Returns a shallow copy of this [Tag]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Tag copyWith({
    Object? id = _Undefined,
    Object? tags = _Undefined,
    String? name,
    Object? usageCount = _Undefined,
  }) {
    return Tag(
      id: id is int? ? id : this.id,
      tags: tags is List<_i2.ArtworkTags>?
          ? tags
          : this.tags?.map((e0) => e0.copyWith()).toList(),
      name: name ?? this.name,
      usageCount: usageCount is int? ? usageCount : this.usageCount,
    );
  }
}
