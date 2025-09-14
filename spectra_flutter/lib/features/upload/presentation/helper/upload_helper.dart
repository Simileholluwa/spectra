import 'dart:developer';
import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

class UploadHelper {
  UploadHelper._();

  static Future<String> base64ToFile(String base64Str, String filename) async {
    final bytes = base64Decode(base64Str);
    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}/$filename');
    if (!file.existsSync()) {
      await file.writeAsBytes(bytes);
      return file.path;
    }
    log('skipping...');
    return file.path;
  }
}
