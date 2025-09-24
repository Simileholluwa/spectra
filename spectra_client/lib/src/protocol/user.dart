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
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i2;

abstract class User implements _i1.SerializableModel {
  User._({
    this.id,
    required this.userId,
    this.user,
    this.email,
    this.username,
    String? bio,
    this.profileImageUrl,
    this.website,
    this.location,
    int? followersCount,
    int? followingCount,
    int? artworksCount,
    int? likesCount,
    this.interests,
    this.likedArtworks,
    DateTime? createdAt,
    this.updatedAt,
  })  : bio = bio ?? 'Hello there, welcome to my profile!',
        followersCount = followersCount ?? 0,
        followingCount = followingCount ?? 0,
        artworksCount = artworksCount ?? 0,
        likesCount = likesCount ?? 0,
        createdAt = createdAt ?? DateTime.now();

  factory User({
    int? id,
    required int userId,
    _i2.UserInfo? user,
    String? email,
    String? username,
    String? bio,
    String? profileImageUrl,
    String? website,
    String? location,
    int? followersCount,
    int? followingCount,
    int? artworksCount,
    int? likesCount,
    List<String>? interests,
    List<int>? likedArtworks,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _UserImpl;

  factory User.fromJson(Map<String, dynamic> jsonSerialization) {
    return User(
      id: jsonSerialization['id'] as int?,
      userId: jsonSerialization['userId'] as int,
      user: jsonSerialization['user'] == null
          ? null
          : _i2.UserInfo.fromJson(
              (jsonSerialization['user'] as Map<String, dynamic>)),
      email: jsonSerialization['email'] as String?,
      username: jsonSerialization['username'] as String?,
      bio: jsonSerialization['bio'] as String?,
      profileImageUrl: jsonSerialization['profileImageUrl'] as String?,
      website: jsonSerialization['website'] as String?,
      location: jsonSerialization['location'] as String?,
      followersCount: jsonSerialization['followersCount'] as int?,
      followingCount: jsonSerialization['followingCount'] as int?,
      artworksCount: jsonSerialization['artworksCount'] as int?,
      likesCount: jsonSerialization['likesCount'] as int?,
      interests: (jsonSerialization['interests'] as List?)
          ?.map((e) => e as String)
          .toList(),
      likedArtworks: (jsonSerialization['likedArtworks'] as List?)
          ?.map((e) => e as int)
          .toList(),
      createdAt: jsonSerialization['createdAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['createdAt']),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _i1.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  _i2.UserInfo? user;

  String? email;

  String? username;

  String? bio;

  String? profileImageUrl;

  String? website;

  String? location;

  int? followersCount;

  int? followingCount;

  int? artworksCount;

  int? likesCount;

  List<String>? interests;

  List<int>? likedArtworks;

  DateTime? createdAt;

  DateTime? updatedAt;

  /// Returns a shallow copy of this [User]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  User copyWith({
    int? id,
    int? userId,
    _i2.UserInfo? user,
    String? email,
    String? username,
    String? bio,
    String? profileImageUrl,
    String? website,
    String? location,
    int? followersCount,
    int? followingCount,
    int? artworksCount,
    int? likesCount,
    List<String>? interests,
    List<int>? likedArtworks,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userId': userId,
      if (user != null) 'user': user?.toJson(),
      if (email != null) 'email': email,
      if (username != null) 'username': username,
      if (bio != null) 'bio': bio,
      if (profileImageUrl != null) 'profileImageUrl': profileImageUrl,
      if (website != null) 'website': website,
      if (location != null) 'location': location,
      if (followersCount != null) 'followersCount': followersCount,
      if (followingCount != null) 'followingCount': followingCount,
      if (artworksCount != null) 'artworksCount': artworksCount,
      if (likesCount != null) 'likesCount': likesCount,
      if (interests != null) 'interests': interests?.toJson(),
      if (likedArtworks != null) 'likedArtworks': likedArtworks?.toJson(),
      if (createdAt != null) 'createdAt': createdAt?.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _UserImpl extends User {
  _UserImpl({
    int? id,
    required int userId,
    _i2.UserInfo? user,
    String? email,
    String? username,
    String? bio,
    String? profileImageUrl,
    String? website,
    String? location,
    int? followersCount,
    int? followingCount,
    int? artworksCount,
    int? likesCount,
    List<String>? interests,
    List<int>? likedArtworks,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super._(
          id: id,
          userId: userId,
          user: user,
          email: email,
          username: username,
          bio: bio,
          profileImageUrl: profileImageUrl,
          website: website,
          location: location,
          followersCount: followersCount,
          followingCount: followingCount,
          artworksCount: artworksCount,
          likesCount: likesCount,
          interests: interests,
          likedArtworks: likedArtworks,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  /// Returns a shallow copy of this [User]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  User copyWith({
    Object? id = _Undefined,
    int? userId,
    Object? user = _Undefined,
    Object? email = _Undefined,
    Object? username = _Undefined,
    Object? bio = _Undefined,
    Object? profileImageUrl = _Undefined,
    Object? website = _Undefined,
    Object? location = _Undefined,
    Object? followersCount = _Undefined,
    Object? followingCount = _Undefined,
    Object? artworksCount = _Undefined,
    Object? likesCount = _Undefined,
    Object? interests = _Undefined,
    Object? likedArtworks = _Undefined,
    Object? createdAt = _Undefined,
    Object? updatedAt = _Undefined,
  }) {
    return User(
      id: id is int? ? id : this.id,
      userId: userId ?? this.userId,
      user: user is _i2.UserInfo? ? user : this.user?.copyWith(),
      email: email is String? ? email : this.email,
      username: username is String? ? username : this.username,
      bio: bio is String? ? bio : this.bio,
      profileImageUrl:
          profileImageUrl is String? ? profileImageUrl : this.profileImageUrl,
      website: website is String? ? website : this.website,
      location: location is String? ? location : this.location,
      followersCount:
          followersCount is int? ? followersCount : this.followersCount,
      followingCount:
          followingCount is int? ? followingCount : this.followingCount,
      artworksCount: artworksCount is int? ? artworksCount : this.artworksCount,
      likesCount: likesCount is int? ? likesCount : this.likesCount,
      interests: interests is List<String>?
          ? interests
          : this.interests?.map((e0) => e0).toList(),
      likedArtworks: likedArtworks is List<int>?
          ? likedArtworks
          : this.likedArtworks?.map((e0) => e0).toList(),
      createdAt: createdAt is DateTime? ? createdAt : this.createdAt,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
    );
  }
}
