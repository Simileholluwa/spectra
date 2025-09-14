import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';

abstract class UploadRemoteDatasource {
  Future<List<SearchVectorResponse>> searchVector({
    required List<String> filePaths,
    required String contentType,
  });
  Future<List<PresignedUrlResponse>> getPresignedUrl({
    required List<PresignedUrlRequest> files,
  });
  Future<void> storeVector({
    required List<String> filePaths,
    required String contentType,
  });
  Future<Artwork> saveArtwork({
    required Artwork artwork,
  });
}

class UploadRemoteDatasourceImpl implements UploadRemoteDatasource {
  final Client _client;

  UploadRemoteDatasourceImpl({
    required Client client,
  }) : _client = client;

  @override
  Future<List<SearchVectorResponse>> searchVector({
    required List<String> filePaths,
    required String contentType,
  }) async {
    try {
      final token = await _client.upload.createUploadToken();

      final multipartFiles = await Future.wait(
        filePaths.map(
          (file) async {
            return await MultipartFile.fromFile(
              file,
              filename: file.split('/').last,
            );
          },
        ),
      );

      final formData = FormData.fromMap({
        "files": multipartFiles,
      });

      final dio = Dio();
      final jwt = token;

      final response = await dio.post(
        "${Env.pythonFastApi}search_vector?content_type=$contentType",
        data: formData,
        options: Options(
          headers: {
            "Authorization": "Bearer $jwt",
          },
        ),
      );

      final res = response.data as List;

      return List<SearchVectorResponse>.from(
        res.map(
          (x) => SearchVectorResponse.fromJson(x),
        ),
      );
    } on DioException catch (e) {
      throw ServerException(
        message: DioErrorHandler.handle(
          e,
        ),
      );
    } on SocketException catch (_) {
      throw ServerException(
        message: 'We are unable to connect you to the server. '
            'Please check your internet connection and try again.',
      );
    } on ServerSideException catch (e) {
      throw ServerException(
        message: e.message,
      );
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: 'An unexpected error occurred: $e',
      );
    }
  }

  @override
  Future<List<PresignedUrlResponse>> getPresignedUrl({
    required List<PresignedUrlRequest> files,
  }) async {
    try {
      final response = await _client.upload.getPresignedUrl(
        files,
      );
      return response;
    } on SocketException catch (_) {
      throw ServerException(
        message:
            'We are unable to connect you to the server. Please check your internet connection and try again.',
      );
    } on ServerSideException catch (e) {
      throw ServerException(
        message: e.message,
      );
    } catch (e) {
      throw ServerException(
        message: 'An unexpected error occurred: $e',
      );
    }
  }

  @override
  Future<void> storeVector({
    required List<String> filePaths,
    required String contentType,
  }) async {
    try {
      final token = await _client.upload.createUploadToken();
      final uri = Uri.parse(
          "${Env.pythonFastApi}store_vector?content_type=$contentType");

      final multipartFiles = await Future.wait(
        filePaths.map(
          (file) async {
            return await MultipartFile.fromFile(
              file,
              filename: file.split('/').last,
            );
          },
        ),
      );

      final formData = FormData.fromMap({
        "files": multipartFiles,
      });

      final dio = Dio();
      final jwt = token;

      final response = await dio.post(
        uri.toString(),
        data: formData,
        options: Options(
          headers: {
            "Authorization": "Bearer $jwt",
          },
          contentType: "multipart/form-data",
        ),
      );

      if (response.statusCode != 200) {
        final res = await response.data as String;
        final decodedResponse = jsonDecode(res);
        throw ServerException(
          message: decodedResponse.toString(),
        );
      }
    } on DioException catch (e) {
      throw ServerException(
        message: DioErrorHandler.handle(
          e,
        ),
      );
    } on SocketException catch (_) {
      throw ServerException(
        message:
            'We are unable to connect you to the server. Please check your internet connection and try again.',
      );
    } on ServerSideException catch (e) {
      throw ServerException(
        message: e.message,
      );
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(
        message: 'An unexpected error occurred: $e',
      );
    }
  }

  @override
  Future<Artwork> saveArtwork({
    required Artwork artwork,
  }) async {
    try {
      final result = await _client.upload.saveArt(
        artwork,
      );
      if (result == null) {
        throw ServerException(
          message: 'We were unable to save your artwork',
        );
      }
      return result;
    } on SocketException catch (_) {
      throw ServerException(
        message:
            'We are unable to connect you to the server. Please check your internet connection and try again.',
      );
    } on ServerSideException catch (e) {
      throw ServerException(
        message: e.message,
      );
    } catch (e) {
      throw ServerException(
        message: 'An unexpected error occurred: $e',
      );
    }
  }
}
