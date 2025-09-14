// import 'dart:convert';
// import 'dart:developer';
// import 'dart:io';
// import 'dart:isolate';
// import 'package:dio/dio.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'package:spectra_client/spectra_client.dart';
// import 'package:spectra_flutter/core/core.dart';
// import 'package:spectra_flutter/features/upload/upload.dart';
// part 'upload_stages_provider.g.dart';

// @Riverpod(keepAlive: true)
// class UploadStages extends _$UploadStages {
//   final dio = Dio();
//   final receivePort = ReceivePort();
//   @override
//   UploadProgress build() {
//     return UploadProgress.initial();
//   }

//   ArtworkData loadArtworkData() {
//     final prefs = ref.watch(localStorageProvider);
//     final artworkDataJson = prefs.getString('artwork_data');
//     return ArtworkData.fromJson(
//       jsonDecode(
//         artworkDataJson!,
//       ),
//     );
//   }

//   void reset() {
//     state = UploadProgress.initial();
//   }

//   Future<void> _saveArtworkData(ArtworkData artworkData) async {
//     final prefs = ref.watch(localStorageProvider);
//     await prefs.setString(
//       'artwork_data',
//       jsonEncode(
//         artworkData.toJson(),
//       ),
//     );
//   }

//   Future<void> clearArtworkData() async {
//     final prefs = ref.watch(localStorageProvider);
//     await prefs.remove('artwork_data');
//   }

//   Future<List<PresignedUrlResponse>> getPresignedUrl(
//     List<PresignedUrlRequest> files,
//     int stage,
//   ) async {
//     final result = await ref
//         .read(
//           getPresignedUrlProvider,
//         )
//         .call(
//           GetPresignedUrlParams(
//             files,
//           ),
//         );
//     return result.fold(
//       (failure) {
//         log(failure.message);
//         state = state.copyWith(
//           message: 'Error getting URL...',
//           hasError: true,
//           progress: stage / 6,
//         );
//         return [];
//       },
//       (response) {
//         return response;
//       },
//     );
//   }

//   Future<void> uploadToS3(
//     File file,
//     String contentType,
//     String presignedUrl,
//     int stage,
//   ) async {
//     await Isolate.spawn(
//       uploadIsolate,
//       UploadRequest(
//         presignedUrl,
//         file.path,
//         contentType,
//         receivePort.sendPort,
//         dio,
//       ),
//     );

//     await for (final message in receivePort) {
//       if (message is double) {
//         state = state.copyWith(progress: message);
//       } else if (message == "done") {
//         break;
//       } else if (message.toString().startsWith("error")) {
//         state = state.copyWith(
//           message: "Error uploading...",
//           hasError: true,
//           progress: stage / 6,
//         );
//         break;
//       }
//     }
//   }

//   Future<void> storeVector(
//     List<String> filePaths,
//     String contentType,
//   ) async {
//     final result = await ref
//         .read(
//           storeVectorProvider,
//         )
//         .call(
//           StoreVectorParams(
//             filePaths,
//             contentType,
//           ),
//         );
//     return result.fold(
//       (failure) {
//         log(failure.message);
//         state = state.copyWith(
//           message: 'Error storing vector...',
//           hasError: true,
//           progress: 5 / 6,
//         );
//         return;
//       },
//       (_) {},
//     );
//   }

//   Future<bool> saveArt(
//     List<String> mediaUrl,
//     List<String> thumbnailUrl,
//     List<String> resolution,
//     MediaType mediaType,
//     Artwork artWork,
//   ) async {
//     final result = await ref
//         .read(
//           saveArtworkProvider,
//         )
//         .call(
//           SaveArtworkParams(
//             artWork.copyWith(
//               mediaUrl: mediaUrl,
//               thumbnailUrl: thumbnailUrl,
//               mediaType: mediaType,
//               resolution: resolution,
//             ),
//           ),
//         );
//     return result.fold(
//       (failure) {
//         log(failure.message);
//         state = state.copyWith(
//           message: 'Error saving artwork...',
//           hasError: true,
//           progress: 5 / 6,
//         );
//         return false;
//       },
//       (response) {
//         return true;
//       },
//     );
//   }

//   Future<void> stepOne() async {
//     final artworkData = loadArtworkData();
//     final files = artworkData.files;
//     final filePresignedUrl = await getPresignedUrl(files, 1);
//     if (filePresignedUrl.isEmpty) {
//       return;
//     }
//     state = state.copyWith(
//       message: 'Got URL...',
//       hasError: false,
//       progress: 1 / 6,
//       getOriginalSignedUrl: true,
//     );
//     await _saveArtworkData(
//       artworkData.copyWith(
//         presignedUrlResponse: filePresignedUrl,
//       ),
//     );
//   }

//   Future<void> stepTwo() async {
//     final artworkData = loadArtworkData();
//     final presignedUrls = artworkData.presignedUrlResponse;
//     final presignedUrlRequest = artworkData.files;

//     for (var i = 0; i < presignedUrls!.length; i++) {
//       await uploadToS3(
//         File(presignedUrls[i].filePath),
//         presignedUrlRequest[i].contentType,
//         presignedUrls[i].uploadUrl,
//         2,
//       );
//     }

//     state = state.copyWith(
//       message: 'Main art uploaded...',
//       hasError: false,
//       progress: 2 / 6,
//       uploadOriginal: true,
//     );
//   }

//   Future<void> stepThree() async {
//     state = state.copyWith(message: 'Getting thumbnail URL..');
//     final artworkData = loadArtworkData();
//     final thumbnailFiles = artworkData.thumbnailFiles;

//     final thumbnailPresignedUrl = await getPresignedUrl(
//       thumbnailFiles,
//       3,
//     );
//     if (thumbnailPresignedUrl.isEmpty) {
//       return;
//     }
//     state = state.copyWith(
//       message: 'Got thumbnail URL...',
//       hasError: false,
//       progress: 3 / 6,
//       getThumbnailSignedUrl: true,
//     );
//     await _saveArtworkData(
//       artworkData.copyWith(
//         thumbnailPresignedUrlResponse: thumbnailPresignedUrl,
//       ),
//     );
//   }

//   Future<void> stepFour() async {
//     final artworkData = loadArtworkData();
//     final thumbnailPresignedUrls = artworkData.thumbnailPresignedUrlResponse;

//     for (var i = 0; i < thumbnailPresignedUrls!.length; i++) {
//       await uploadToS3(
//         File(thumbnailPresignedUrls[i].filePath),
//         'image/jpeg',
//         thumbnailPresignedUrls[i].uploadUrl,
//         4,
//       );
//     }

//     state = state.copyWith(
//       message: 'Uploaded thumbnail...',
//       hasError: false,
//       progress: 4 / 6,
//       uploadThumbnail: true,
//     );
//   }

//   Future<void> stepFive() async {
//     state = state.copyWith(message: 'Storing vector...');
//     final artworkData = loadArtworkData();
//     final thumbnails = artworkData.thumbnailFiles;
//     final contentType = artworkData.mediaType.name;
//     final files = artworkData.files;
//     final filePaths = contentType.contains('image')
//         ? thumbnails.map((e) => e.filePath).toList()
//         : files.map((e) => e.filePath).toList();

//     await storeVector(
//       filePaths,
//       contentType,
//     );

//     state = state.copyWith(
//       message: 'Stored vector...',
//       hasError: false,
//       progress: 5 / 6,
//       storeVector: true,
//     );
//   }

//   Future<void> stepSix() async {
//     final artworkData = loadArtworkData();
//     final mediaType = artworkData.mediaType;
//     final resolution = artworkData.resolution;
//     final mediaUrl = artworkData.presignedUrlResponse!
//         .map(
//           (e) => e.fileUrl,
//         )
//         .toList();
//     final thumbnailUrl = artworkData.thumbnailPresignedUrlResponse!
//         .map(
//           (e) => e.fileUrl,
//         )
//         .toList();
//     final artWork = artworkData.artWork;

//     final artworkRes = await saveArt(
//       mediaUrl,
//       thumbnailUrl,
//       resolution,
//       mediaType,
//       artWork,
//     );
//     if (!artworkRes) {
//       return;
//     }
//     state = state.copyWith(
//       message: 'Saved artwork...',
//       hasError: false,
//       progress: 6 / 6,
//       saveArtwork: true,
//     );
//   }

//   Future<void> uploadArtwork() async {
//     state = state.copyWith(
//       idle: false,
//       message: 'Starting upload...',
//     );
//     if (!state.getOriginalSignedUrl) {
//       await stepOne();
//       await stepTwo();
//       await stepThree();
//       await stepFour();
//       await stepFive();
//       await stepSix();
//     } else if (!state.uploadOriginal) {
//       await stepTwo();
//       await stepThree();
//       await stepFour();
//       await stepFive();
//       await stepSix();
//     } else if (!state.getThumbnailSignedUrl) {
//       await stepThree();
//       await stepFour();
//       await stepFive();
//       await stepSix();
//     } else if (!state.uploadThumbnail) {
//       await stepFour();
//       await stepFive();
//       await stepSix();
//     } else if (!state.storeVector) {
//       await stepFive();
//       await stepSix();
//     } else if (!state.saveArtwork) {
//       await stepSix();
//     }
//     state = state.copyWith(idle: true);
//     await clearArtworkData();
//     TToastMessages.successToast(
//       'Your artwork has been uploaded successfully!',
//     );
//   }
// }

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:isolate';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:spectra_client/spectra_client.dart';
import 'package:spectra_flutter/core/core.dart';
import 'package:spectra_flutter/features/upload/upload.dart';

part 'upload_stages_provider.g.dart';

/// ===============================
/// Isolate-side message contracts
/// ===============================
typedef StepAction = Future<void> Function();

/// Progress / control messages
sealed class UploadMsg {}

class UploadProgressMsg extends UploadMsg {
  final int sent;
  final int total;
  UploadProgressMsg(this.sent, this.total);
}

class UploadDoneMsg extends UploadMsg {}

class UploadErrorMsg extends UploadMsg {
  final String message;
  UploadErrorMsg(this.message);
}

/// Request passed to the isolate
class UploadRequest {
  final String presignedUrl;
  final String filePath;
  final String contentType;
  final SendPort sendPort; // send updates back to main

  UploadRequest({
    required this.presignedUrl,
    required this.filePath,
    required this.contentType,
    required this.sendPort,
  });
}

/// Top-level entry for the upload isolate.
/// Runs the PUT stream and throttles onSendProgress updates.
Future<void> uploadIsolateEntry(UploadRequest req) async {
  final dio = Dio();
  final file = File(req.filePath);

  try {
    final length = await file.length();

    int lastUpdate = 0;
    await dio.put(
      req.presignedUrl,
      data: file.openRead(), // stream (doesn't load whole file in RAM)
      options: Options(
        headers: {
          Headers.contentLengthHeader: length,
          Headers.contentTypeHeader: req.contentType,
        },
      ),
      onSendProgress: (sent, total) {
        final now = DateTime.now().millisecondsSinceEpoch;
        // throttle ~5 fps (200ms)
        if (now - lastUpdate >= 200) {
          req.sendPort.send(UploadProgressMsg(sent, total));
          lastUpdate = now;
        }
      },
    );

    // final progress push (100%) + done
    req.sendPort
      ..send(UploadProgressMsg(length, length))
      ..send(UploadDoneMsg());
  } catch (e) {
    req.sendPort.send(UploadErrorMsg(e.toString()));
  }
}

/// Simple retry helper with exponential backoff.
Future<T> _retry<T>(
  Future<T> Function() task, {
  int retries = 3,
  Duration initialDelay = const Duration(seconds: 2),
}) async {
  var delay = initialDelay;
  for (var attempt = 0; attempt < retries; attempt++) {
    try {
      return await task();
    } catch (e) {
      if (attempt == retries - 1) rethrow;
      await Future.delayed(delay);
      delay *= 2;
    }
  }
  throw StateError('unreachable');
}

/// ===============================
/// Riverpod Notifier
/// ===============================

@Riverpod(keepAlive: true)
class UploadStages extends _$UploadStages {
  final Dio dio = Dio();

  // tune these if you like
  static const int totalSteps = 6;

  @override
  UploadProgress build() {
    return UploadProgress.initial();
  }

  /// --------- Persistence helpers ---------
  ArtworkData loadArtworkData() {
    final prefs = ref.watch(localStorageProvider);
    final artworkDataJson = prefs.getString('artwork_data');
    return ArtworkData.fromJson(jsonDecode(artworkDataJson!));
  }

  Future<void> _saveArtworkData(ArtworkData artworkData) async {
    final prefs = ref.watch(localStorageProvider);
    await prefs.setString('artwork_data', jsonEncode(artworkData.toJson()));
  }

  Future<void> clearArtworkData() async {
    final prefs = ref.watch(localStorageProvider);
    await prefs.remove('artwork_data');
  }

  void reset() {
    state = UploadProgress.initial();
  }

  /// --------- API wrappers ---------
  Future<List<PresignedUrlResponse>> getPresignedUrl(
    List<PresignedUrlRequest> files,
    int stepIndex,
  ) async {
    final result = await ref.read(getPresignedUrlProvider).call(
          GetPresignedUrlParams(files),
        );

    return result.fold(
      (failure) {
        log(failure.message);
        state = state.copyWith(
          message: 'Error getting URL...',
          hasError: true,
          progress: stepIndex / totalSteps,
        );
        return <PresignedUrlResponse>[];
      },
      (response) => response,
    );
  }

  Future<void> storeVector(
    List<String> filePaths,
    String contentType,
  ) async {
    final result = await ref.read(storeVectorProvider).call(
          StoreVectorParams(filePaths, contentType),
        );

    return result.fold(
      (failure) {
        log(failure.message);
        state = state.copyWith(
          message: 'Error storing vector...',
          hasError: true,
          progress: 5 / totalSteps,
        );
        return;
      },
      (_) {},
    );
  }

  Future<bool> saveArt(
    List<String> mediaUrl,
    List<String> thumbnailUrl,
    List<String> resolution,
    MediaType mediaType,
    Artwork artWork,
  ) async {
    final result = await ref.read(saveArtworkProvider).call(
          SaveArtworkParams(
            artWork.copyWith(
              mediaUrl: mediaUrl,
              thumbnailUrl: thumbnailUrl,
              mediaType: mediaType,
              resolution: resolution,
            ),
          ),
        );

    return result.fold(
      (failure) {
        log(failure.message);
        state = state.copyWith(
          message: 'Error saving artwork...',
          hasError: true,
          progress: 5 / totalSteps,
        );
        return false;
      },
      (_) => true,
    );
  }

  /// --------- Background upload (isolate) ---------
  Future<void> _uploadToS3InBackground({
    required File file,
    required String contentType,
    required String presignedUrl,
    required String label,
  }) async {
    final receivePort = ReceivePort();

    // Spawn the worker isolate
    await Isolate.spawn(
      uploadIsolateEntry,
      UploadRequest(
        presignedUrl: presignedUrl,
        filePath: file.path,
        contentType: contentType,
        sendPort: receivePort.sendPort,
      ),
    );

    // Throttle main-isolate state updates a little more (UI-friendly)
    int lastUiUpdate = 0;

    await for (final msg in receivePort) {
      if (msg is UploadProgressMsg) {
        final now = DateTime.now().millisecondsSinceEpoch;
        if (now - lastUiUpdate >= 200) {
          final progress = msg.total == 0 ? 0.0 : msg.sent / msg.total;
          state = state.copyWith(
            message: 'Uploading ${file.path.split('/').last}...',
            hasError: false,
            progress: progress, // 0..1 (fine-grained during this file)
          );
          lastUiUpdate = now;
        }
      } else if (msg is UploadDoneMsg) {
        // Done with this file
        break;
      } else if (msg is UploadErrorMsg) {
        state = state.copyWith(
          message: 'Error uploading $label: ${msg.message}',
          hasError: true,
        );
        break;
      }
    }
  }

  /// ==========================================
  ///              PIPELINE STEPS
  /// ==========================================

  /// Step 1: Get main presigned URLs
  Future<void> _stepOne() async {
    final artworkData = loadArtworkData();
    final files = artworkData.files;

    final filePresignedUrl = await _retry(
      () => getPresignedUrl(files, 1),
    );
    if (filePresignedUrl.isEmpty) return;

    state = state.copyWith(
      message: 'Got URL...',
      hasError: false,
      progress: 1 / totalSteps,
      getOriginalSignedUrl: true,
    );

    await _saveArtworkData(
      artworkData.copyWith(presignedUrlResponse: filePresignedUrl),
    );
  }

  /// Step 2: Upload original files (sequential or small batches)
  Future<void> _stepTwo() async {
    final artworkData = loadArtworkData();
    final presigned = artworkData.presignedUrlResponse!;
    final requests = artworkData.files;

    // You can parallelize in small batches if you like; here sequential for clarity
    for (var i = 0; i < presigned.length; i++) {
      final p = presigned[i];
      final r = requests[i];

      await _retry(
        () => _uploadToS3InBackground(
          file: File(p.filePath),
          contentType: r.contentType,
          presignedUrl: p.uploadUrl,
          label: 'main',
        ),
      );
    }

    state = state.copyWith(
      message: 'Main art uploaded...',
      hasError: false,
      progress: 2 / totalSteps,
      uploadOriginal: true,
    );
  }

  /// Step 3: Get thumbnail presigned URLs
  Future<void> _stepThree() async {
    state = state.copyWith(message: 'Getting thumbnail URL..');

    final artworkData = loadArtworkData();
    final thumbnailFiles = artworkData.thumbnailFiles;

    final thumbnailPresignedUrl = await _retry(
      () => getPresignedUrl(thumbnailFiles, 3),
    );
    if (thumbnailPresignedUrl.isEmpty) return;

    state = state.copyWith(
      message: 'Got thumbnail URL...',
      hasError: false,
      progress: 3 / totalSteps,
      getThumbnailSignedUrl: true,
    );

    await _saveArtworkData(
      artworkData.copyWith(
        thumbnailPresignedUrlResponse: thumbnailPresignedUrl,
      ),
    );
  }

  /// Step 4: Upload thumbnails
  Future<void> _stepFour() async {
    final artworkData = loadArtworkData();
    final thumbs = artworkData.thumbnailPresignedUrlResponse!;

    for (var i = 0; i < thumbs.length; i++) {
      final t = thumbs[i];

      await _retry(
        () => _uploadToS3InBackground(
          file: File(t.filePath),
          contentType: 'image/jpeg',
          presignedUrl: t.uploadUrl,
          label: 'thumbnail',
        ),
      );
    }

    state = state.copyWith(
      message: 'Uploaded thumbnail...',
      hasError: false,
      progress: 4 / totalSteps,
      uploadThumbnail: true,
    );
  }

  /// Step 5: Store vectors (run heavy CPU in isolate if needed)
  Future<void> _stepFive() async {
    state = state.copyWith(message: 'Storing vector...');

    final artworkData = loadArtworkData();
    final contentType = artworkData.mediaType.name;
    final filePaths = contentType.contains('image')
        ? artworkData.thumbnailFiles.map((e) => e.filePath).toList()
        : artworkData.files.map((e) => e.filePath).toList();

    // If this is CPU-heavy, wrap in Isolate.run(() async { ... })
    await _retry(() => storeVector(filePaths, contentType));

    state = state.copyWith(
      message: 'Stored vector...',
      hasError: false,
      progress: 5 / totalSteps,
      storeVector: true,
    );
  }

  /// Step 6: Save artwork
  Future<void> _stepSix() async {
    final artworkData = loadArtworkData();

    final mediaUrl =
        artworkData.presignedUrlResponse!.map((e) => e.fileUrl).toList();
    final thumbnailUrl = artworkData.thumbnailPresignedUrlResponse!
        .map((e) => e.fileUrl)
        .toList();

    final ok = await _retry(() => saveArt(
          mediaUrl,
          thumbnailUrl,
          artworkData.resolution,
          artworkData.mediaType,
          artworkData.artWork,
        ));

    if (!ok) return;

    state = state.copyWith(
      message: 'Saved artwork...',
      hasError: false,
      progress: 6 / totalSteps,
      saveArtwork: true,
    );
  }

  /// ==========================================
  ///           PIPELINE ORCHESTRATION
  /// ==========================================

  List<({String name, bool Function() isComplete, StepAction run})>
      _buildSteps() {
    return [
      (
        name: 'Get Presigned URLs',
        isComplete: () => state.getOriginalSignedUrl,
        run: _stepOne,
      ),
      (
        name: 'Upload Originals',
        isComplete: () => state.uploadOriginal,
        run: _stepTwo,
      ),
      (
        name: 'Get Thumbnail URLs',
        isComplete: () => state.getThumbnailSignedUrl,
        run: _stepThree,
      ),
      (
        name: 'Upload Thumbnails',
        isComplete: () => state.uploadThumbnail,
        run: _stepFour,
      ),
      (
        name: 'Store Vectors',
        isComplete: () => state.storeVector,
        run: _stepFive,
      ),
      (
        name: 'Finalize',
        isComplete: () => state.saveArtwork,
        run: _stepSix,
      ),
    ];
  }

  Future<void> uploadArtwork() async {
    state = state.copyWith(idle: false, message: 'Starting upload...');

    final steps = _buildSteps();

    for (final step in steps) {
      if (step.isComplete()) continue;

      try {
        state = state.copyWith(message: 'Running ${step.name}...');
        await step.run();
      } catch (e, st) {
        log('Error in ${step.name}: $e\n$st');
        state = state.copyWith(
          hasError: true,
          message: 'Error at ${step.name}: $e',
          idle: true,
        );
        return;
      }
    }

    state = state.copyWith(idle: true);
    await clearArtworkData();
    reset();
    TToastMessages.successToast(
      'Your artwork has been uploaded successfully!',
    );
  }
}
