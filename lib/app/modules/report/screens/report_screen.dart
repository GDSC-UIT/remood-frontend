import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/modules/report/report_controller.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final reportController = Get.put(ReportController());

    int percentage = 60;
    String avgMood = "Happy";

    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      body: Container(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Report",
                style: CustomTextStyle.reportHeading(),
              ),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        // TODO: Previous date
                      },
                      icon: Image.asset(Assets.arrowLeftCircle),
                    ),
                    GetBuilder<ReportController>(
                      builder: (controller) {
                        return Obx(
                          () {
                            // TODO: Tự động cập nhật mỗi lần bấm next date
                            log(controller.date.toString());
                            return Text(
                              controller.date.toString(),
                              style: CustomTextStyle.reportText(
                                  const Color(0xFFB3B1B0), 14),
                            );
                          },
                        );
                      },
                    ),
                    IconButton(
                      onPressed: () {
                        // TODO: Next date
                        reportController.nextDate(reportController);
                      },
                      icon: Image.asset(Assets.arrowRightCircle),
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  Image.asset(Assets.reportPercentage),
                  SizedBox(
                    width: 151,
                    height: 146,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "$percentage%",
                          style: CustomTextStyle.reportText(
                              const Color(0xFF8F753F), 48),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Text(
                avgMood,
                style: CustomTextStyle.reportText(const Color(0xFF130F26), 48),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
