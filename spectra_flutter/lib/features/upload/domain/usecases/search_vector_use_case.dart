import 'package:fpdart/fpdart.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/upload/upload.dart';

class SearchVectorUseCase
    implements UseCase<List<SearchVectorResponse>, SearchVectorParams> {
  SearchVectorUseCase({required UploadRepository uploadRepository})
      : _uploadRepository = uploadRepository;
  final UploadRepository _uploadRepository;

  @override
  Future<Either<Failure, List<SearchVectorResponse>>> call(
      SearchVectorParams params) async {
    final result = await _uploadRepository.searchVector(
      filePaths: params.filePaths,
      contentType: params.contentType,
    );
    return result;
  }
}

class SearchVectorParams {
  SearchVectorParams(
    this.filePaths,
    this.contentType,
  );
  final List<String> filePaths;
  final String contentType;
}
