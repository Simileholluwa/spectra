import 'package:fpdart/fpdart.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/artwork/artwork.dart';

class ToggleLikeUsecase implements UseCase<void, ToggleLikeParams> {
  ToggleLikeUsecase({required ArtworkRepository artworkRepository})
      : _artworkRepository = artworkRepository;
  final ArtworkRepository _artworkRepository;

  @override
  Future<Either<Failure, void>> call(ToggleLikeParams params) async {
    final result = await _artworkRepository.toggleLike(
      artworkId: params.artworkId,
    );
    return result;
  }
}

class ToggleLikeParams {
  ToggleLikeParams(
    this.artworkId,
  );
  final int artworkId;
}
