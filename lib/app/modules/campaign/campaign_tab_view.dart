import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:supercoder_test/app/modules/campaign/campaign_tab_item.dart';

class CampaignTabView extends StatelessWidget {
  const CampaignTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(left: 20, right: 20, top: 30),
      children: List.filled(6, CampaignTabItem()),
    );
  }
}
