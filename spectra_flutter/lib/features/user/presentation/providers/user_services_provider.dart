import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/user/user.dart';
part 'user_services_provider.g.dart';

@riverpod
UserRemoteDatasourceImpl userRemoteDatasource(
  Ref ref,
) =>
    UserRemoteDatasourceImpl(
      client: ref.watch(clientProvider),
    );

@riverpod
UserRepositoryImpl userRepository(
  Ref ref,
) =>
    UserRepositoryImpl(
      remoteDatasource: ref.watch(userRemoteDatasourceProvider),
    );

@riverpod
GetUserUsecase getUserUsecase(
  Ref ref,
) =>
    GetUserUsecase(
      repository: ref.watch(userRepositoryProvider),
    );

@riverpod
GetUserArtworksUsecase getUserArtworksUsecase(
  Ref ref,
) =>
    GetUserArtworksUsecase(
      repository: ref.watch(userRepositoryProvider),
    );

@riverpod
GetUserLikedArtworksUsecase getUserLikedArtworksUsecase(
  Ref ref,
) =>
    GetUserLikedArtworksUsecase(
      repository: ref.watch(userRepositoryProvider),
    );

@riverpod
GetUserDownloadedArtworksUsecase getUserDownloadedArtworksUsecase(
  Ref ref,
) =>
    GetUserDownloadedArtworksUsecase(
      repository: ref.watch(userRepositoryProvider),
    );
