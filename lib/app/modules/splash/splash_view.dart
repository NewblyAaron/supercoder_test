import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supercoder_test/app/modules/splash/splash_controller.dart';
import 'package:supercoder_test/app/utils/app_theme.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SplashController>();

    // Navigate to HomeScreen after 3 seconds
    Future.delayed(
      Duration(seconds: 3),
      () => controller.navigateToHomeScreen(),
    );

    return Scaffold(
      backgroundColor: Color(0xff440d7e),
      body: Center(
        child: Text(
          "MY FLYN",
          style: AppTheme.baseTextStyle.copyWith(
            fontSize: 40,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
