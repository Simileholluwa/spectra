import 'dart:async';

import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';
import 'package:spectra_server/src/generated/protocol.dart';

class ArtworkEndpoint extends Endpoint {
  Future<ArtworkList> getArtworks(
    Session session,
    ArtworkFilter? filter, {
    int limit = 50,
    int page = 1,
    String sortBy = 'createdAt',
    bool sortDescending = true,
  }) async {
    whereClause(ArtworkTable row) {
      var clause = row.mediaType.notEquals(null);
      if (filter != null) {
        if (filter.tag != null && filter.tag!.isNotEmpty) {
          clause &= row.tags.any(
            (p0) => p0.tag.name.inSet(
              filter.tag!.toSet(),
            ),
          );
        }
        if (filter.model != null && filter.model!.isNotEmpty) {
          clause &= row.models.any(
            (p0) => p0.model.name.inSet(
              filter.model!.toSet(),
            ),
          );
        }
        if (filter.mediaType != null) {
          clause &= row.mediaType.equals(
            filter.mediaType,
          );
        }
        if (filter.hasPrompt != null) {
          clause &= row.showPrompt.equals(
            filter.hasPrompt,
          );
        }
        if (filter.canDownload != null) {
          clause &= row.allowDownload.equals(
            filter.canDownload,
          );
        }
        if (filter.startDate != null || filter.endDate != null) {
          clause &= row.createdAt.between(
            filter.startDate ?? DateTime(2024),
            filter.endDate ?? DateTime.now(),
          );
        }
      }
      return clause;
    }

    final count = await Artwork.db.count(
      session,
      where: (row) => whereClause(row),
    );

    final results = await Artwork.db.find(
      session,
      limit: limit,
      offset: (page - 1) * limit,
      include: Artwork.include(
        user: User.include(
          user: UserInfo.include(),
        ),
        tags: ArtworkTags.includeList(
          include: ArtworkTags.include(
            tag: Tag.include(),
          ),
        ),
      ),
      where: (row) => whereClause(row),
      orderBy: (row) {
        switch (sortBy) {
          case 'likes':
            return row.likes;
          case 'views':
            return row.views;
          case 'downloads':
            return row.downloads;
          case 'createdAt':
          default:
            return row.createdAt;
        }
      },
      orderDescending: sortDescending,
    );

    final user = await session.authenticated;
    final userId = user?.userId;
    Set<int> likedIds = {};
    Set<int> downloadedIds = {};

    if (userId != null && results.isNotEmpty) {
      final artworkIds = results.map((a) => a.id!).toList();
      final userLikes = await ArtworkLikes.db.find(
        session,
        where: (t) =>
            t.likedById.equals(userId) &
            t.artworkId.inSet(
              artworkIds.toSet(),
            ),
      );

      final userDownloads = await ArtworkDownloads.db.find(
        session,
        where: (t) =>
            t.downloadedById.equals(userId) &
            t.artworkId.inSet(
              artworkIds.toSet(),
            ),
      );

      likedIds = userLikes.map((l) => l.artworkId).toSet();
      downloadedIds = userDownloads.map((d) => d.artworkId).toSet();
    }

    final enrichedResults = results.map((a) {
      return ArtworkWithUserState(
        artwork: a,
        isLiked: likedIds.contains(a.id),
        isDownloaded: downloadedIds.contains(a.id),
      );
    }).toList();

    return ArtworkList(
      results: enrichedResults,
      limit: limit,
      count: count,
      page: page,
      numPages: (count / limit).ceil(),
      canLoadMore: page * limit < count,
    );
  }

  Future<void> toggleLike(Session session, int artworkId) async {
    return session.db.transaction((transaction) async {
      try {
        final user = await authUser(session);
        final artwork = await Artwork.db.findById(session, artworkId);
        if (artwork == null) {
          throw ServerSideException(
            message: 'Artwork not found',
          );
        }
        final isLiked = await ArtworkLikes.db.findFirstRow(
          session,
          where: (row) =>
              row.artworkId.equals(artworkId) &
              row.likedById.equals(
                user.userId,
              ),
          include: ArtworkLikes.include(
            artwork: Artwork.include(),
          ),
        );
        if (isLiked != null) {
          await ArtworkLikes.db.deleteRow(session, isLiked);
          await updateArtwork(
            session,
            artwork.copyWith(likes: artwork.likes! - 1),
          );
        } else {
          await ArtworkLikes.db.insertRow(
            session,
            ArtworkLikes(artworkId: artworkId, likedById: user.userId),
          );
          await updateArtwork(
            session,
            artwork.copyWith(likes: artwork.likes! + 1),
          );
        }
      } catch (e) {
        session.log(
          'Error in liking artwork: $e',
          level: LogLevel.error,
        );
        throw ServerSideException(message: e.toString());
      }
    });
  }

  Future<void> updateDownloadsCount(Session session, int artworkId) {
    return session.db.transaction((transaction) async {
      try {
        final artwork = await Artwork.db.findById(session, artworkId);
        if (artwork == null) return;
        final user = await authUser(session);
        final isDownloaded = await ArtworkDownloads.db.findFirstRow(
          session,
          where: (row) =>
              row.artworkId.equals(artworkId) &
              row.downloadedById.equals(
                user.userId,
              ),
        );
        if (isDownloaded != null) return;
        await ArtworkDownloads.db.insertRow(
          session,
          ArtworkDownloads(
            artworkId: artworkId,
            downloadedById: user.userId,
          ),
        );
        await updateArtwork(
          session,
          artwork.copyWith(downloads: artwork.downloads! + 1),
        );
      } catch (e) {
        session.log(
          'Error in updating downloads count: $e',
          level: LogLevel.error,
        );
        throw ServerSideException(message: e.toString());
      }
    });
  }

  Future<void> updateViewsCount(Session session, int artworkId) {
    return session.db.transaction((transaction) async {
      try {
        final artwork = await Artwork.db.findById(session, artworkId);
        if (artwork == null) return;
        final user = await authUser(session);
        final isViewed = await ArtworkViews.db.findFirstRow(
          session,
          where: (row) =>
              row.artworkId.equals(artworkId) &
              row.viewedById.equals(
                user.userId,
              ),
        );
        if (isViewed != null) return;
        await ArtworkViews.db.insertRow(
          session,
          ArtworkViews(
            artworkId: artworkId,
            viewedById: user.userId,
          ),
        );
        await updateArtwork(
          session,
          artwork.copyWith(views: artwork.views! + 1),
        );
      } catch (e) {
        session.log(
          'Error in updating views count: $e',
          level: LogLevel.error,
        );
        throw ServerSideException(
          message: e.toString(),
        );
      }
    });
  }

  Future<TagsList> getTags(
    Session session, {
    int limit = 50,
    int page = 1,
    String search = '',
    bool sortDescending = true,
    String sortBy = 'usageCount',
  }) async {
    try {
      final count = await Tag.db.count(session);
      final results = await Tag.db.find(
        session,
        orderBy: (row) {
          switch (sortBy) {
            case 'name':
              return row.name;
            default:
              return row.usageCount;
          }
        },
        orderDescending: sortDescending,
        limit: limit,
        offset: (page - 1) * limit,
        where: (p0) => p0.name.ilike('%$search%'),
      );
      return TagsList(
        results: results,
        limit: limit,
        count: count,
        page: page,
        numPages: (count / limit).ceil(),
        canLoadMore: page * limit < count,
      );
    } catch (e) {
      session.log(
        'Error in getting most used tags: $e',
        level: LogLevel.error,
      );
      throw ServerSideException(
        message: e.toString(),
      );
    }
  }

  Future<ModelsList> getModels(
    Session session, {
    int limit = 50,
    int page = 1,
    String search = '',
    bool sortDescending = true,
    String sortBy = 'usageCount',
  }) async {
    try {
      final count = await Model.db.count(session);
      final results = await Model.db.find(
        session,
        orderBy: (row) {
          switch (sortBy) {
            case 'name':
              return row.name;
            default:
              return row.usageCount;
          }
        },
        orderDescending: sortDescending,
        limit: limit,
        offset: (page - 1) * limit,
        where: (p0) => p0.name.ilike('%$search%'),
      );
      return ModelsList(
        results: results,
        limit: limit,
        count: count,
        page: page,
        numPages: (count / limit).ceil(),
        canLoadMore: page * limit < count,
      );
    } catch (e) {
      session.log(
        'Error in getting most used tags: $e',
        level: LogLevel.error,
      );
      throw ServerSideException(
        message: e.toString(),
      );
    }
  }

  @doNotGenerate
  Future<User> authUser(
    Session session,
  ) async {
    final authInfo = await session.authenticated;
    if (authInfo == null) {
      throw ServerSideException(
        message: 'You must be logged in',
      );
    }

    var cacheKey = 'UserData-${authInfo.userId}';
    var userRecord = await session.caches.localPrio.get<User>(cacheKey);

    if (userRecord == null) {
      userRecord = await User.db.findFirstRow(
        session,
        where: (row) => row.userId.equals(authInfo.userId),
        include: User.include(
          user: UserInfo.include(),
        ),
      );
      if (userRecord != null) {
        await session.caches.localPrio.put(
          cacheKey,
          userRecord,
          lifetime: Duration(
            days: 1,
          ),
        );
        return userRecord;
      }
    }
    if (userRecord == null) {
      throw ServerSideException(message: 'User not found');
    }
    return userRecord;
  }

  Future<ArtworkWithUserState> getArtwork(
    Session session,
    int artworkId,
  ) async {
    final artwork = await Artwork.db.findById(
      session,
      artworkId,
      include: Artwork.include(
        user: User.include(
          user: UserInfo.include(),
        ),
        tags: ArtworkTags.includeList(
          include: ArtworkTags.include(
            tag: Tag.include(),
          ),
        ),
      ),
    );
    if (artwork == null) {
      throw ServerSideException(
        message: 'Artwork not found',
      );
    }
    final authInfo = await session.authenticated;
    final userId = authInfo?.userId;
    bool isLiked = false;
    bool isDownloaded = false;

    if (userId != null) {
      final likedArtwork = await ArtworkLikes.db.findFirstRow(
        session,
        where: (row) =>
            row.artworkId.equals(artworkId) &
            row.likedById.equals(
              userId,
            ),
      );
      final downloadedArtwork = await ArtworkDownloads.db.findFirstRow(
        session,
        where: (row) =>
            row.artworkId.equals(artworkId) &
            row.downloadedById.equals(
              userId,
            ),
      );
      isLiked = likedArtwork != null;
      isDownloaded = downloadedArtwork != null;
    }

    return ArtworkWithUserState(
      artwork: artwork,
      isLiked: isLiked,
      isDownloaded: isDownloaded,
    );
  }

  Future<ArtworkComment> addComment(
    Session session,
    ArtworkComment comment,
  ) async {
    return await session.db.transaction(
      (transaction) async {
        try {
          final user = await authUser(session);
          final artwork = await Artwork.db.findById(session, comment.artworkId);
          if (artwork == null) {
            throw ServerSideException(
              message: 'Artwork not found',
            );
          }
          if (comment.id != null && comment.ownerId == user.userId) {
            final existingComment = await ArtworkComment.db.findById(
              session,
              comment.id!,
            );
            if (existingComment != null) {
              final updatedComment = existingComment.copyWith(
                updatedAt: DateTime.now(),
              );
              await updateArtworkComment(
                session,
                updatedComment,
              );
              return updatedComment;
            }
          }
          final newComment = await addArtworkComment(
            session,
            comment.copyWith(
              artworkId: artwork.id!,
              ownerId: user.userId,
              type: CommentType.comment,
            ),
            user,
          );
          await updateArtwork(
            session,
            artwork.copyWith(commentsCount: artwork.commentsCount! + 1),
          );
          return newComment.copyWith(
            owner: user,
          );
        } catch (e) {
          session.log(
            'Error in adding comment: $e',
            level: LogLevel.error,
          );
          throw ServerSideException(message: e.toString());
        }
      },
    );
  }

  Future<ArtworkList> getRelatedArtworks(
    Session session,
    int artworkId,
    List<String> tagNames,
    List<String> modelNames, {
    int limit = 50,
    int page = 1,
  }) async {
    whereClause(ArtworkTable row) {
      var clause = row.id.notEquals(artworkId) & row.mediaType.notEquals(null);

      Expression? tagClause;
      if (tagNames.isNotEmpty) {
        tagClause = row.tags.any(
          (t) => t.tag.name.inSet(
            tagNames.toSet(),
          ),
        );
      }
      Expression? modelClause;
      if (modelNames.isNotEmpty) {
        modelClause = row.models.any(
          (m) => m.model.name.inSet(
            modelNames.toSet(),
          ),
        );
      }
      if (tagClause != null && modelClause != null) {
        clause &= (tagClause | modelClause);
      } else if (tagClause != null) {
        clause &= tagClause;
      } else if (modelClause != null) {
        clause &= modelClause;
      }
      return clause;
    }

    final count = await Artwork.db.count(
      session,
      where: (row) => whereClause(row),
    );

    final results = await Artwork.db.find(
      session,
      where: (row) => whereClause(row),
      include: Artwork.include(
        user: User.include(
          user: UserInfo.include(),
        ),
        tags: ArtworkTags.includeList(
          include: ArtworkTags.include(
            tag: Tag.include(),
          ),
        ),
        models: ArtworkModels.includeList(
          include: ArtworkModels.include(
            model: Model.include(),
          ),
        ),
      ),
      orderBy: (row) => row.createdAt,
      orderDescending: true,
      limit: limit,
      offset: (page - 1) * limit,
    );

    final user = await session.authenticated;
    final userId = user?.userId;
    Set<int> likedIds = {};
    Set<int> downloadedIds = {};

    if (userId != null && results.isNotEmpty) {
      final artworkIds = results.map((a) => a.id!).toList();
      final userLikes = await ArtworkLikes.db.find(
        session,
        where: (t) =>
            t.likedById.equals(userId) & t.artworkId.inSet(artworkIds.toSet()),
      );
      final userDownloads = await ArtworkDownloads.db.find(
        session,
        where: (t) =>
            t.downloadedById.equals(userId) &
            t.artworkId.inSet(artworkIds.toSet()),
      );
      likedIds = userLikes.map((l) => l.artworkId).toSet();
      downloadedIds = userDownloads.map((d) => d.artworkId).toSet();
    }

    final enrichedResults = results.map((a) {
      return ArtworkWithUserState(
        artwork: a,
        isLiked: likedIds.contains(a.id),
        isDownloaded: downloadedIds.contains(a.id),
      );
    }).toList();

    return ArtworkList(
      results: enrichedResults,
      limit: limit,
      count: count,
      page: page,
      numPages: (count / limit).ceil(),
      canLoadMore: page * limit < count,
    );
  }

  Future<ArtworkCommentList> getComments(
    Session session,
    int artworkId,
    int? parentId, {
    int limit = 50,
    int page = 1,
    String sortBy = 'createdAt',
    bool sortDescending = true,
  }) async {
    final count = await ArtworkComment.db.count(
      session,
      where: (row) =>
          row.artworkId.equals(artworkId) &
          row.parentId.equals(parentId) &
          row.isDeleted.equals(false),
    );
    final comments = await ArtworkComment.db.find(
      session,
      where: (row) =>
          row.artworkId.equals(artworkId) &
          row.parentId.equals(parentId) &
          row.isDeleted.equals(false),
      include: ArtworkComment.include(
        owner: User.include(
          user: UserInfo.include(),
        ),
      ),
      orderBy: (row) {
        switch (sortBy) {
          case 'likes':
            return row.likesCount;
          case 'createdAt':
          default:
            return row.dateCreated;
        }
      },
      offset: (page - 1) * limit,
      orderDescending: sortDescending,
      limit: limit,
    );
    Set<int> likedIds = {};
    final user = await session.authenticated;
    final userId = user?.userId;

    if (userId != null && comments.isNotEmpty) {
      final commentIds = comments.map((c) => c.id!).toList();
      final userLikes = await ArtworkCommentLikes.db.find(
        session,
        where: (t) =>
            t.likedById.equals(userId) &
            t.artworkCommentId.inSet(
              commentIds.toSet(),
            ),
      );
      likedIds = userLikes
          .map(
            (l) => l.artworkCommentId,
          )
          .toSet();
    }

    final enrichedResults = comments.map((a) {
      return ArtworkCommentWithUserState(
        comment: a,
        isLiked: likedIds.contains(a.id),
      );
    }).toList();

    return ArtworkCommentList(
      results: enrichedResults,
      count: count,
      page: page,
      numPages: (count / limit).ceil(),
      limit: limit,
      canLoadMore: page * limit < count,
    );
  }

  Future<ArtworkCommentWithUserState> getComment(
    Session session,
    int commentId,
  ) async {
    final comment = await ArtworkComment.db.findById(
      session,
      commentId,
      include: ArtworkComment.include(
        owner: User.include(
          user: UserInfo.include(),
        ),
      ),
    );
    final authInfo = await session.authenticated;
    final userId = authInfo?.userId;
    bool isLiked = false;

    if (comment == null) {
      throw ServerSideException(
        message: 'Comment not found',
      );
    }

    if (userId != null) {
      final likedComment = await ArtworkCommentLikes.db.findFirstRow(
        session,
        where: (row) =>
            row.artworkCommentId.equals(commentId) &
            row.likedById.equals(
              userId,
            ),
      );
      isLiked = likedComment != null;
    }
    return ArtworkCommentWithUserState(
      comment: comment,
      isLiked: isLiked,
    );
  }

  Future<void> likeComment(Session session, int commentId) {
    return session.db.transaction((transaction) async {
      try {
        final user = await authUser(session);
        final comment = await ArtworkComment.db.findById(
          session,
          commentId,
        );
        if (comment == null) {
          throw ServerSideException(
            message: 'Comment not found',
          );
        }
        final isLiked = await ArtworkCommentLikes.db.findFirstRow(
          session,
          where: (row) =>
              row.artworkCommentId.equals(commentId) &
              row.likedById.equals(
                user.userId,
              ),
        );
        if (isLiked != null) {
          await ArtworkCommentLikes.db.deleteRow(session, isLiked);
          await updateArtworkComment(
            session,
            comment.copyWith(likesCount: comment.likesCount! - 1),
          );
        } else {
          await ArtworkCommentLikes.db.insertRow(
            session,
            ArtworkCommentLikes(
              artworkCommentId: commentId,
              likedById: user.userId,
            ),
          );
          await updateArtworkComment(
            session,
            comment.copyWith(likesCount: comment.likesCount! + 1),
          );
        }
      } catch (e) {
        session.log(
          'Error in liking comment: $e',
          level: LogLevel.error,
        );
        throw ServerSideException(message: e.toString());
      }
    });
  }

  Future<ArtworkComment> addReply(
    Session session,
    ArtworkComment reply,
  ) async {
    return await session.db.transaction((transaction) async {
      try {
        final user = await authUser(session);
        final parentComment = await ArtworkComment.db.findById(
          session,
          reply.parentId!,
        );
        if (parentComment == null) {
          throw ServerSideException(
            message: 'Parent comment not found',
          );
        }
        final artwork = await Artwork.db.findById(
          session,
          parentComment.artworkId,
        );
        if (artwork == null) {
          throw ServerSideException(
            message: 'Artwork not found',
          );
        }
        final newReply = await ArtworkComment.db.insertRow(
          session,
          reply.copyWith(
            artworkId: parentComment.artworkId,
            parentId: parentComment.id,
            ownerId: user.userId,
            type: CommentType.reply,
          ),
        );
        await updateArtworkComment(
          session,
          parentComment.copyWith(
            repliesCount: parentComment.repliesCount! + 1,
          ),
        );
        return newReply.copyWith(
          owner: user,
        );
      } catch (e) {
        session.log(
          'Error in adding reply: $e',
          level: LogLevel.error,
        );
        throw ServerSideException(message: e.toString());
      }
    });
  }

  Future<void> deleteComment(Session session, int commentId) async {
    return session.db.transaction(
      (transaction) async {
        try {
          final user = await authUser(session);
          final comment = await ArtworkComment.db.findById(
            session,
            commentId,
            include: ArtworkComment.include(
              parent: ArtworkComment.include(),
            ),
          );
          if (comment == null) {
            throw ServerSideException(
              message: 'Comment not found',
            );
          }
          if (comment.ownerId != user.userId) {
            throw ServerSideException(
              message: 'You are not the owner of this comment',
            );
          }
          final artwork = await Artwork.db.findById(
            session,
            comment.artworkId,
          );
          if (artwork == null) {
            throw ServerSideException(
              message: 'Artwork not found',
            );
          }
          await ArtworkComment.db.updateRow(
            session,
            comment.copyWith(
              isDeleted: true,
            ),
          );
          if (comment.parent != null) {
            await updateArtworkComment(
              session,
              comment.parent!.copyWith(
                repliesCount: comment.parent!.repliesCount! - 1,
                isDeleted: true,
              ),
            );
          } else {
            await updateArtwork(
              session,
              artwork.copyWith(
                commentsCount: artwork.commentsCount! - 1,
              ),
            );
          }
        } catch (e) {
          session.log(
            'Error in deleting comment: $e',
            level: LogLevel.error,
          );
          throw ServerSideException(
            message: e.toString(),
          );
        }
      },
    );
  }

  @doNotGenerate
  Future<void> updateArtwork(Session session, Artwork artwork) async {
    final updatedArtwork = await Artwork.db.updateRow(session, artwork);
    await session.messages.postMessage(
      'artwork_${artwork.id}',
      ArtworkUpdates(
        likes: updatedArtwork.likes!,
        views: updatedArtwork.views!,
        downloads: updatedArtwork.downloads!,
        commentsCount: updatedArtwork.commentsCount!,
      ),
    );
  }

  @doNotGenerate
  Future<void> updateArtworkComment(
      Session session, ArtworkComment comment) async {
    final updatedArtworkComment =
        await ArtworkComment.db.updateRow(session, comment);
    await session.messages.postMessage(
      'artwork_${comment.id}',
      ArtworkCommentUpdates(
        likes: updatedArtworkComment.likesCount!,
        repliesCount: updatedArtworkComment.repliesCount!,
      ),
    );
  }

  Stream<ArtworkUpdates> artworkUpdates(
    Session session,
    int artworkId,
  ) async* {
    var updateStream = session.messages.createStream<ArtworkUpdates>(
      'artwork_$artworkId',
    );
    final artwork = await Artwork.db.findById(session, artworkId);
    if (artwork != null) {
      yield ArtworkUpdates(
        likes: artwork.likes!,
        views: artwork.views!,
        downloads: artwork.downloads!,
        commentsCount: artwork.commentsCount!,
      );
    }
    await for (var update in updateStream) {
      yield ArtworkUpdates(
        likes: update.likes,
        views: update.views,
        downloads: update.downloads,
        commentsCount: update.commentsCount,
      );
    }
  }

  Stream<ArtworkCommentUpdates> artworkCommentUpdates(
    Session session,
    int commentId,
  ) async* {
    var updateStream = session.messages.createStream<ArtworkCommentUpdates>(
      'artwork_$commentId',
    );

    final comment = await ArtworkComment.db.findById(
      session,
      commentId,
    );
    if (comment != null) {
      yield ArtworkCommentUpdates(
        likes: comment.likesCount!,
        repliesCount: comment.repliesCount!,
      );
    }
    await for (var update in updateStream) {
      yield ArtworkCommentUpdates(
        likes: update.likes,
        repliesCount: update.repliesCount,
      );
    }
  }

  Stream<ArtworkComment> newArtworkCommentUpdates(Session session) async* {
    yield* session.messages.createStream<ArtworkComment>('new_artwork_comment');
  }

  @doNotGenerate
  Future<ArtworkComment> addArtworkComment(
    Session session,
    ArtworkComment artworkComment,
    User user,
  ) async {
    final saved = await ArtworkComment.db.insertRow(
      session,
      artworkComment,
    );
    await session.messages.postMessage(
      'new_artwork_comment',
      saved.copyWith(
        owner: user,
      ),
    );
    return saved;
  }

  @doNotGenerate
  Future<void> rebuildModels(Session session) async {
    // 1. Fetch all artworks with their tagNames
    final artworks = await Artwork.db.find(session);

    // 2. Temporary map to keep usage counts
    final Map<String, int> usageCounter = {};

    // 3. Rebuild tags and artwork_tags
    for (final artwork in artworks) {
      if (artwork.modelNames == null || artwork.modelNames!.isEmpty) continue;

      for (final name in artwork.modelNames!) {
        // Count usage
        usageCounter[name] = (usageCounter[name] ?? 0) + 1;

        // Ensure tag exists (we’ll bulk insert later)
      }
    }

    // 4. Insert tags fresh
    final tagNameToId = <String, int>{};
    for (final entry in usageCounter.entries) {
      final inserted = await Model.db.insertRow(
        session,
        Model(name: entry.key, usageCount: entry.value),
      );
      tagNameToId[entry.key] = inserted.id!;
    }

    print(tagNameToId);

    // 5. Rebuild artwork_tags join table
    for (final artwork in artworks) {
      if (artwork.modelNames == null || artwork.modelNames!.isEmpty) continue;

      // Make sure tags are unique per artwork
      final uniqueTagNames = artwork.modelNames!.toSet();

      for (final name in uniqueTagNames) {
        final tagId = tagNameToId[name];
        if (tagId != null) {
          await ArtworkModels.db.insertRow(
            session,
            ArtworkModels(
              artworkId: artwork.id!,
              modelId: tagId,
            ),
          );
        }
      }
    }

    print("✅ Tags and artwork_tags fully rebuilt");
  }
}
