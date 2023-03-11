import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/data/services/media_query_service.dart';
import 'package:remood/app/modules/report/report_controller.dart';
import 'package:remood/app/modules/setting/setting_controller.dart';

class MoodPercentage extends StatelessWidget {
  const MoodPercentage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ReportController controller;

  @override
  Widget build(BuildContext context) {
    /// Data
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    var pctWidth = MediaQueryService().pctWidth(context);
    var pctHeight = MediaQueryService().pctHeight(context);

    return Stack(
      children: [
        Container(
          height: _screenHeight * 0.34,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(36),
              color: AppColors.reportContainer),
        ),
        Positioned(
          top: _screenHeight * 0.043,
          left: _screenWidth * 0.29,
          child: SizedBox(
              width: _screenWidth * 0.42,
              height: _screenHeight * 0.193,
              child: Image.asset(Assets.reportPercentage)),
        ),
        Positioned(
          top: _screenHeight * 0.05,
          left: _screenWidth * 0.3,
          child: Container(
            alignment: Alignment.center,
            width: pctWidth * 151,
            height: pctHeight * 146,
            child: Obx(() => Text(
                  "${controller.percentage}%",
                  style: CustomTextStyle.customh2(const Color(0xFF8F753F), 40),
                )),
          ),
        ),
        Positioned(
          bottom: 7,
          left: _screenWidth * 0.323,
          child: Obx(() => Text(
                '${controller.avgMood}',
                style: CustomTextStyle.textReport(),
              )),
        ),
      ],
    );
  }
}
