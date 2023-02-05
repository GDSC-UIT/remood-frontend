import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return Stack(
      children: [
        Image.asset(Assets.reportPercentage),
        Container(
          alignment: Alignment.center,
          width: 151,
          height: 146,
          child: Obx(() => Text(
                "${controller.percentage}%",
                style: CustomTextStyle.customh2(const Color(0xFF8F753F), 48),
              )),
        ),
      ],
    );
  }
}
