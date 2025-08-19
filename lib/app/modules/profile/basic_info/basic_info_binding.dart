import 'package:get/get.dart';
import 'package:supercoder_test/app/modules/profile/basic_info/basic_info_controller.dart';

class ProfileBasicInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileBasicInfoController());
  }
}
