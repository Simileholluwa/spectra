import 'package:fpdart/fpdart.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/home/home.dart';

class GetMostUsedModelsUsecase implements UseCase<ModelsList, GetModelsParams> {
  GetMostUsedModelsUsecase({required ArtworkRepository artworkRepository})
      : _artworkRepository = artworkRepository;
  final ArtworkRepository _artworkRepository;

  @override
  Future<Either<Failure, ModelsList>> call(GetModelsParams params) async {
    final result = await _artworkRepository.getModels(
      limit: params.limit,
      page: params.page,
      sortBy: params.sortBy,
      sortDescending: params.sortDescending,
      query: params.query,
    );
    return result;
  }
}

class GetModelsParams {
  final int limit;
  final int page;
  final String sortBy;
  final bool sortDescending;
  final String query;
  GetModelsParams({
    required this.limit,
    required this.page,
    required this.sortBy,
    required this.sortDescending,
    required this.query,
  });
}
