import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supercoder_test/app/modules/profile/profile_controller.dart';
import 'package:supercoder_test/app/app_theme.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Profile",
                textAlign: TextAlign.left,
                style: AppTheme.baseTextStyle.copyWith(fontSize: 28),
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  ListTile(
                    title: Text("Basic Info"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: controller.navigateToBasicInfo,
                  ),
                  Divider(),
                  ListTile(
                    title: Text("Set Password"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: controller.navigateToSetPassword,
                  ),
                  Divider(),
                  ListTile(
                    title: Text("Interests"),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                  Divider(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
