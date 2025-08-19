import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:supercoder_test/app/routes/app_routes.dart';
import 'package:supercoder_test/app/services/android_file_service.dart';

class HomeController extends GetxController {
  var imageBytes = Rxn<Uint8List?>();

  void selectImage() async {
    final result = await AndroidFileService.pickImageFromGallery();

    if (result == null) return;

    final bytes = await AndroidFileService.getFileBytes(result);
    imageBytes.value = bytes;
  }

  void navigateToCampaign() => Get.toNamed(Routes.campaign);
  void navigateToProfile() => Get.toNamed(Routes.profile);
}
