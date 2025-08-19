import 'package:get/get.dart';
import 'package:supercoder_test/app/routes/app_routes.dart';

class ProfileController extends RxController {
  void navigateToBasicInfo() => Get.toNamed(Routes.profileBasicInfo);
  void navigateToSetPassword() => Get.toNamed(Routes.profileSetPassword);
}
