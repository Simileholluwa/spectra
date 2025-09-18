import 'package:fpdart/fpdart.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/user/user.dart';

class GetUserDownloadedArtworksUsecase
    implements UseCase<ArtworkList, GetUserDownloadedArtworksParams> {
  GetUserDownloadedArtworksUsecase({
    required UserRepository repository,
  }) : _repository = repository;

  final UserRepository _repository;

  @override
  Future<Either<Failure, ArtworkList>> call(
    GetUserDownloadedArtworksParams params,
  ) async {
    return _repository.getUserDownloadedArtworks(
      username: params.username,
      limit: params.limit,
      page: params.page,
      sortDescending: params.sortDescending,
    );
  }
}

class GetUserDownloadedArtworksParams {
  GetUserDownloadedArtworksParams({
    required this.username,
    required this.limit,
    required this.page,
    required this.sortDescending,
  });

  final String username;
  final int limit;
  final int page;
  final bool sortDescending;
}
