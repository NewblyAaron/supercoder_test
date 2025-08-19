import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:supercoder_test/app/routes/app_routes.dart';
import 'package:supercoder_test/app/services/android_file_service.dart';
import 'package:supercoder_test/app/services/android_permission_service.dart';

class HomeController extends GetxController {
  var imageBytes = Rxn<Uint8List?>();

  void navigateToCampaign() => Get.toNamed(Routes.campaign);
  void navigateToProfile() => Get.toNamed(Routes.profile);

  void selectImage() async {
    final hasCameraPerms = await _checkPermissions(
      AndroidPermissionService.camera,
    );
    final hasReadMediaImagePerms = await _checkPermissions(
      AndroidPermissionService.readMediaImages,
    );
    if (!hasCameraPerms && !hasReadMediaImagePerms) {
      Get.snackbar(
        "Permission denied",
        "No camera and/or read media image permissions",
      );
      return;
    }

    final result = await AndroidFileService.pickImageFromGallery();

    if (result == null) return;

    final bytes = await AndroidFileService.getFileBytes(result);
    imageBytes.value = bytes;
  }

  Future<bool> _checkPermissions(String permission) async {
    final hasPermission = await AndroidPermissionService.checkPermission(
      permission,
    );

    if (!hasPermission) {
      final granted = await AndroidPermissionService.requestPermission(
        permission,
      );
      return granted;
    }

    return hasPermission;
  }
}
