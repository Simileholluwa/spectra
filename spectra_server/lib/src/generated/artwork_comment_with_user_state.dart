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
import 'artwork_comment.dart' as _i2;

abstract class ArtworkCommentWithUserState
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  ArtworkCommentWithUserState._({
    required this.comment,
    bool? isLiked,
  }) : isLiked = isLiked ?? false;

  factory ArtworkCommentWithUserState({
    required _i2.ArtworkComment comment,
    bool? isLiked,
  }) = _ArtworkCommentWithUserStateImpl;

  factory ArtworkCommentWithUserState.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return ArtworkCommentWithUserState(
      comment: _i2.ArtworkComment.fromJson(
          (jsonSerialization['comment'] as Map<String, dynamic>)),
      isLiked: jsonSerialization['isLiked'] as bool?,
    );
  }

  _i2.ArtworkComment comment;

  bool? isLiked;

  /// Returns a shallow copy of this [ArtworkCommentWithUserState]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ArtworkCommentWithUserState copyWith({
    _i2.ArtworkComment? comment,
    bool? isLiked,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'comment': comment.toJson(),
      if (isLiked != null) 'isLiked': isLiked,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'comment': comment.toJsonForProtocol(),
      if (isLiked != null) 'isLiked': isLiked,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ArtworkCommentWithUserStateImpl extends ArtworkCommentWithUserState {
  _ArtworkCommentWithUserStateImpl({
    required _i2.ArtworkComment comment,
    bool? isLiked,
  }) : super._(
          comment: comment,
          isLiked: isLiked,
        );

  /// Returns a shallow copy of this [ArtworkCommentWithUserState]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ArtworkCommentWithUserState copyWith({
    _i2.ArtworkComment? comment,
    Object? isLiked = _Undefined,
  }) {
    return ArtworkCommentWithUserState(
      comment: comment ?? this.comment.copyWith(),
      isLiked: isLiked is bool? ? isLiked : this.isLiked,
    );
  }
}
