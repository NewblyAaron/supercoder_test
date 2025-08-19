import 'package:flutter/services.dart';

class AndroidPermissionService {
  static const _channel = MethodChannel('native_permission_service');

  static const camera = "android.permission.CAMERA";
  static const readStorage = "android.permission.READ_EXTERNAL_STORAGE";
  static const readMediaImages = "android.permission.READ_MEDIA_IMAGES";
  static const readMediaDocuments = "android.permission.READ_MEDIA_DOCUMENTS";

  static Future<bool> checkPermission(String permission) async {
    return await _channel.invokeMethod('checkPermission', {
      'permission': permission,
    });
  }

  static Future<bool> requestPermission(String permission) async {
    return await _channel.invokeMethod('requestPermission', {
      'permission': permission,
    });
  }
}
