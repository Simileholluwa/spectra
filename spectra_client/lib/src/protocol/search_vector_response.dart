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

abstract class SearchVectorResponse implements _i1.SerializableModel {
  SearchVectorResponse._({
    required this.fileName,
    required this.isDuplicate,
    required this.similarity,
    required this.tags,
    required this.thumbnail,
    required this.resolution,
    required this.videoDuration,
  });

  factory SearchVectorResponse({
    required String fileName,
    required bool isDuplicate,
    required double similarity,
    required List<String> tags,
    required String thumbnail,
    required String resolution,
    required String videoDuration,
  }) = _SearchVectorResponseImpl;

  factory SearchVectorResponse.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return SearchVectorResponse(
      fileName: jsonSerialization['fileName'] as String,
      isDuplicate: jsonSerialization['isDuplicate'] as bool,
      similarity: (jsonSerialization['similarity'] as num).toDouble(),
      tags:
          (jsonSerialization['tags'] as List).map((e) => e as String).toList(),
      thumbnail: jsonSerialization['thumbnail'] as String,
      resolution: jsonSerialization['resolution'] as String,
      videoDuration: jsonSerialization['videoDuration'] as String,
    );
  }

  String fileName;

  bool isDuplicate;

  double similarity;

  List<String> tags;

  String thumbnail;

  String resolution;

  String videoDuration;

  /// Returns a shallow copy of this [SearchVectorResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  SearchVectorResponse copyWith({
    String? fileName,
    bool? isDuplicate,
    double? similarity,
    List<String>? tags,
    String? thumbnail,
    String? resolution,
    String? videoDuration,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'fileName': fileName,
      'isDuplicate': isDuplicate,
      'similarity': similarity,
      'tags': tags.toJson(),
      'thumbnail': thumbnail,
      'resolution': resolution,
      'videoDuration': videoDuration,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _SearchVectorResponseImpl extends SearchVectorResponse {
  _SearchVectorResponseImpl({
    required String fileName,
    required bool isDuplicate,
    required double similarity,
    required List<String> tags,
    required String thumbnail,
    required String resolution,
    required String videoDuration,
  }) : super._(
          fileName: fileName,
          isDuplicate: isDuplicate,
          similarity: similarity,
          tags: tags,
          thumbnail: thumbnail,
          resolution: resolution,
          videoDuration: videoDuration,
        );

  /// Returns a shallow copy of this [SearchVectorResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  SearchVectorResponse copyWith({
    String? fileName,
    bool? isDuplicate,
    double? similarity,
    List<String>? tags,
    String? thumbnail,
    String? resolution,
    String? videoDuration,
  }) {
    return SearchVectorResponse(
      fileName: fileName ?? this.fileName,
      isDuplicate: isDuplicate ?? this.isDuplicate,
      similarity: similarity ?? this.similarity,
      tags: tags ?? this.tags.map((e0) => e0).toList(),
      thumbnail: thumbnail ?? this.thumbnail,
      resolution: resolution ?? this.resolution,
      videoDuration: videoDuration ?? this.videoDuration,
    );
  }
}
