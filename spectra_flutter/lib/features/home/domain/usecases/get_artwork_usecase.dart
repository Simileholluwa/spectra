import 'package:fpdart/fpdart.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/home/home.dart';

class GetArtworkUsecase
    implements UseCase<ArtworkWithUserState, GetArtworkParams> {
  GetArtworkUsecase({required ArtworkRepository artworkRepository})
      : _artworkRepository = artworkRepository;
  final ArtworkRepository _artworkRepository;

  @override
  Future<Either<Failure, ArtworkWithUserState>> call(
      GetArtworkParams params) async {
    final result = await _artworkRepository.getArtwork(
      artworkId: params.artworkId,
    );
    return result;
  }
}

class GetArtworkParams {
  GetArtworkParams(
    this.artworkId,
  );
  final int artworkId;
}
