import 'dart:isolate';
import 'dart:io';
import 'package:dio/dio.dart';

class UploadRequest {
  final String presignedUrl;
  final String filePath;
  final String contentType;
  final SendPort sendPort;
  final Dio dio;

  UploadRequest(
    this.presignedUrl,
    this.filePath,
    this.contentType,
    this.sendPort,
    this.dio,
  );
}

Future<void> uploadIsolate(UploadRequest req) async {
  final file = File(req.filePath);
  int lastUpdate = 0;

  try {
    await req.dio.put(
      req.presignedUrl,
      data: file.openRead(),
      options: Options(
        headers: {
          Headers.contentLengthHeader: await file.length(),
          "Content-Type": req.contentType,
        },
      ),
      onSendProgress: (sent, total) {
        final now = DateTime.now().millisecondsSinceEpoch;
        if (now - lastUpdate > 1000) {
          req.sendPort.send(sent / total);
          lastUpdate = now;
        }
      },
    );

    req.sendPort.send("done");
  } catch (e) {
    req.sendPort.send("error:$e");
  }
}
