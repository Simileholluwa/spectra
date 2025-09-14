// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fpdart/fpdart.dart';

import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/home/home.dart';

class GetTagsUsecase implements UseCase<TagsList, GetTagsParams> {
  GetTagsUsecase({required ArtworkRepository artworkRepository})
      : _artworkRepository = artworkRepository;
  final ArtworkRepository _artworkRepository;

  @override
  Future<Either<Failure, TagsList>> call(GetTagsParams params) async {
    final result = await _artworkRepository.getTags(
      limit: params.limit,
      page: params.page,
      sortBy: params.sortBy,
      sortDescending: params.sortDescending,
      query: params.query,
    );
    return result;
  }
}

class GetTagsParams {
  final int limit;
  final int page;
  final String sortBy;
  final bool sortDescending;
  final String query;
  GetTagsParams({
    required this.limit,
    required this.page,
    required this.sortBy,
    required this.sortDescending,
    required this.query,
  });
}
