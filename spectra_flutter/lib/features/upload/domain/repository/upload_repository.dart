import 'package:fpdart/fpdart.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';

abstract class UploadRepository {
  Future<Either<Failure, List<SearchVectorResponse>>> searchVector({
    required List<String> filePaths,
    required String contentType,
  });
  Future<Either<Failure, void>> storeVector({
    required List<String> filePaths,
    required String contentType,
  });
  Future<Either<Failure, List<PresignedUrlResponse>>> getPresignedUrl({
    required List<PresignedUrlRequest> files,
  });
  Future<Either<Failure, Artwork>> saveArtwork({
    required Artwork artwork,
  });
}
