import 'package:get/route_manager.dart';
import 'package:supercoder_test/app/modules/campaign/campaign_binding.dart';
import 'package:supercoder_test/app/modules/campaign/campaign_view.dart';
import 'package:supercoder_test/app/modules/home/home_binding.dart';
import 'package:supercoder_test/app/modules/home/home_view.dart';
import 'package:supercoder_test/app/modules/profile/basic_info/basic_info_binding.dart';
import 'package:supercoder_test/app/modules/profile/basic_info/basic_info_view.dart';
import 'package:supercoder_test/app/modules/profile/profile_binding.dart';
import 'package:supercoder_test/app/modules/profile/profile_view.dart';
import 'package:supercoder_test/app/modules/profile/set_password/set_password_binding.dart';
import 'package:supercoder_test/app/modules/profile/set_password/set_password_view.dart';
import 'package:supercoder_test/app/modules/splash/splash_binding.dart';
import 'package:supercoder_test/app/routes/app_routes.dart';
import 'package:supercoder_test/app/modules/splash/splash_view.dart';

class Pages {
  static final routes = [
    GetPage(
      name: Routes.splash,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(name: Routes.home, page: () => HomeView(), binding: HomeBinding()),
    GetPage(
      name: Routes.campaign,
      page: () => CampaignView(),
      binding: CampaignBinding(),
    ),
    GetPage(
      name: Routes.profile,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.profileBasicInfo,
      page: () => ProfileBasicInfoView(),
      binding: ProfileBasicInfoBinding(),
    ),
    GetPage(
      name: Routes.profileSetPassword,
      page: () => ProfileSetPasswordView(),
      binding: ProfileSetPasswordBinding(),
    ),
  ];
}
