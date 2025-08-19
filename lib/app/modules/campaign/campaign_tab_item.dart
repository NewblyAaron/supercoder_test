import 'package:flutter/material.dart';
import 'package:supercoder_test/app/utils/app_theme.dart';

class CampaignTabItem extends StatelessWidget {
  const CampaignTabItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: SizedBox(
        height: 100,
        child: Row(
          children: [
            Container(
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade400,
              ),
              child: const Center(
                child: Icon(Icons.image, color: Colors.white70),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Company Name",
                    style: AppTheme.baseTextStyle.copyWith(fontSize: 14),
                  ),
                  Text(
                    "Introduction line",
                    style: AppTheme.baseTextStyle.copyWith(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Spacer(),
                  _buildTagsRow(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildTagsRow() {
    return Row(
      children: [
        _buildTag("Tag 1"),
        _buildTag("Tag 2"),
        _buildTag("Tag 3"),
        _buildTag("Long Tag 4"),
      ],
    );
  }

  Widget _buildTag(String text) {
    return Container(
      decoration: BoxDecoration(color: Color(0xfff8f3fe)),
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      child: Text(
        text,
        style: AppTheme.baseTextStyle.copyWith(
          fontSize: 10,
          color: Color(0xff8130ef),
        ),
      ),
    );
  }
}
