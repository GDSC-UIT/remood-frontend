import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/modules/report/report_controller.dart';

class ShowDate extends StatelessWidget {
  const ShowDate({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ReportController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Go to the previous date
          IconButton(
            onPressed: () {
              controller.previousDate();
            },
            icon: Image.asset(Assets.arrowLeftCircle),
          ),
          // Current date
          Obx(
            () => Container(
              alignment: Alignment.center,
              width: 95,
              child: Text(
                '${controller.date}',
                style: CustomTextStyle.customh2(const Color(0xFFB3B1B0), 14),
              ),
            ),
          ),
          // Go to the next day
          IconButton(
            onPressed: () {
              controller.nextDate();
            },
            icon: Image.asset(Assets.arrowRightCircle),
          ),
        ],
      ),
    );
  }
}
