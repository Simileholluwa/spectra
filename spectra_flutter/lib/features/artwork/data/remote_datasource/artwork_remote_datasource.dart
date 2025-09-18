import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';

abstract class ArtworkRemoteDatasource {
  Future<ArtworkList> getArtworks({
    required int page,
    required int limit,
    required ArtworkFilter? filter,
    required String sortBy,
    required bool sortDescending,
  });
  Future<ArtworkList> getRelatedArtworks({
    required int artworkId,
    required List<String> tagNames,
    required List<String> modelNames,
    required int page,
    required int limit,
  });
  Future<void> updateDownloadsCount({
    required int artworkId,
  });
  Future<void> updateViewsCount({
    required int artworkId,
  });
  Future<void> toggleLike({
    required int artworkId,
  });
  Future<TagsList> getTags({
    required int page,
    required int limit,
    required String sortBy,
    required bool sortDescending,
    required String query,
  });
  Future<ModelsList> getModels({
    required int page,
    required int limit,
    required String sortBy,
    required bool sortDescending,
    required String query,
  });
  Future<ArtworkWithUserState> getArtwork({
    required int artworkId,
  });
  Future<ArtworkComment> addComment({
    required ArtworkComment comment,
  });
  Future<ArtworkCommentList> getComments({
    required int artworkId,
    required int? parentId,
    required int page,
    required int limit,
    required String sortBy,
    required bool sortDescending,
  });
  Future<void> likeComment({
    required int commentId,
  });
  Future<ArtworkComment> addReply({
    required ArtworkComment reply,
  });
  Future<void> deleteComment({
    required int commentId,
  });
  Future<ArtworkCommentWithUserState> getComment({
    required int commentId,
  });
}

class ArtworkRemoteDatasourceImpl implements ArtworkRemoteDatasource {
  ArtworkRemoteDatasourceImpl({
    required Client client,
  }) : _client = client;

  final Client _client;

  @override
  Future<ArtworkList> getArtworks({
    required int page,
    required int limit,
    required ArtworkFilter? filter,
    required String sortBy,
    required bool sortDescending,
  }) async {
    try {
      final response = await _client.artwork.getArtworks(
        filter,
        limit: limit,
        page: page,
        sortBy: sortBy,
        sortDescending: sortDescending,
      );
      return response;
    } on ServerSideException catch (e) {
      throw ServerException(
        message: e.message,
      );
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<ArtworkList> getRelatedArtworks({
    required int artworkId,
    required List<String> tagNames,
    required List<String> modelNames,
    required int page,
    required int limit,
  }) async {
    try {
      final response = await _client.artwork.getRelatedArtworks(
        artworkId,
        tagNames,
        modelNames,
        limit: limit,
        page: page,
      );
      return response;
    } on ServerSideException catch (e) {
      throw ServerException(
        message: e.message,
      );
    } catch (e) {
      throw ServerException(
        message: e.toString(),
      );
    }
  }

  @override
  Future<void> toggleLike({required int artworkId}) async {
    try {
      return await _client.artwork.toggleLike(artworkId);
    } on ServerSideException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> updateDownloadsCount({required int artworkId}) async {
    try {
      return await _client.artwork.updateDownloadsCount(artworkId);
    } on ServerSideException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> updateViewsCount({required int artworkId}) async {
    try {
      return await _client.artwork.updateViewsCount(artworkId);
    } on ServerSideException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<TagsList> getTags({
    required int page,
    required int limit,
    required String sortBy,
    required bool sortDescending,
    required String query,
  }) async {
    try {
      final response = await _client.artwork.getTags(
        limit: limit,
        page: page,
        sortBy: sortBy,
        sortDescending: sortDescending,
        search: query,
      );
      return response;
    } on ServerSideException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<ModelsList> getModels({
    required int page,
    required int limit,
    required String sortBy,
    required bool sortDescending,
    required String query,
  }) async {
    try {
      final response = await _client.artwork.getModels(
        limit: limit,
        page: page,
        sortBy: sortBy,
        sortDescending: sortDescending,
        search: query,
      );
      return response;
    } on ServerSideException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<ArtworkWithUserState> getArtwork({required int artworkId}) async {
    try {
      final response = await _client.artwork.getArtwork(artworkId);
      return response;
    } on ServerSideException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<ArtworkComment> addComment({required ArtworkComment comment}) async {
    try {
      final response = await _client.artwork.addComment(comment);
      return response;
    } on ServerSideException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<ArtworkCommentList> getComments({
    required int artworkId,
    required int? parentId,
    required int page,
    required int limit,
    required String sortBy,
    required bool sortDescending,
  }) async {
    try {
      final response = await _client.artwork.getComments(
        artworkId,
        parentId,
        limit: limit,
        page: page,
        sortBy: sortBy,
        sortDescending: sortDescending,
      );
      return response;
    } on ServerSideException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> likeComment({required int commentId}) async {
    try {
      return await _client.artwork.likeComment(commentId);
    } on ServerSideException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<ArtworkComment> addReply({required ArtworkComment reply}) async {
    try {
      final response = await _client.artwork.addReply(reply);
      return response;
    } on ServerSideException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> deleteComment({required int commentId}) async {
    try {
      return await _client.artwork.deleteComment(commentId);
    } on ServerSideException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<ArtworkCommentWithUserState> getComment(
      {required int commentId}) async {
    try {
      return await _client.artwork.getComment(commentId);
    } on ServerSideException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
