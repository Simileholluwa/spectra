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
import 'user.dart' as _i2;

abstract class Follower implements _i1.SerializableModel {
  Follower._({
    this.id,
    required this.followerId,
    this.follower,
    required this.followingId,
    this.following,
    DateTime? followedAt,
  }) : followedAt = followedAt ?? DateTime.now();

  factory Follower({
    int? id,
    required int followerId,
    _i2.User? follower,
    required int followingId,
    _i2.User? following,
    DateTime? followedAt,
  }) = _FollowerImpl;

  factory Follower.fromJson(Map<String, dynamic> jsonSerialization) {
    return Follower(
      id: jsonSerialization['id'] as int?,
      followerId: jsonSerialization['followerId'] as int,
      follower: jsonSerialization['follower'] == null
          ? null
          : _i2.User.fromJson(
              (jsonSerialization['follower'] as Map<String, dynamic>)),
      followingId: jsonSerialization['followingId'] as int,
      following: jsonSerialization['following'] == null
          ? null
          : _i2.User.fromJson(
              (jsonSerialization['following'] as Map<String, dynamic>)),
      followedAt: jsonSerialization['followedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['followedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int followerId;

  _i2.User? follower;

  int followingId;

  _i2.User? following;

  DateTime? followedAt;

  /// Returns a shallow copy of this [Follower]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  Follower copyWith({
    int? id,
    int? followerId,
    _i2.User? follower,
    int? followingId,
    _i2.User? following,
    DateTime? followedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'followerId': followerId,
      if (follower != null) 'follower': follower?.toJson(),
      'followingId': followingId,
      if (following != null) 'following': following?.toJson(),
      if (followedAt != null) 'followedAt': followedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _FollowerImpl extends Follower {
  _FollowerImpl({
    int? id,
    required int followerId,
    _i2.User? follower,
    required int followingId,
    _i2.User? following,
    DateTime? followedAt,
  }) : super._(
          id: id,
          followerId: followerId,
          follower: follower,
          followingId: followingId,
          following: following,
          followedAt: followedAt,
        );

  /// Returns a shallow copy of this [Follower]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  Follower copyWith({
    Object? id = _Undefined,
    int? followerId,
    Object? follower = _Undefined,
    int? followingId,
    Object? following = _Undefined,
    Object? followedAt = _Undefined,
  }) {
    return Follower(
      id: id is int? ? id : this.id,
      followerId: followerId ?? this.followerId,
      follower: follower is _i2.User? ? follower : this.follower?.copyWith(),
      followingId: followingId ?? this.followingId,
      following:
          following is _i2.User? ? following : this.following?.copyWith(),
      followedAt: followedAt is DateTime? ? followedAt : this.followedAt,
    );
  }
}
