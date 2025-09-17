import 'package:fpdart/fpdart.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/artwork/artwork.dart';

class GetArtworksUseCase implements UseCase<ArtworkList, GetArtworksParams> {
  GetArtworksUseCase({required ArtworkRepository artworkRepository})
      : _artworkRepository = artworkRepository;
  final ArtworkRepository _artworkRepository;

  @override
  Future<Either<Failure, ArtworkList>> call(GetArtworksParams params) async {
    final result = await _artworkRepository.getArtworks(
      page: params.page,
      limit: params.limit,
      filter: params.filter,
      sortBy: params.sortBy,
      sortDescending: params.sortDescending,
    );
    return result;
  }
}

class GetArtworksParams {
  GetArtworksParams(
    this.page,
    this.limit,
    this.filter,
    this.sortBy,
    this.sortDescending,
  );
  final int page;
  final int limit;
  final ArtworkFilter? filter;
  final String sortBy;
  final bool sortDescending;
}
