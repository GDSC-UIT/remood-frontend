import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/modules/report/report_controller.dart';

class MoodPercentage extends StatelessWidget {
  const MoodPercentage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ReportController controller;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          height: screenHeight * 0.34,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(36),
              color: AppColors.reportContainer),
        ),
        Positioned(
          top: screenHeight * 0.043,
          left: screenWidth * 0.29,
          child: SizedBox(
              width: screenWidth * 0.42,
              height: screenHeight * 0.193,
              child: Image.asset(Assets.reportPercentage)),
        ),
        Positioned(
          top: screenHeight * 0.05,
          left: screenWidth * 0.3,
          child: Container(
            alignment: Alignment.center,
            width: 151,
            height: 146,
            child: Obx(() => Text(
                  "${controller.percentage}%",
                  style: CustomTextStyle.customh2(const Color(0xFF8F753F), 48),
                )),
          ),
        ),
        Positioned(
          bottom: 7,
          left: screenWidth * 0.323,
          child: Obx(() => Text(
                '${controller.avgMood}',
                style: CustomTextStyle.textReport(),
              )),
        ),
      ],
    );
  }
}
