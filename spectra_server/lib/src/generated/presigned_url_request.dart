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

abstract class PresignedUrlRequest
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  PresignedUrlRequest._({
    required this.fileName,
    required this.contentType,
    required this.filePath,
  });

  factory PresignedUrlRequest({
    required String fileName,
    required String contentType,
    required String filePath,
  }) = _PresignedUrlRequestImpl;

  factory PresignedUrlRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return PresignedUrlRequest(
      fileName: jsonSerialization['fileName'] as String,
      contentType: jsonSerialization['contentType'] as String,
      filePath: jsonSerialization['filePath'] as String,
    );
  }

  String fileName;

  String contentType;

  String filePath;

  /// Returns a shallow copy of this [PresignedUrlRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  PresignedUrlRequest copyWith({
    String? fileName,
    String? contentType,
    String? filePath,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'fileName': fileName,
      'contentType': contentType,
      'filePath': filePath,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'fileName': fileName,
      'contentType': contentType,
      'filePath': filePath,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _PresignedUrlRequestImpl extends PresignedUrlRequest {
  _PresignedUrlRequestImpl({
    required String fileName,
    required String contentType,
    required String filePath,
  }) : super._(
          fileName: fileName,
          contentType: contentType,
          filePath: filePath,
        );

  /// Returns a shallow copy of this [PresignedUrlRequest]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  PresignedUrlRequest copyWith({
    String? fileName,
    String? contentType,
    String? filePath,
  }) {
    return PresignedUrlRequest(
      fileName: fileName ?? this.fileName,
      contentType: contentType ?? this.contentType,
      filePath: filePath ?? this.filePath,
    );
  }
}
