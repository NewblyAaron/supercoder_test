import 'package:flutter/services.dart';

class AndroidFileService {
  static const MethodChannel _channel = MethodChannel('native_file_service');

  static Future<String?> pickImageFromGallery() async {
    return await _channel.invokeMethod<String>('pickImageFromGallery');
  }

  static Future<String?> takePhoto() async {
    return await _channel.invokeMethod<String>('takePhoto');
  }

  static Future<String?> pickPdf() async {
    return await _channel.invokeMethod<String>('pickPdf');
  }

  static Future<Uint8List?> getFileBytes(String? fileIdentifier) async {
    if (fileIdentifier == null) return null;

    try {
      return await _channel.invokeMethod<Uint8List>(
        'getFileBytes',
        fileIdentifier,
      );
    } catch (e) {
      return null;
    }
  }

  static Future<String?> getFileName(String? fileIdentifier) async {
    if (fileIdentifier == null) return null;

    try {
      return await _channel.invokeMethod<String>('getFileName', fileIdentifier);
    } catch (e) {
      return null;
    }
  }
}
