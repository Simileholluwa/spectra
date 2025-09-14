import 'package:fpdart/fpdart.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/home/home.dart';

class UpdateViewsCountUsecase implements UseCase<void, UpdateViewsCountParams> {
  UpdateViewsCountUsecase({required ArtworkRepository artworkRepository})
      : _artworkRepository = artworkRepository;
  final ArtworkRepository _artworkRepository;

  @override
  Future<Either<Failure, void>> call(UpdateViewsCountParams params) async {
    final result = await _artworkRepository.updateViewsCount(
      artworkId: params.artworkId,
    );
    return result;
  }
}

class UpdateViewsCountParams {
  UpdateViewsCountParams(
    this.artworkId,
  );
  final int artworkId;
}
