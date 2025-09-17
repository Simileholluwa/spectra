import 'package:fpdart/fpdart.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/artwork/artwork.dart';

class UpdateDownloadsCountUsecase
    implements UseCase<void, UpdateDownloadsCountParams> {
  UpdateDownloadsCountUsecase({required ArtworkRepository artworkRepository})
      : _artworkRepository = artworkRepository;
  final ArtworkRepository _artworkRepository;

  @override
  Future<Either<Failure, void>> call(UpdateDownloadsCountParams params) async {
    final result = await _artworkRepository.updateDownloadsCount(
      artworkId: params.artworkId,
    );
    return result;
  }
}

class UpdateDownloadsCountParams {
  UpdateDownloadsCountParams(
    this.artworkId,
  );
  final int artworkId;
}
