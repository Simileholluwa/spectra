import 'package:fpdart/fpdart.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/upload/upload.dart';

class GetPresignedUrlUseCase
    implements UseCase<List<PresignedUrlResponse>, GetPresignedUrlParams> {
  GetPresignedUrlUseCase({required UploadRepository uploadRepository})
      : _uploadRepository = uploadRepository;
  final UploadRepository _uploadRepository;

  @override
  Future<Either<Failure, List<PresignedUrlResponse>>> call(
      GetPresignedUrlParams params) async {
    final result = await _uploadRepository.getPresignedUrl(
      files: params.files,
    );
    return result;
  }
}

class GetPresignedUrlParams {
  GetPresignedUrlParams(
    this.files,
  );
  final List<PresignedUrlRequest> files;
}
