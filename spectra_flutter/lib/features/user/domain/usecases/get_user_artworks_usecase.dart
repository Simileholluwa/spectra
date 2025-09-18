import 'package:fpdart/fpdart.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/user/user.dart';

class GetUserArtworksUsecase
    implements UseCase<ArtworkList, GetUserArtworksParams> {
  GetUserArtworksUsecase({
    required UserRepository repository,
  }) : _repository = repository;

  final UserRepository _repository;

  @override
  Future<Either<Failure, ArtworkList>> call(
    GetUserArtworksParams params,
  ) async {
    return _repository.getUserArtworks(
      username: params.username,
      limit: params.limit,
      page: params.page,
      sortBy: params.sortBy,
      sortDescending: params.sortDescending,
    );
  }
}

class GetUserArtworksParams {
  GetUserArtworksParams({
    required this.username,
    required this.limit,
    required this.page,
    required this.sortBy,
    required this.sortDescending,
  });

  final String username;
  final int limit;
  final int page;
  final String sortBy;
  final bool sortDescending;
}
