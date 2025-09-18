import 'package:fpdart/fpdart.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/user/user.dart';

class GetUserLikedArtworksUsecase
    implements UseCase<ArtworkList, GetUserLikedArtworksParams> {
  GetUserLikedArtworksUsecase({
    required UserRepository repository,
  }) : _repository = repository;

  final UserRepository _repository;

  @override
  Future<Either<Failure, ArtworkList>> call(
    GetUserLikedArtworksParams params,
  ) async {
    return _repository.getUserLikedArtworks(
      username: params.username,
      limit: params.limit,
      page: params.page,
      sortDescending: params.sortDescending,
    );
  }
}

class GetUserLikedArtworksParams {
  GetUserLikedArtworksParams({
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
