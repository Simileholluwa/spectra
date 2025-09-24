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

abstract class UserWithState implements _i1.SerializableModel {
  UserWithState._({
    required this.user,
    required this.isFollowing,
  });

  factory UserWithState({
    required _i2.User user,
    required bool isFollowing,
  }) = _UserWithStateImpl;

  factory UserWithState.fromJson(Map<String, dynamic> jsonSerialization) {
    return UserWithState(
      user: _i2.User.fromJson(
          (jsonSerialization['user'] as Map<String, dynamic>)),
      isFollowing: jsonSerialization['isFollowing'] as bool,
    );
  }

  _i2.User user;

  bool isFollowing;

  /// Returns a shallow copy of this [UserWithState]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  UserWithState copyWith({
    _i2.User? user,
    bool? isFollowing,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'isFollowing': isFollowing,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _UserWithStateImpl extends UserWithState {
  _UserWithStateImpl({
    required _i2.User user,
    required bool isFollowing,
  }) : super._(
          user: user,
          isFollowing: isFollowing,
        );

  /// Returns a shallow copy of this [UserWithState]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  UserWithState copyWith({
    _i2.User? user,
    bool? isFollowing,
  }) {
    return UserWithState(
      user: user ?? this.user.copyWith(),
      isFollowing: isFollowing ?? this.isFollowing,
    );
  }
}
