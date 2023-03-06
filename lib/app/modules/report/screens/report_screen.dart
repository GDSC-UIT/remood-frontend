import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/modules/report/report_controller.dart';
import 'package:remood/app/modules/report/widgets/button.dart';
import 'package:remood/app/modules/report/widgets/mood_percentage.dart';

import 'package:remood/app/modules/report/widgets/show_date.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReportController());
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Heading
            SizedBox(
              height: 20,
            ),
            Text(
              "Report",
              style: CustomTextStyle.reportHeading(),
            ),

            // The date show data
            ShowDate(controller: controller),
            SizedBox(
              height: _screenHeight * 0.09,
            ),
            // Mood percentage of the day
            MoodPercentage(controller: controller),

            // Average mood of the day
            SizedBox(
              height: _screenHeight * 0.145,
            ),
            Button(),
          ],
        ),
      ),
    );
  }
}
