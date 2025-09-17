import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/artwork/artwork.dart';
part 'artwork_services_provider.g.dart';

@riverpod
ArtworkRemoteDatasource artworkRemoteDatasource(Ref ref) =>
    ArtworkRemoteDatasourceImpl(
      client: ref.watch(clientProvider),
    );

@riverpod
ArtworkRepository artworkRepository(Ref ref) => ArtworkRepositoryImpl(
      remoteDatasource: ref.watch(artworkRemoteDatasourceProvider),
    );

@riverpod
GetArtworksUseCase getArtworksUseCase(Ref ref) => GetArtworksUseCase(
      artworkRepository: ref.watch(artworkRepositoryProvider),
    );

@riverpod
GetRelatedArtworksUseCase getRelatedArtworksUseCase(Ref ref) =>
    GetRelatedArtworksUseCase(
      artworkRepository: ref.watch(artworkRepositoryProvider),
    );

@riverpod
UpdateDownloadsCountUsecase updateDownloadsCount(Ref ref) =>
    UpdateDownloadsCountUsecase(
      artworkRepository: ref.watch(artworkRepositoryProvider),
    );

@riverpod
UpdateViewsCountUsecase updateViewsCount(Ref ref) => UpdateViewsCountUsecase(
      artworkRepository: ref.watch(artworkRepositoryProvider),
    );

@riverpod
ToggleLikeUsecase toggleLike(Ref ref) => ToggleLikeUsecase(
      artworkRepository: ref.watch(artworkRepositoryProvider),
    );

@riverpod
GetTagsUsecase getMostUsedTags(Ref ref) => GetTagsUsecase(
      artworkRepository: ref.watch(artworkRepositoryProvider),
    );

@riverpod
GetMostUsedModelsUsecase getMostUsedModels(Ref ref) => GetMostUsedModelsUsecase(
      artworkRepository: ref.watch(artworkRepositoryProvider),
    );

@riverpod
GetArtworkUsecase getArtworkUseCase(Ref ref) => GetArtworkUsecase(
      artworkRepository: ref.watch(artworkRepositoryProvider),
    );

@riverpod
ArtworkCommentUsecase artworkCommentUsecase(Ref ref) => ArtworkCommentUsecase(
      artworkRepository: ref.watch(artworkRepositoryProvider),
    );

@riverpod
GetArtworkCommentsUseCase getArtworkCommentsUseCase(Ref ref) =>
    GetArtworkCommentsUseCase(
      artworkRepository: ref.watch(artworkRepositoryProvider),
    );

@riverpod
LikeCommentUsecase likeCommentUseCase(Ref ref) => LikeCommentUsecase(
      repository: ref.watch(artworkRepositoryProvider),
    );

@riverpod
AddReplyUsecase addReplyUsecase(Ref ref) => AddReplyUsecase(
      repository: ref.watch(artworkRepositoryProvider),
    );

@riverpod
DeleteCommentUsecase deleteCommentUsecase(Ref ref) => DeleteCommentUsecase(
      repository: ref.watch(artworkRepositoryProvider),
    );

@riverpod
GetCommentUsecase getCommentUseCase(Ref ref) => GetCommentUsecase(
      repository: ref.watch(artworkRepositoryProvider),
    );
