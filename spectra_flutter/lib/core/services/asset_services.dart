import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spectra_flutter/core/core.dart';
part 'asset_services.g.dart';

@riverpod
AssetService assetService(Ref ref) {
  return AssetService(
    client: ref.read(clientProvider),
  );
}

class AssetService {
  final Client client;

  AssetService({required this.client});
  Future<Either<String, List<String>>> uploadMediaAssets(
    List<String> media,
    String folderName,
    String subFolderName,
  ) async {
    try {
      var mediaUrls = <String>[];
      for (final mediaPath in media) {
        final file = XFile(mediaPath);
        final path = '$folderName/$subFolderName/${file.name}';
        final uploadDescription =
            await client.assets.getUploadDescription(path);
        if (uploadDescription == null) {
          return left('Unable to initiate asset upload');
        }
        final uploader = FileUploader(uploadDescription);
        final stream = file.openRead();
        final length = (await file.readAsBytes()).length;
        await uploader.upload(stream, length);
        final success = await client.assets.verifyUpload(path);
        if (!success) return left('Could not complete upload');
        final decodedDescription =
            jsonDecode(uploadDescription) as Map<String, dynamic>;
        if (!decodedDescription.containsKey('url')) {
          return left('Could not get URL of uploaded file');
        }
        mediaUrls.add('${decodedDescription['url']}/$path');
      }
      return right(mediaUrls);
    } on SocketException catch (_) {
      return left('Failed to connect to server. Please try again.');
    } on TimeoutException catch (_) {
      return left('The request timed out.');
    } on ServerpodClientException catch (e) {
      return left(e.message);
    } catch (e) {
      log(e.toString());
      return left(e.toString());
    }
  }
}
