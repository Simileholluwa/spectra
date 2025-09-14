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

abstract class PresignedUrlResponse implements _i1.SerializableModel {
  PresignedUrlResponse._({
    required this.uploadUrl,
    required this.fileUrl,
    required this.filePath,
  });

  factory PresignedUrlResponse({
    required String uploadUrl,
    required String fileUrl,
    required String filePath,
  }) = _PresignedUrlResponseImpl;

  factory PresignedUrlResponse.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return PresignedUrlResponse(
      uploadUrl: jsonSerialization['uploadUrl'] as String,
      fileUrl: jsonSerialization['fileUrl'] as String,
      filePath: jsonSerialization['filePath'] as String,
    );
  }

  String uploadUrl;

  String fileUrl;

  String filePath;

  /// Returns a shallow copy of this [PresignedUrlResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PresignedUrlResponse copyWith({
    String? uploadUrl,
    String? fileUrl,
    String? filePath,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'uploadUrl': uploadUrl,
      'fileUrl': fileUrl,
      'filePath': filePath,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _PresignedUrlResponseImpl extends PresignedUrlResponse {
  _PresignedUrlResponseImpl({
    required String uploadUrl,
    required String fileUrl,
    required String filePath,
  }) : super._(
          uploadUrl: uploadUrl,
          fileUrl: fileUrl,
          filePath: filePath,
        );

  /// Returns a shallow copy of this [PresignedUrlResponse]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PresignedUrlResponse copyWith({
    String? uploadUrl,
    String? fileUrl,
    String? filePath,
  }) {
    return PresignedUrlResponse(
      uploadUrl: uploadUrl ?? this.uploadUrl,
      fileUrl: fileUrl ?? this.fileUrl,
      filePath: filePath ?? this.filePath,
    );
  }
}
