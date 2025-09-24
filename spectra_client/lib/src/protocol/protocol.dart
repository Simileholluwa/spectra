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
import 'artwork.dart' as _i2;
import 'artwork_comment.dart' as _i3;
import 'artwork_comment_likes.dart' as _i4;
import 'artwork_comment_list.dart' as _i5;
import 'artwork_comment_updates.dart' as _i6;
import 'artwork_comment_with_user_state.dart' as _i7;
import 'artwork_data.dart' as _i8;
import 'artwork_downloads.dart' as _i9;
import 'artwork_list.dart' as _i10;
import 'artwork_models.dart' as _i11;
import 'artwork_tags.dart' as _i12;
import 'artwork_updates.dart' as _i13;
import 'artwork_views.dart' as _i14;
import 'artwork_with_user_state.dart' as _i15;
import 'atwork_likes.dart' as _i16;
import 'comment_type.dart' as _i17;
import 'exception.dart' as _i18;
import 'filters.dart' as _i19;
import 'follower.dart' as _i20;
import 'media_type.dart' as _i21;
import 'model.dart' as _i22;
import 'models_list.dart' as _i23;
import 'presigned_url_request.dart' as _i24;
import 'presigned_url_response.dart' as _i25;
import 'search_vector_response.dart' as _i26;
import 'tag.dart' as _i27;
import 'tags_list.dart' as _i28;
import 'user.dart' as _i29;
import 'user_with_state.dart' as _i30;
import 'package:spectra_client/src/protocol/presigned_url_response.dart'
    as _i31;
import 'package:spectra_client/src/protocol/presigned_url_request.dart' as _i32;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i33;
export 'artwork.dart';
export 'artwork_comment.dart';
export 'artwork_comment_likes.dart';
export 'artwork_comment_list.dart';
export 'artwork_comment_updates.dart';
export 'artwork_comment_with_user_state.dart';
export 'artwork_data.dart';
export 'artwork_downloads.dart';
export 'artwork_list.dart';
export 'artwork_models.dart';
export 'artwork_tags.dart';
export 'artwork_updates.dart';
export 'artwork_views.dart';
export 'artwork_with_user_state.dart';
export 'atwork_likes.dart';
export 'comment_type.dart';
export 'exception.dart';
export 'filters.dart';
export 'follower.dart';
export 'media_type.dart';
export 'model.dart';
export 'models_list.dart';
export 'presigned_url_request.dart';
export 'presigned_url_response.dart';
export 'search_vector_response.dart';
export 'tag.dart';
export 'tags_list.dart';
export 'user.dart';
export 'user_with_state.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.Artwork) {
      return _i2.Artwork.fromJson(data) as T;
    }
    if (t == _i3.ArtworkComment) {
      return _i3.ArtworkComment.fromJson(data) as T;
    }
    if (t == _i4.ArtworkCommentLikes) {
      return _i4.ArtworkCommentLikes.fromJson(data) as T;
    }
    if (t == _i5.ArtworkCommentList) {
      return _i5.ArtworkCommentList.fromJson(data) as T;
    }
    if (t == _i6.ArtworkCommentUpdates) {
      return _i6.ArtworkCommentUpdates.fromJson(data) as T;
    }
    if (t == _i7.ArtworkCommentWithUserState) {
      return _i7.ArtworkCommentWithUserState.fromJson(data) as T;
    }
    if (t == _i8.ArtworkData) {
      return _i8.ArtworkData.fromJson(data) as T;
    }
    if (t == _i9.ArtworkDownloads) {
      return _i9.ArtworkDownloads.fromJson(data) as T;
    }
    if (t == _i10.ArtworkList) {
      return _i10.ArtworkList.fromJson(data) as T;
    }
    if (t == _i11.ArtworkModels) {
      return _i11.ArtworkModels.fromJson(data) as T;
    }
    if (t == _i12.ArtworkTags) {
      return _i12.ArtworkTags.fromJson(data) as T;
    }
    if (t == _i13.ArtworkUpdates) {
      return _i13.ArtworkUpdates.fromJson(data) as T;
    }
    if (t == _i14.ArtworkViews) {
      return _i14.ArtworkViews.fromJson(data) as T;
    }
    if (t == _i15.ArtworkWithUserState) {
      return _i15.ArtworkWithUserState.fromJson(data) as T;
    }
    if (t == _i16.ArtworkLikes) {
      return _i16.ArtworkLikes.fromJson(data) as T;
    }
    if (t == _i17.CommentType) {
      return _i17.CommentType.fromJson(data) as T;
    }
    if (t == _i18.ServerSideException) {
      return _i18.ServerSideException.fromJson(data) as T;
    }
    if (t == _i19.ArtworkFilter) {
      return _i19.ArtworkFilter.fromJson(data) as T;
    }
    if (t == _i20.Follower) {
      return _i20.Follower.fromJson(data) as T;
    }
    if (t == _i21.MediaType) {
      return _i21.MediaType.fromJson(data) as T;
    }
    if (t == _i22.Model) {
      return _i22.Model.fromJson(data) as T;
    }
    if (t == _i23.ModelsList) {
      return _i23.ModelsList.fromJson(data) as T;
    }
    if (t == _i24.PresignedUrlRequest) {
      return _i24.PresignedUrlRequest.fromJson(data) as T;
    }
    if (t == _i25.PresignedUrlResponse) {
      return _i25.PresignedUrlResponse.fromJson(data) as T;
    }
    if (t == _i26.SearchVectorResponse) {
      return _i26.SearchVectorResponse.fromJson(data) as T;
    }
    if (t == _i27.Tag) {
      return _i27.Tag.fromJson(data) as T;
    }
    if (t == _i28.TagsList) {
      return _i28.TagsList.fromJson(data) as T;
    }
    if (t == _i29.User) {
      return _i29.User.fromJson(data) as T;
    }
    if (t == _i30.UserWithState) {
      return _i30.UserWithState.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Artwork?>()) {
      return (data != null ? _i2.Artwork.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.ArtworkComment?>()) {
      return (data != null ? _i3.ArtworkComment.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.ArtworkCommentLikes?>()) {
      return (data != null ? _i4.ArtworkCommentLikes.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i5.ArtworkCommentList?>()) {
      return (data != null ? _i5.ArtworkCommentList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.ArtworkCommentUpdates?>()) {
      return (data != null ? _i6.ArtworkCommentUpdates.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i7.ArtworkCommentWithUserState?>()) {
      return (data != null
          ? _i7.ArtworkCommentWithUserState.fromJson(data)
          : null) as T;
    }
    if (t == _i1.getType<_i8.ArtworkData?>()) {
      return (data != null ? _i8.ArtworkData.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.ArtworkDownloads?>()) {
      return (data != null ? _i9.ArtworkDownloads.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.ArtworkList?>()) {
      return (data != null ? _i10.ArtworkList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.ArtworkModels?>()) {
      return (data != null ? _i11.ArtworkModels.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.ArtworkTags?>()) {
      return (data != null ? _i12.ArtworkTags.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.ArtworkUpdates?>()) {
      return (data != null ? _i13.ArtworkUpdates.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.ArtworkViews?>()) {
      return (data != null ? _i14.ArtworkViews.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.ArtworkWithUserState?>()) {
      return (data != null ? _i15.ArtworkWithUserState.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i16.ArtworkLikes?>()) {
      return (data != null ? _i16.ArtworkLikes.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.CommentType?>()) {
      return (data != null ? _i17.CommentType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.ServerSideException?>()) {
      return (data != null ? _i18.ServerSideException.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i19.ArtworkFilter?>()) {
      return (data != null ? _i19.ArtworkFilter.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i20.Follower?>()) {
      return (data != null ? _i20.Follower.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i21.MediaType?>()) {
      return (data != null ? _i21.MediaType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i22.Model?>()) {
      return (data != null ? _i22.Model.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i23.ModelsList?>()) {
      return (data != null ? _i23.ModelsList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i24.PresignedUrlRequest?>()) {
      return (data != null ? _i24.PresignedUrlRequest.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i25.PresignedUrlResponse?>()) {
      return (data != null ? _i25.PresignedUrlResponse.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i26.SearchVectorResponse?>()) {
      return (data != null ? _i26.SearchVectorResponse.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i27.Tag?>()) {
      return (data != null ? _i27.Tag.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i28.TagsList?>()) {
      return (data != null ? _i28.TagsList.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i29.User?>()) {
      return (data != null ? _i29.User.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i30.UserWithState?>()) {
      return (data != null ? _i30.UserWithState.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i12.ArtworkTags>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i12.ArtworkTags>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i11.ArtworkModels>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i11.ArtworkModels>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i29.User>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i29.User>(e)).toList()
          : null) as T;
    }
    if (t == List<_i7.ArtworkCommentWithUserState>) {
      return (data as List)
          .map((e) => deserialize<_i7.ArtworkCommentWithUserState>(e))
          .toList() as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i24.PresignedUrlRequest>) {
      return (data as List)
          .map((e) => deserialize<_i24.PresignedUrlRequest>(e))
          .toList() as T;
    }
    if (t == _i1.getType<List<_i25.PresignedUrlResponse>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i25.PresignedUrlResponse>(e))
              .toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i25.PresignedUrlResponse>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i25.PresignedUrlResponse>(e))
              .toList()
          : null) as T;
    }
    if (t == List<_i15.ArtworkWithUserState>) {
      return (data as List)
          .map((e) => deserialize<_i15.ArtworkWithUserState>(e))
          .toList() as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<_i11.ArtworkModels>?>()) {
      return (data != null
          ? (data as List)
              .map((e) => deserialize<_i11.ArtworkModels>(e))
              .toList()
          : null) as T;
    }
    if (t == List<_i22.Model>) {
      return (data as List).map((e) => deserialize<_i22.Model>(e)).toList()
          as T;
    }
    if (t == _i1.getType<List<_i12.ArtworkTags>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i12.ArtworkTags>(e)).toList()
          : null) as T;
    }
    if (t == List<_i27.Tag>) {
      return (data as List).map((e) => deserialize<_i27.Tag>(e)).toList() as T;
    }
    if (t == _i1.getType<List<String>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<String>(e)).toList()
          : null) as T;
    }
    if (t == _i1.getType<List<int>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<int>(e)).toList()
          : null) as T;
    }
    if (t == List<String>) {
      return (data as List).map((e) => deserialize<String>(e)).toList() as T;
    }
    if (t == List<_i31.PresignedUrlResponse>) {
      return (data as List)
          .map((e) => deserialize<_i31.PresignedUrlResponse>(e))
          .toList() as T;
    }
    if (t == List<_i32.PresignedUrlRequest>) {
      return (data as List)
          .map((e) => deserialize<_i32.PresignedUrlRequest>(e))
          .toList() as T;
    }
    try {
      return _i33.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.Artwork) {
      return 'Artwork';
    }
    if (data is _i3.ArtworkComment) {
      return 'ArtworkComment';
    }
    if (data is _i4.ArtworkCommentLikes) {
      return 'ArtworkCommentLikes';
    }
    if (data is _i5.ArtworkCommentList) {
      return 'ArtworkCommentList';
    }
    if (data is _i6.ArtworkCommentUpdates) {
      return 'ArtworkCommentUpdates';
    }
    if (data is _i7.ArtworkCommentWithUserState) {
      return 'ArtworkCommentWithUserState';
    }
    if (data is _i8.ArtworkData) {
      return 'ArtworkData';
    }
    if (data is _i9.ArtworkDownloads) {
      return 'ArtworkDownloads';
    }
    if (data is _i10.ArtworkList) {
      return 'ArtworkList';
    }
    if (data is _i11.ArtworkModels) {
      return 'ArtworkModels';
    }
    if (data is _i12.ArtworkTags) {
      return 'ArtworkTags';
    }
    if (data is _i13.ArtworkUpdates) {
      return 'ArtworkUpdates';
    }
    if (data is _i14.ArtworkViews) {
      return 'ArtworkViews';
    }
    if (data is _i15.ArtworkWithUserState) {
      return 'ArtworkWithUserState';
    }
    if (data is _i16.ArtworkLikes) {
      return 'ArtworkLikes';
    }
    if (data is _i17.CommentType) {
      return 'CommentType';
    }
    if (data is _i18.ServerSideException) {
      return 'ServerSideException';
    }
    if (data is _i19.ArtworkFilter) {
      return 'ArtworkFilter';
    }
    if (data is _i20.Follower) {
      return 'Follower';
    }
    if (data is _i21.MediaType) {
      return 'MediaType';
    }
    if (data is _i22.Model) {
      return 'Model';
    }
    if (data is _i23.ModelsList) {
      return 'ModelsList';
    }
    if (data is _i24.PresignedUrlRequest) {
      return 'PresignedUrlRequest';
    }
    if (data is _i25.PresignedUrlResponse) {
      return 'PresignedUrlResponse';
    }
    if (data is _i26.SearchVectorResponse) {
      return 'SearchVectorResponse';
    }
    if (data is _i27.Tag) {
      return 'Tag';
    }
    if (data is _i28.TagsList) {
      return 'TagsList';
    }
    if (data is _i29.User) {
      return 'User';
    }
    if (data is _i30.UserWithState) {
      return 'UserWithState';
    }
    className = _i33.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Artwork') {
      return deserialize<_i2.Artwork>(data['data']);
    }
    if (dataClassName == 'ArtworkComment') {
      return deserialize<_i3.ArtworkComment>(data['data']);
    }
    if (dataClassName == 'ArtworkCommentLikes') {
      return deserialize<_i4.ArtworkCommentLikes>(data['data']);
    }
    if (dataClassName == 'ArtworkCommentList') {
      return deserialize<_i5.ArtworkCommentList>(data['data']);
    }
    if (dataClassName == 'ArtworkCommentUpdates') {
      return deserialize<_i6.ArtworkCommentUpdates>(data['data']);
    }
    if (dataClassName == 'ArtworkCommentWithUserState') {
      return deserialize<_i7.ArtworkCommentWithUserState>(data['data']);
    }
    if (dataClassName == 'ArtworkData') {
      return deserialize<_i8.ArtworkData>(data['data']);
    }
    if (dataClassName == 'ArtworkDownloads') {
      return deserialize<_i9.ArtworkDownloads>(data['data']);
    }
    if (dataClassName == 'ArtworkList') {
      return deserialize<_i10.ArtworkList>(data['data']);
    }
    if (dataClassName == 'ArtworkModels') {
      return deserialize<_i11.ArtworkModels>(data['data']);
    }
    if (dataClassName == 'ArtworkTags') {
      return deserialize<_i12.ArtworkTags>(data['data']);
    }
    if (dataClassName == 'ArtworkUpdates') {
      return deserialize<_i13.ArtworkUpdates>(data['data']);
    }
    if (dataClassName == 'ArtworkViews') {
      return deserialize<_i14.ArtworkViews>(data['data']);
    }
    if (dataClassName == 'ArtworkWithUserState') {
      return deserialize<_i15.ArtworkWithUserState>(data['data']);
    }
    if (dataClassName == 'ArtworkLikes') {
      return deserialize<_i16.ArtworkLikes>(data['data']);
    }
    if (dataClassName == 'CommentType') {
      return deserialize<_i17.CommentType>(data['data']);
    }
    if (dataClassName == 'ServerSideException') {
      return deserialize<_i18.ServerSideException>(data['data']);
    }
    if (dataClassName == 'ArtworkFilter') {
      return deserialize<_i19.ArtworkFilter>(data['data']);
    }
    if (dataClassName == 'Follower') {
      return deserialize<_i20.Follower>(data['data']);
    }
    if (dataClassName == 'MediaType') {
      return deserialize<_i21.MediaType>(data['data']);
    }
    if (dataClassName == 'Model') {
      return deserialize<_i22.Model>(data['data']);
    }
    if (dataClassName == 'ModelsList') {
      return deserialize<_i23.ModelsList>(data['data']);
    }
    if (dataClassName == 'PresignedUrlRequest') {
      return deserialize<_i24.PresignedUrlRequest>(data['data']);
    }
    if (dataClassName == 'PresignedUrlResponse') {
      return deserialize<_i25.PresignedUrlResponse>(data['data']);
    }
    if (dataClassName == 'SearchVectorResponse') {
      return deserialize<_i26.SearchVectorResponse>(data['data']);
    }
    if (dataClassName == 'Tag') {
      return deserialize<_i27.Tag>(data['data']);
    }
    if (dataClassName == 'TagsList') {
      return deserialize<_i28.TagsList>(data['data']);
    }
    if (dataClassName == 'User') {
      return deserialize<_i29.User>(data['data']);
    }
    if (dataClassName == 'UserWithState') {
      return deserialize<_i30.UserWithState>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i33.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
