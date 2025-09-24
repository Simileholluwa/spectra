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
import '../endpoint/artwork_endpoint.dart' as _i2;
import '../endpoint/assets_endpoint.dart' as _i3;
import '../endpoint/auth_endpoint.dart' as _i4;
import '../endpoint/send_email_endpoint.dart' as _i5;
import '../endpoint/upload_endpoint.dart' as _i6;
import '../endpoint/user_endpoint.dart' as _i7;
import 'package:spectra_server/src/generated/filters.dart' as _i8;
import 'package:spectra_server/src/generated/artwork_comment.dart' as _i9;
import 'package:spectra_server/src/generated/artwork.dart' as _i10;
import 'package:spectra_server/src/generated/presigned_url_request.dart'
    as _i11;
import 'package:spectra_server/src/generated/user.dart' as _i12;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i13;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'artwork': _i2.ArtworkEndpoint()
        ..initialize(
          server,
          'artwork',
          null,
        ),
      'assets': _i3.AssetsEndpoint()
        ..initialize(
          server,
          'assets',
          null,
        ),
      'myAuthentication': _i4.MyAuthenticationEndpoint()
        ..initialize(
          server,
          'myAuthentication',
          null,
        ),
      'sendEmail': _i5.SendEmailEndpoint()
        ..initialize(
          server,
          'sendEmail',
          null,
        ),
      'upload': _i6.UploadEndpoint()
        ..initialize(
          server,
          'upload',
          null,
        ),
      'user': _i7.UserEndpoint()
        ..initialize(
          server,
          'user',
          null,
        ),
    };
    connectors['artwork'] = _i1.EndpointConnector(
      name: 'artwork',
      endpoint: endpoints['artwork']!,
      methodConnectors: {
        'getArtworks': _i1.MethodConnector(
          name: 'getArtworks',
          params: {
            'filter': _i1.ParameterDescription(
              name: 'filter',
              type: _i1.getType<_i8.ArtworkFilter?>(),
              nullable: true,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'page': _i1.ParameterDescription(
              name: 'page',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sortBy': _i1.ParameterDescription(
              name: 'sortBy',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'sortDescending': _i1.ParameterDescription(
              name: 'sortDescending',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artwork'] as _i2.ArtworkEndpoint).getArtworks(
            session,
            params['filter'],
            limit: params['limit'],
            page: params['page'],
            sortBy: params['sortBy'],
            sortDescending: params['sortDescending'],
          ),
        ),
        'toggleLike': _i1.MethodConnector(
          name: 'toggleLike',
          params: {
            'artworkId': _i1.ParameterDescription(
              name: 'artworkId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artwork'] as _i2.ArtworkEndpoint).toggleLike(
            session,
            params['artworkId'],
          ),
        ),
        'updateDownloadsCount': _i1.MethodConnector(
          name: 'updateDownloadsCount',
          params: {
            'artworkId': _i1.ParameterDescription(
              name: 'artworkId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artwork'] as _i2.ArtworkEndpoint)
                  .updateDownloadsCount(
            session,
            params['artworkId'],
          ),
        ),
        'updateViewsCount': _i1.MethodConnector(
          name: 'updateViewsCount',
          params: {
            'artworkId': _i1.ParameterDescription(
              name: 'artworkId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artwork'] as _i2.ArtworkEndpoint).updateViewsCount(
            session,
            params['artworkId'],
          ),
        ),
        'getTags': _i1.MethodConnector(
          name: 'getTags',
          params: {
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'page': _i1.ParameterDescription(
              name: 'page',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'search': _i1.ParameterDescription(
              name: 'search',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'sortDescending': _i1.ParameterDescription(
              name: 'sortDescending',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
            'sortBy': _i1.ParameterDescription(
              name: 'sortBy',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artwork'] as _i2.ArtworkEndpoint).getTags(
            session,
            limit: params['limit'],
            page: params['page'],
            search: params['search'],
            sortDescending: params['sortDescending'],
            sortBy: params['sortBy'],
          ),
        ),
        'getModels': _i1.MethodConnector(
          name: 'getModels',
          params: {
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'page': _i1.ParameterDescription(
              name: 'page',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'search': _i1.ParameterDescription(
              name: 'search',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'sortDescending': _i1.ParameterDescription(
              name: 'sortDescending',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
            'sortBy': _i1.ParameterDescription(
              name: 'sortBy',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artwork'] as _i2.ArtworkEndpoint).getModels(
            session,
            limit: params['limit'],
            page: params['page'],
            search: params['search'],
            sortDescending: params['sortDescending'],
            sortBy: params['sortBy'],
          ),
        ),
        'getArtwork': _i1.MethodConnector(
          name: 'getArtwork',
          params: {
            'artworkId': _i1.ParameterDescription(
              name: 'artworkId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artwork'] as _i2.ArtworkEndpoint).getArtwork(
            session,
            params['artworkId'],
          ),
        ),
        'addComment': _i1.MethodConnector(
          name: 'addComment',
          params: {
            'comment': _i1.ParameterDescription(
              name: 'comment',
              type: _i1.getType<_i9.ArtworkComment>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artwork'] as _i2.ArtworkEndpoint).addComment(
            session,
            params['comment'],
          ),
        ),
        'getRelatedArtworks': _i1.MethodConnector(
          name: 'getRelatedArtworks',
          params: {
            'artworkId': _i1.ParameterDescription(
              name: 'artworkId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'tagNames': _i1.ParameterDescription(
              name: 'tagNames',
              type: _i1.getType<List<String>>(),
              nullable: false,
            ),
            'modelNames': _i1.ParameterDescription(
              name: 'modelNames',
              type: _i1.getType<List<String>>(),
              nullable: false,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'page': _i1.ParameterDescription(
              name: 'page',
              type: _i1.getType<int>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artwork'] as _i2.ArtworkEndpoint).getRelatedArtworks(
            session,
            params['artworkId'],
            params['tagNames'],
            params['modelNames'],
            limit: params['limit'],
            page: params['page'],
          ),
        ),
        'getComments': _i1.MethodConnector(
          name: 'getComments',
          params: {
            'artworkId': _i1.ParameterDescription(
              name: 'artworkId',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'parentId': _i1.ParameterDescription(
              name: 'parentId',
              type: _i1.getType<int?>(),
              nullable: true,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'page': _i1.ParameterDescription(
              name: 'page',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sortBy': _i1.ParameterDescription(
              name: 'sortBy',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'sortDescending': _i1.ParameterDescription(
              name: 'sortDescending',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artwork'] as _i2.ArtworkEndpoint).getComments(
            session,
            params['artworkId'],
            params['parentId'],
            limit: params['limit'],
            page: params['page'],
            sortBy: params['sortBy'],
            sortDescending: params['sortDescending'],
          ),
        ),
        'getComment': _i1.MethodConnector(
          name: 'getComment',
          params: {
            'commentId': _i1.ParameterDescription(
              name: 'commentId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artwork'] as _i2.ArtworkEndpoint).getComment(
            session,
            params['commentId'],
          ),
        ),
        'likeComment': _i1.MethodConnector(
          name: 'likeComment',
          params: {
            'commentId': _i1.ParameterDescription(
              name: 'commentId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artwork'] as _i2.ArtworkEndpoint).likeComment(
            session,
            params['commentId'],
          ),
        ),
        'addReply': _i1.MethodConnector(
          name: 'addReply',
          params: {
            'reply': _i1.ParameterDescription(
              name: 'reply',
              type: _i1.getType<_i9.ArtworkComment>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artwork'] as _i2.ArtworkEndpoint).addReply(
            session,
            params['reply'],
          ),
        ),
        'deleteComment': _i1.MethodConnector(
          name: 'deleteComment',
          params: {
            'commentId': _i1.ParameterDescription(
              name: 'commentId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['artwork'] as _i2.ArtworkEndpoint).deleteComment(
            session,
            params['commentId'],
          ),
        ),
        'artworkUpdates': _i1.MethodStreamConnector(
          name: 'artworkUpdates',
          params: {
            'artworkId': _i1.ParameterDescription(
              name: 'artworkId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['artwork'] as _i2.ArtworkEndpoint).artworkUpdates(
            session,
            params['artworkId'],
          ),
        ),
        'artworkCommentUpdates': _i1.MethodStreamConnector(
          name: 'artworkCommentUpdates',
          params: {
            'commentId': _i1.ParameterDescription(
              name: 'commentId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['artwork'] as _i2.ArtworkEndpoint)
                  .artworkCommentUpdates(
            session,
            params['commentId'],
          ),
        ),
        'newArtworkCommentUpdates': _i1.MethodStreamConnector(
          name: 'newArtworkCommentUpdates',
          params: {},
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['artwork'] as _i2.ArtworkEndpoint)
                  .newArtworkCommentUpdates(session),
        ),
      },
    );
    connectors['assets'] = _i1.EndpointConnector(
      name: 'assets',
      endpoint: endpoints['assets']!,
      methodConnectors: {
        'getUploadDescription': _i1.MethodConnector(
          name: 'getUploadDescription',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['assets'] as _i3.AssetsEndpoint).getUploadDescription(
            session,
            params['path'],
          ),
        ),
        'verifyUpload': _i1.MethodConnector(
          name: 'verifyUpload',
          params: {
            'path': _i1.ParameterDescription(
              name: 'path',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['assets'] as _i3.AssetsEndpoint).verifyUpload(
            session,
            params['path'],
          ),
        ),
      },
    );
    connectors['myAuthentication'] = _i1.EndpointConnector(
      name: 'myAuthentication',
      endpoint: endpoints['myAuthentication']!,
      methodConnectors: {
        'registerUser': _i1.MethodConnector(
          name: 'registerUser',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'password': _i1.ParameterDescription(
              name: 'password',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'username': _i1.ParameterDescription(
              name: 'username',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['myAuthentication'] as _i4.MyAuthenticationEndpoint)
                  .registerUser(
            session,
            params['email'],
            params['password'],
            params['username'],
          ),
        )
      },
    );
    connectors['sendEmail'] = _i1.EndpointConnector(
      name: 'sendEmail',
      endpoint: endpoints['sendEmail']!,
      methodConnectors: {
        'sendEmail': _i1.MethodConnector(
          name: 'sendEmail',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'code': _i1.ParameterDescription(
              name: 'code',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'text': _i1.ParameterDescription(
              name: 'text',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'username': _i1.ParameterDescription(
              name: 'username',
              type: _i1.getType<String?>(),
              nullable: true,
            ),
            'isEmailVerification': _i1.ParameterDescription(
              name: 'isEmailVerification',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['sendEmail'] as _i5.SendEmailEndpoint).sendEmail(
            session,
            params['email'],
            params['code'],
            params['text'],
            params['username'],
            params['isEmailVerification'],
          ),
        )
      },
    );
    connectors['upload'] = _i1.EndpointConnector(
      name: 'upload',
      endpoint: endpoints['upload']!,
      methodConnectors: {
        'saveArt': _i1.MethodConnector(
          name: 'saveArt',
          params: {
            'artWork': _i1.ParameterDescription(
              name: 'artWork',
              type: _i1.getType<_i10.Artwork>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['upload'] as _i6.UploadEndpoint).saveArt(
            session,
            params['artWork'],
          ),
        ),
        'createUploadToken': _i1.MethodConnector(
          name: 'createUploadToken',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['upload'] as _i6.UploadEndpoint)
                  .createUploadToken(session),
        ),
        'getPresignedUrl': _i1.MethodConnector(
          name: 'getPresignedUrl',
          params: {
            'files': _i1.ParameterDescription(
              name: 'files',
              type: _i1.getType<List<_i11.PresignedUrlRequest>>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['upload'] as _i6.UploadEndpoint).getPresignedUrl(
            session,
            params['files'],
          ),
        ),
        'newArtworkUpdates': _i1.MethodStreamConnector(
          name: 'newArtworkUpdates',
          params: {},
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['upload'] as _i6.UploadEndpoint)
                  .newArtworkUpdates(session),
        ),
      },
    );
    connectors['user'] = _i1.EndpointConnector(
      name: 'user',
      endpoint: endpoints['user']!,
      methodConnectors: {
        'saveUser': _i1.MethodConnector(
          name: 'saveUser',
          params: {
            'user': _i1.ParameterDescription(
              name: 'user',
              type: _i1.getType<_i12.User>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i7.UserEndpoint).saveUser(
            session,
            params['user'],
          ),
        ),
        'getUser': _i1.MethodConnector(
          name: 'getUser',
          params: {
            'username': _i1.ParameterDescription(
              name: 'username',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i7.UserEndpoint).getUser(
            session,
            params['username'],
          ),
        ),
        'checkIfNewUser': _i1.MethodConnector(
          name: 'checkIfNewUser',
          params: {
            'email': _i1.ParameterDescription(
              name: 'email',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i7.UserEndpoint).checkIfNewUser(
            session,
            params['email'],
          ),
        ),
        'checkValidUsername': _i1.MethodConnector(
          name: 'checkValidUsername',
          params: {
            'username': _i1.ParameterDescription(
              name: 'username',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i7.UserEndpoint).checkValidUsername(
            session,
            params['username'],
          ),
        ),
        'getUserArtworks': _i1.MethodConnector(
          name: 'getUserArtworks',
          params: {
            'username': _i1.ParameterDescription(
              name: 'username',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'page': _i1.ParameterDescription(
              name: 'page',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sortBy': _i1.ParameterDescription(
              name: 'sortBy',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'sortDescending': _i1.ParameterDescription(
              name: 'sortDescending',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i7.UserEndpoint).getUserArtworks(
            session,
            params['username'],
            limit: params['limit'],
            page: params['page'],
            sortBy: params['sortBy'],
            sortDescending: params['sortDescending'],
          ),
        ),
        'getUserLikedArtworks': _i1.MethodConnector(
          name: 'getUserLikedArtworks',
          params: {
            'username': _i1.ParameterDescription(
              name: 'username',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'page': _i1.ParameterDescription(
              name: 'page',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sortDescending': _i1.ParameterDescription(
              name: 'sortDescending',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i7.UserEndpoint).getUserLikedArtworks(
            session,
            params['username'],
            limit: params['limit'],
            page: params['page'],
            sortDescending: params['sortDescending'],
          ),
        ),
        'getUserDownloadedArtworks': _i1.MethodConnector(
          name: 'getUserDownloadedArtworks',
          params: {
            'username': _i1.ParameterDescription(
              name: 'username',
              type: _i1.getType<String>(),
              nullable: false,
            ),
            'limit': _i1.ParameterDescription(
              name: 'limit',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'page': _i1.ParameterDescription(
              name: 'page',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'sortDescending': _i1.ParameterDescription(
              name: 'sortDescending',
              type: _i1.getType<bool>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i7.UserEndpoint).getUserDownloadedArtworks(
            session,
            params['username'],
            limit: params['limit'],
            page: params['page'],
            sortDescending: params['sortDescending'],
          ),
        ),
        'toggleFollow': _i1.MethodConnector(
          name: 'toggleFollow',
          params: {
            'username': _i1.ParameterDescription(
              name: 'username',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['user'] as _i7.UserEndpoint).toggleFollow(
            session,
            params['username'],
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i13.Endpoints()..initializeEndpoints(server);
  }
}
