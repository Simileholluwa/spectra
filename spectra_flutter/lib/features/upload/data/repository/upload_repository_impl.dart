import 'package:fpdart/fpdart.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/upload/upload.dart';

class UploadRepositoryImpl implements UploadRepository {
  final UploadRemoteDatasource _remoteDatasource;

  UploadRepositoryImpl({
    required UploadRemoteDatasource remoteDatasource,
  }) : _remoteDatasource = remoteDatasource;

  @override
  Future<Either<Failure, List<SearchVectorResponse>>> searchVector({
    required List<String> filePaths,
    required String contentType,
  }) async {
    try {
      final response = await _remoteDatasource.searchVector(
        filePaths: filePaths,
        contentType: contentType,
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<PresignedUrlResponse>>> getPresignedUrl({
    required List<PresignedUrlRequest> files,
  }) async {
    try {
      final response = await _remoteDatasource.getPresignedUrl(
        files: files,
      );
      return Right(response);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Artwork>> saveArtwork({
    required Artwork artwork,
  }) async {
    try {
      final result = await _remoteDatasource.saveArtwork(
        artwork: artwork,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, void>> storeVector({
    required List<String> filePaths,
    required String contentType,
  }) async {
    try {
      await _remoteDatasource.storeVector(
        filePaths: filePaths,
        contentType: contentType,
      );
      return const Right(null);
    } on ServerException catch (e) {
      return Left(
        Failure(
          message: e.message,
        ),
      );
    }
  }
}
