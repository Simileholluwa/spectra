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

abstract class ArtworkCommentUpdates
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  ArtworkCommentUpdates._({
    required this.likes,
    required this.repliesCount,
  });

  factory ArtworkCommentUpdates({
    required int likes,
    required int repliesCount,
  }) = _ArtworkCommentUpdatesImpl;

  factory ArtworkCommentUpdates.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return ArtworkCommentUpdates(
      likes: jsonSerialization['likes'] as int,
      repliesCount: jsonSerialization['repliesCount'] as int,
    );
  }

  int likes;

  int repliesCount;

  /// Returns a shallow copy of this [ArtworkCommentUpdates]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ArtworkCommentUpdates copyWith({
    int? likes,
    int? repliesCount,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'likes': likes,
      'repliesCount': repliesCount,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'likes': likes,
      'repliesCount': repliesCount,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _ArtworkCommentUpdatesImpl extends ArtworkCommentUpdates {
  _ArtworkCommentUpdatesImpl({
    required int likes,
    required int repliesCount,
  }) : super._(
          likes: likes,
          repliesCount: repliesCount,
        );

  /// Returns a shallow copy of this [ArtworkCommentUpdates]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ArtworkCommentUpdates copyWith({
    int? likes,
    int? repliesCount,
  }) {
    return ArtworkCommentUpdates(
      likes: likes ?? this.likes,
      repliesCount: repliesCount ?? this.repliesCount,
    );
  }
}
