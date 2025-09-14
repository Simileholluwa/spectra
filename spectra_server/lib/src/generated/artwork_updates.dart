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

abstract class ArtworkUpdates
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  ArtworkUpdates._({
    required this.likes,
    required this.views,
    required this.downloads,
    required this.commentsCount,
  });

  factory ArtworkUpdates({
    required int likes,
    required int views,
    required int downloads,
    required int commentsCount,
  }) = _ArtworkUpdatesImpl;

  factory ArtworkUpdates.fromJson(Map<String, dynamic> jsonSerialization) {
    return ArtworkUpdates(
      likes: jsonSerialization['likes'] as int,
      views: jsonSerialization['views'] as int,
      downloads: jsonSerialization['downloads'] as int,
      commentsCount: jsonSerialization['commentsCount'] as int,
    );
  }

  int likes;

  int views;

  int downloads;

  int commentsCount;

  /// Returns a shallow copy of this [ArtworkUpdates]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ArtworkUpdates copyWith({
    int? likes,
    int? views,
    int? downloads,
    int? commentsCount,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'likes': likes,
      'views': views,
      'downloads': downloads,
      'commentsCount': commentsCount,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'likes': likes,
      'views': views,
      'downloads': downloads,
      'commentsCount': commentsCount,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _ArtworkUpdatesImpl extends ArtworkUpdates {
  _ArtworkUpdatesImpl({
    required int likes,
    required int views,
    required int downloads,
    required int commentsCount,
  }) : super._(
          likes: likes,
          views: views,
          downloads: downloads,
          commentsCount: commentsCount,
        );

  /// Returns a shallow copy of this [ArtworkUpdates]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ArtworkUpdates copyWith({
    int? likes,
    int? views,
    int? downloads,
    int? commentsCount,
  }) {
    return ArtworkUpdates(
      likes: likes ?? this.likes,
      views: views ?? this.views,
      downloads: downloads ?? this.downloads,
      commentsCount: commentsCount ?? this.commentsCount,
    );
  }
}
