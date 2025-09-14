import 'package:fpdart/fpdart.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/upload/upload.dart';

class StoreVectorUseCase implements UseCase<void, StoreVectorParams> {
  StoreVectorUseCase({required UploadRepository uploadRepository})
      : _uploadRepository = uploadRepository;
  final UploadRepository _uploadRepository;

  @override
  Future<Either<Failure, void>> call(StoreVectorParams params) async {
    final result = await _uploadRepository.storeVector(
      filePaths: params.filePaths,
      contentType: params.contentType,
    );
    return result;
  }
}

class StoreVectorParams {
  StoreVectorParams(
    this.filePaths,
    this.contentType,
  );
  final List<String> filePaths;
  final String contentType;
}
