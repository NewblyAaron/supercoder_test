import 'package:get/get.dart';
import 'package:supercoder_test/app/modules/profile/set_password/set_password_controller.dart';

class ProfileSetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileSetPasswordController());
  }
}
