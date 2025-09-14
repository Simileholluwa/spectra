import 'package:fpdart/fpdart.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/home/home.dart';

class GetArtworkCommentsUseCase
    implements UseCase<ArtworkCommentList, GetArtworkCommentsParams> {
  GetArtworkCommentsUseCase({required ArtworkRepository artworkRepository})
      : _artworkRepository = artworkRepository;
  final ArtworkRepository _artworkRepository;

  @override
  Future<Either<Failure, ArtworkCommentList>> call(
      GetArtworkCommentsParams params) async {
    final result = await _artworkRepository.getComments(
      artworkId: params.artworkId,
      parentId: params.parentId,
      page: params.page,
      limit: params.limit,
      sortBy: params.sortBy,
      sortDescending: params.sortDescending,
    );
    return result;
  }
}

class GetArtworkCommentsParams {
  GetArtworkCommentsParams(
    this.artworkId,
    this.parentId,
    this.page,
    this.limit,
    this.sortBy,
    this.sortDescending,
  );
  final int artworkId;
  final int? parentId;
  final int page;
  final int limit;
  final String sortBy;
  final bool sortDescending;
}
