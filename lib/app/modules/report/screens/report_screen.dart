import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/modules/report/report_controller.dart';

import 'package:remood/app/modules/report/widgets/show_date.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReportController());

    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Heading
            Text(
              "Report",
              style: CustomTextStyle.reportHeading(),
            ),
            // The date show data
            ShowDate(controller: controller),
            // Mood percentage of the day
            Stack(
              children: [
                Image.asset(Assets.reportPercentage),
                Container(
                  alignment: Alignment.center,
                  width: 151,
                  height: 146,
                  child: Obx(() => Text(
                        "${controller.percentage}%",
                        style: CustomTextStyle.reportText(
                            const Color(0xFF8F753F), 48),
                      )),
                ),
              ],
            ),
            // Average mood of the day
            Obx(() => Text(
                  '${controller.avgMood}',
                  style:
                      CustomTextStyle.reportText(const Color(0xFF130F26), 48),
                )),
          ],
        ),
      ),
    );
  }
}
