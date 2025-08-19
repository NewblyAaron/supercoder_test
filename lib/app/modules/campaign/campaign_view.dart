import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supercoder_test/app/modules/campaign/campaign_controller.dart';
import 'package:supercoder_test/app/modules/campaign/campaign_tab_view.dart';
import 'package:supercoder_test/app/utils/app_theme.dart';

class CampaignView extends StatefulWidget {
  const CampaignView({super.key});

  @override
  State<CampaignView> createState() => _CampaignViewState();
}

class _CampaignViewState extends State<CampaignView> {
  final _controller = Get.find<CampaignController>();
  var selectedIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DefaultTabController(
        initialIndex: selectedIndex.value,
        length: 3,
        child: Scaffold(
          appBar: AppBar(),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Campaign Matching",
                    textAlign: TextAlign.left,
                    style: AppTheme.baseTextStyle.copyWith(fontSize: 28),
                  ),
                ),
                SizedBox(height: 30),
                TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    Tab(text: "New"),
                    Tab(text: "In Progress"),
                    Tab(text: "Complete"),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      CampaignTabView(),
                      CampaignTabView(),
                      CampaignTabView(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
