import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/modules/setting/setting_controller.dart';

class ContainerFirstDaySunday extends StatelessWidget {
  const ContainerFirstDaySunday({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Controller
    final SettingController controller = Get.find();

    // Data
    String label = 'Sunday';
    var isSunday = controller.isSunday;
    isSunday(controller.setting.value.isSundayFirstDayOfWeek);

    return GestureDetector(
      onTap: () => controller.onTapSunday(),
      child: Obx(
        () => Container(
          alignment: Alignment.center,
          width: 268,
          height: 46,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.0,
              color: AppColors.mainColor,
            ),
            borderRadius: BorderRadius.circular(16.0),
            color: isSunday.value ? AppColors.mainColor : Colors.transparent,
          ),
          child: Text(
            label,
            style: CustomTextStyle.h3(
                isSunday.value ? Colors.white : AppColors.mainColor),
          ),
        ),
      ),
    );
  }
}
