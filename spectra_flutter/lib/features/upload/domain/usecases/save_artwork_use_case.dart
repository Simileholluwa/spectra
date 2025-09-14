import 'package:fpdart/fpdart.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/upload/upload.dart';

class SaveArtworkUseCase implements UseCase<Artwork, SaveArtworkParams> {
  SaveArtworkUseCase({required UploadRepository uploadRepository})
      : _uploadRepository = uploadRepository;
  final UploadRepository _uploadRepository;

  @override
  Future<Either<Failure, Artwork>> call(SaveArtworkParams params) async {
    final result = await _uploadRepository.saveArtwork(
      artwork: params.artwork,
    );
    return result;
  }
}

class SaveArtworkParams {
  SaveArtworkParams(
    this.artwork,
  );
  final Artwork artwork;
}
