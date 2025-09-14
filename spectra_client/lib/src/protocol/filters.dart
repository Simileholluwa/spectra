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
import 'media_type.dart' as _i2;

abstract class ArtworkFilter implements _i1.SerializableModel {
  ArtworkFilter._({
    this.tag,
    this.model,
    this.mediaType,
    this.hasPrompt,
    this.canDownload,
    this.startDate,
    this.endDate,
  });

  factory ArtworkFilter({
    List<String>? tag,
    List<String>? model,
    _i2.MediaType? mediaType,
    bool? hasPrompt,
    bool? canDownload,
    DateTime? startDate,
    DateTime? endDate,
  }) = _ArtworkFilterImpl;

  factory ArtworkFilter.fromJson(Map<String, dynamic> jsonSerialization) {
    return ArtworkFilter(
      tag:
          (jsonSerialization['tag'] as List?)?.map((e) => e as String).toList(),
      model: (jsonSerialization['model'] as List?)
          ?.map((e) => e as String)
          .toList(),
      mediaType: jsonSerialization['mediaType'] == null
          ? null
          : _i2.MediaType.fromJson((jsonSerialization['mediaType'] as int)),
      hasPrompt: jsonSerialization['hasPrompt'] as bool?,
      canDownload: jsonSerialization['canDownload'] as bool?,
      startDate: jsonSerialization['startDate'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['startDate']),
      endDate: jsonSerialization['endDate'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['endDate']),
    );
  }

  List<String>? tag;

  List<String>? model;

  _i2.MediaType? mediaType;

  bool? hasPrompt;

  bool? canDownload;

  DateTime? startDate;

  DateTime? endDate;

  /// Returns a shallow copy of this [ArtworkFilter]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ArtworkFilter copyWith({
    List<String>? tag,
    List<String>? model,
    _i2.MediaType? mediaType,
    bool? hasPrompt,
    bool? canDownload,
    DateTime? startDate,
    DateTime? endDate,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (tag != null) 'tag': tag?.toJson(),
      if (model != null) 'model': model?.toJson(),
      if (mediaType != null) 'mediaType': mediaType?.toJson(),
      if (hasPrompt != null) 'hasPrompt': hasPrompt,
      if (canDownload != null) 'canDownload': canDownload,
      if (startDate != null) 'startDate': startDate?.toJson(),
      if (endDate != null) 'endDate': endDate?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ArtworkFilterImpl extends ArtworkFilter {
  _ArtworkFilterImpl({
    List<String>? tag,
    List<String>? model,
    _i2.MediaType? mediaType,
    bool? hasPrompt,
    bool? canDownload,
    DateTime? startDate,
    DateTime? endDate,
  }) : super._(
          tag: tag,
          model: model,
          mediaType: mediaType,
          hasPrompt: hasPrompt,
          canDownload: canDownload,
          startDate: startDate,
          endDate: endDate,
        );

  /// Returns a shallow copy of this [ArtworkFilter]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ArtworkFilter copyWith({
    Object? tag = _Undefined,
    Object? model = _Undefined,
    Object? mediaType = _Undefined,
    Object? hasPrompt = _Undefined,
    Object? canDownload = _Undefined,
    Object? startDate = _Undefined,
    Object? endDate = _Undefined,
  }) {
    return ArtworkFilter(
      tag: tag is List<String>? ? tag : this.tag?.map((e0) => e0).toList(),
      model:
          model is List<String>? ? model : this.model?.map((e0) => e0).toList(),
      mediaType: mediaType is _i2.MediaType? ? mediaType : this.mediaType,
      hasPrompt: hasPrompt is bool? ? hasPrompt : this.hasPrompt,
      canDownload: canDownload is bool? ? canDownload : this.canDownload,
      startDate: startDate is DateTime? ? startDate : this.startDate,
      endDate: endDate is DateTime? ? endDate : this.endDate,
    );
  }
}
