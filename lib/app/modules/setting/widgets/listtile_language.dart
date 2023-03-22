import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/modules/setting/setting_controller.dart';

class ListTileLaguage extends StatelessWidget {
  const ListTileLaguage({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SettingController>();

    return GestureDetector(
      onTap: () {
        log('Tap');
        controller.activeLanguage(index);
      },
      child: Obx(() => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListTile(
              // Language label
              title: Text(
                controller.lanList[index].label,
                style: controller.getStyleLan(index),
              ),
              trailing: Checkbox(
                activeColor: AppColors.mainColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
                value: controller.lanList[index].actived.value,
                onChanged: (_) => controller.activeLanguage(index),
              ),
            ),
          )),
    );
  }
}
