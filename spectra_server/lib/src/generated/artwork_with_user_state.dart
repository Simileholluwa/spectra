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

abstract class ArtworkWithUserState
    implements _i1.SerializableModel, _i1.ProtocolSerialization {
  ArtworkWithUserState._({
    required this.artwork,
    bool? isLiked,
    bool? isDownloaded,
  })  : isLiked = isLiked ?? false,
        isDownloaded = isDownloaded ?? false;

  factory ArtworkWithUserState({
    required _i2.Artwork artwork,
    bool? isLiked,
    bool? isDownloaded,
  }) = _ArtworkWithUserStateImpl;

  factory ArtworkWithUserState.fromJson(
      Map<String, dynamic> jsonSerialization) {
    return ArtworkWithUserState(
      artwork: _i2.Artwork.fromJson(
          (jsonSerialization['artwork'] as Map<String, dynamic>)),
      isLiked: jsonSerialization['isLiked'] as bool?,
      isDownloaded: jsonSerialization['isDownloaded'] as bool?,
    );
  }

  _i2.Artwork artwork;

  bool? isLiked;

  bool? isDownloaded;

  /// Returns a shallow copy of this [ArtworkWithUserState]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  ArtworkWithUserState copyWith({
    _i2.Artwork? artwork,
    bool? isLiked,
    bool? isDownloaded,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'artwork': artwork.toJson(),
      if (isLiked != null) 'isLiked': isLiked,
      if (isDownloaded != null) 'isDownloaded': isDownloaded,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'artwork': artwork.toJsonForProtocol(),
      if (isLiked != null) 'isLiked': isLiked,
      if (isDownloaded != null) 'isDownloaded': isDownloaded,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _ArtworkWithUserStateImpl extends ArtworkWithUserState {
  _ArtworkWithUserStateImpl({
    required _i2.Artwork artwork,
    bool? isLiked,
    bool? isDownloaded,
  }) : super._(
          artwork: artwork,
          isLiked: isLiked,
          isDownloaded: isDownloaded,
        );

  /// Returns a shallow copy of this [ArtworkWithUserState]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  ArtworkWithUserState copyWith({
    _i2.Artwork? artwork,
    Object? isLiked = _Undefined,
    Object? isDownloaded = _Undefined,
  }) {
    return ArtworkWithUserState(
      artwork: artwork ?? this.artwork.copyWith(),
      isLiked: isLiked is bool? ? isLiked : this.isLiked,
      isDownloaded: isDownloaded is bool? ? isDownloaded : this.isDownloaded,
    );
  }
}
