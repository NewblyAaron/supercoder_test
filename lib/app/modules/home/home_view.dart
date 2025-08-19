import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supercoder_test/app/modules/home/home_controller.dart';
import 'package:supercoder_test/app/app_theme.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            _buildHeader(),
            SizedBox(height: 30),
            _buildCampaignButton(),
            SizedBox(height: 20),
            ListTile(
              title: Text("Profile", style: TextStyle(fontSize: 14)),
              leading: const Icon(Icons.person_outline, size: 16),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: _controller.navigateToProfile,
            ),
            Divider(),
            ListTile(
              title: Text("Announcements", style: TextStyle(fontSize: 14)),
              leading: const Icon(Icons.announcement_outlined, size: 16),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
            Divider(),
            ListTile(
              title: Text("Inquiry", style: TextStyle(fontSize: 14)),
              leading: const Icon(Icons.question_answer_outlined, size: 16),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
            Divider(),
            ListTile(
              title: Text("FAQ", style: TextStyle(fontSize: 14)),
              leading: const Icon(Icons.question_mark_outlined, size: 16),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
            Divider(),
            ListTile(
              title: Text("Terms and Service", style: TextStyle(fontSize: 14)),
              leading: const Icon(Icons.checklist_outlined, size: 16),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
            Divider(),
            ListTile(
              title: Text("Log out", style: TextStyle(fontSize: 14)),
              leading: const Icon(Icons.logout_outlined, size: 16),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
            Divider(),
            ListTile(
              title: Text("Cancel Membership", style: TextStyle(fontSize: 14)),
              leading: const Icon(Icons.cancel_presentation_outlined, size: 16),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }

  Widget _buildCampaignButton() {
    return Material(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: _controller.navigateToCampaign,
        borderRadius: BorderRadius.circular(8),
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Color(0xfff2f2f2),
          ),
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "My Campaign",
                    style: AppTheme.baseTextStyle.copyWith(fontSize: 12),
                  ),
                  Spacer(),
                  const Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),
              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "0",
                          style: AppTheme.baseTextStyle.copyWith(
                            color: Color(0xff8130ef),
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "New",
                          style: AppTheme.baseTextStyle.copyWith(
                            color: Color(0xff2e2e2e),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: Color(0xffbcbcbc),
                    ),
                    Column(
                      children: [
                        Text(
                          "0",
                          style: AppTheme.baseTextStyle.copyWith(
                            color: Color(0xff8130ef),
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "Progress",
                          style: AppTheme.baseTextStyle.copyWith(
                            color: Color(0xff2e2e2e),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 14,
                      color: Color(0xffbcbcbc),
                    ),
                    Column(
                      children: [
                        Text(
                          "0",
                          style: AppTheme.baseTextStyle.copyWith(
                            color: Color(0xff8130ef),
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "Complete",
                          style: AppTheme.baseTextStyle.copyWith(
                            color: Color(0xff2e2e2e),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello,",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
              ),
              Text(
                "User",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 28),
              ),
            ],
          ),
          Spacer(),
          Obx(
            () => GestureDetector(
              onTap: _controller.selectImage,
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xfff2f2f2),
                  image: _controller.imageBytes.value != null
                      ? DecorationImage(
                          image: MemoryImage(_controller.imageBytes.value!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: _controller.imageBytes.value == null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.camera_alt_outlined,
                            size: 16,
                            color: Color(0xff878787),
                          ),
                          Text(
                            "Select image",
                            style: TextStyle(
                              color: Color(0xff878787),
                              fontSize: 8,
                            ),
                          ),
                        ],
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
