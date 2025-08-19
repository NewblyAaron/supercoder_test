import 'package:get/get.dart';
import 'package:supercoder_test/app/modules/campaign/campaign_controller.dart';

class CampaignBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CampaignController());
  }
}
