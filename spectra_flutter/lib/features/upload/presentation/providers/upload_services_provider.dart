import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/upload/upload.dart';
part 'upload_services_provider.g.dart';

@riverpod
UploadRemoteDatasource uploadRemoteDatasource(Ref ref) {
  return UploadRemoteDatasourceImpl(
    client: ref.read(clientProvider),
  );
}

@riverpod
UploadRepository uploadRepository(Ref ref) {
  return UploadRepositoryImpl(
    remoteDatasource: ref.read(uploadRemoteDatasourceProvider),
  );
}

@riverpod
SearchVectorUseCase searchVector(Ref ref) {
  return SearchVectorUseCase(
    uploadRepository: ref.read(uploadRepositoryProvider),
  );
}

@riverpod
GetPresignedUrlUseCase getPresignedUrl(Ref ref) {
  return GetPresignedUrlUseCase(
    uploadRepository: ref.read(uploadRepositoryProvider),
  );
}

@riverpod
SaveArtworkUseCase saveArtwork(Ref ref) {
  return SaveArtworkUseCase(
    uploadRepository: ref.read(uploadRepositoryProvider),
  );
}

@riverpod
StoreVectorUseCase storeVector(Ref ref) {
  return StoreVectorUseCase(
    uploadRepository: ref.read(uploadRepositoryProvider),
  );
}