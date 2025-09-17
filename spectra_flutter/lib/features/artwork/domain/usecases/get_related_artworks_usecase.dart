import 'package:fpdart/fpdart.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/artwork/artwork.dart';

class GetRelatedArtworksUseCase
    implements UseCase<ArtworkList, GetRelatedArtworksParams> {
  GetRelatedArtworksUseCase({required ArtworkRepository artworkRepository})
      : _artworkRepository = artworkRepository;
  final ArtworkRepository _artworkRepository;

  @override
  Future<Either<Failure, ArtworkList>> call(
      GetRelatedArtworksParams params) async {
    final result = await _artworkRepository.getRelatedArtworks(
      page: params.page,
      limit: params.limit,
      modelNames: params.modelNames,
      tagNames: params.tagNames,
      artworkId: params.artworkId,
    );
    return result;
  }
}

class GetRelatedArtworksParams {
  GetRelatedArtworksParams(
    this.page,
    this.limit,
    this.tagNames,
    this.modelNames,
    this.artworkId,
  );
  final int page;
  final int limit;
  final List<String> tagNames;
  final List<String> modelNames;
  final int artworkId;
}
