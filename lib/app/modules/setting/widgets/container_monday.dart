import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/modules/setting/setting_controller.dart';

class ContainerFirstDayMonday extends StatelessWidget {
  const ContainerFirstDayMonday({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SettingController>();
    String label = 'Monday';

    return GestureDetector(
      onTap: () => controller.onTapMonday(),
      child: Obx(() => Container(
            alignment: Alignment.center,
            width: 268,
            height: 46,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.0,
                color: AppColors.mainColor,
              ),
              borderRadius: BorderRadius.circular(16.0),
              color: controller.getIsMonday
                  ? AppColors.mainColor
                  : Colors.transparent,
            ),
            child: Text(
              label,
              style: CustomTextStyle.h3(
                  controller.getIsMonday ? Colors.white : AppColors.mainColor),
            ),
          )),
    );
  }
}
