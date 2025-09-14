/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import 'artwork.dart' as _i2;
import 'media_type.dart' as _i3;
import 'presigned_url_request.dart' as _i4;
import 'presigned_url_response.dart' as _i5;

abstract class ArtworkData
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  ArtworkData._({
    required this.artWork,
    required this.mediaType,
    required this.resolution,
    required this.files,
    required this.thumbnailFiles,
    this.presignedUrlResponse,
    this.thumbnailPresignedUrlResponse,
  });

  factory ArtworkData({
    required _i2.Artwork artWork,
    required _i3.MediaType mediaType,
    required List<String> resolution,
    required List<_i4.PresignedUrlRequest> files,
    required List<_i4.PresignedUrlRequest> thumbnailFiles,
    List<_i5.PresignedUrlResponse>? presignedUrlResponse,
    List<_i5.PresignedUrlResponse>? thumbnailPresignedUrlResponse,
  }) = _ArtworkDataImpl;

  factory ArtworkData.fromJson(Map<String, dynamic> jsonSerialization) {
    return ArtworkData(
      artWork: _i2.Artwork.fromJson(
          (jsonSerialization['artWork'] as Map<String, dynamic>)),
      mediaType:
          _i3.MediaType.fromJson((jsonSerialization['mediaType'] as int)),
      resolution: (jsonSerialization['resolution'] as List)
          .map((e) => e as String)
          .toList(),
      files: (jsonSerialization['files'] as List)
          .map((e) =>
              _i4.PresignedUrlRequest.fromJson((e as Map<String, dynamic>)))
          .toList(),
      thumbnailFiles: (jsonSerialization['thumbnailFiles'] as List)
          .map((e) =>
              _i4.PresignedUrlRequest.fromJson((e as Map<String, dynamic>)))
          .toList(),
      presignedUrlResponse: (jsonSerialization['presignedUrlResponse'] as List?)
          ?.map((e) =>
              _i5.PresignedUrlResponse.fromJson((e as Map<String, dynamic>)))
          .toList(),
      thumbnailPresignedUrlResponse:
          (jsonSerialization['thumbnailPresignedUrlResponse'] as List?)
              ?.map((e) => _i5.PresignedUrlResponse.fromJson(
                  (e as Map<String, dynamic>)))
              .toList(),
    );
  }

  _i2.Artwork artWork;

  _i3.MediaType mediaType;

  List<String> resolution;

  List<_i4.PresignedUrlRequest> files;

  List<_i4.PresignedUrlRequest> thumbnailFiles;

  List<_i5.PresignedUrlResponse>? presignedUrlResponse;

  List<_i5.PresignedUrlResponse>? thumbnailPresignedUrlResponse;

  /// Returns a shallow copy of this [ArtworkData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ArtworkData copyWith({
    _i2.Artwork? artWork,
    _i3.MediaType? mediaType,
    List<String>? resolution,
    List<_i4.PresignedUrlRequest>? files,
    List<_i4.PresignedUrlRequest>? thumbnailFiles,
    List<_i5.PresignedUrlResponse>? presignedUrlResponse,
    List<_i5.PresignedUrlResponse>? thumbnailPresignedUrlResponse,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'artWork': artWork.toJson(),
      'mediaType': mediaType.toJson(),
      'resolution': resolution.toJson(),
      'files': files.toJson(valueToJson: (v) => v.toJson()),
      'thumbnailFiles': thumbnailFiles.toJson(valueToJson: (v) => v.toJson()),
      if (presignedUrlResponse != null)
        'presignedUrlResponse':
            presignedUrlResponse?.toJson(valueToJson: (v) => v.toJson()),
      if (thumbnailPresignedUrlResponse != null)
        'thumbnailPresignedUrlResponse': thumbnailPresignedUrlResponse?.toJson(
            valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'artWork': artWork.toJsonForProtocol(),
      'mediaType': mediaType.toJson(),
      'resolution': resolution.toJson(),
      'files': files.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      'thumbnailFiles':
          thumbnailFiles.toJson(valueToJson: (v) => v.toJsonForProtocol()),
      if (presignedUrlResponse != null)
        'presignedUrlResponse': presignedUrlResponse?.toJson(
            valueToJson: (v) => v.toJsonForProtocol()),
      if (thumbnailPresignedUrlResponse != null)
        'thumbnailPresignedUrlResponse': thumbnailPresignedUrlResponse?.toJson(
            valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ArtworkDataImpl extends ArtworkData {
  _ArtworkDataImpl({
    required _i2.Artwork artWork,
    required _i3.MediaType mediaType,
    required List<String> resolution,
    required List<_i4.PresignedUrlRequest> files,
    required List<_i4.PresignedUrlRequest> thumbnailFiles,
    List<_i5.PresignedUrlResponse>? presignedUrlResponse,
    List<_i5.PresignedUrlResponse>? thumbnailPresignedUrlResponse,
  }) : super._(
          artWork: artWork,
          mediaType: mediaType,
          resolution: resolution,
          files: files,
          thumbnailFiles: thumbnailFiles,
          presignedUrlResponse: presignedUrlResponse,
          thumbnailPresignedUrlResponse: thumbnailPresignedUrlResponse,
        );

  /// Returns a shallow copy of this [ArtworkData]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ArtworkData copyWith({
    _i2.Artwork? artWork,
    _i3.MediaType? mediaType,
    List<String>? resolution,
    List<_i4.PresignedUrlRequest>? files,
    List<_i4.PresignedUrlRequest>? thumbnailFiles,
    Object? presignedUrlResponse = _Undefined,
    Object? thumbnailPresignedUrlResponse = _Undefined,
  }) {
    return ArtworkData(
      artWork: artWork ?? this.artWork.copyWith(),
      mediaType: mediaType ?? this.mediaType,
      resolution: resolution ?? this.resolution.map((e0) => e0).toList(),
      files: files ?? this.files.map((e0) => e0.copyWith()).toList(),
      thumbnailFiles: thumbnailFiles ??
          this.thumbnailFiles.map((e0) => e0.copyWith()).toList(),
      presignedUrlResponse:
          presignedUrlResponse is List<_i5.PresignedUrlResponse>?
              ? presignedUrlResponse
              : this.presignedUrlResponse?.map((e0) => e0.copyWith()).toList(),
      thumbnailPresignedUrlResponse:
          thumbnailPresignedUrlResponse is List<_i5.PresignedUrlResponse>?
              ? thumbnailPresignedUrlResponse
              : this
                  .thumbnailPresignedUrlResponse
                  ?.map((e0) => e0.copyWith())
                  .toList(),
    );
  }
}
