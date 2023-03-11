import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/global_widgets/time_hour.dart';
import 'package:remood/app/modules/setting/setting_controller.dart';

class HourPicker extends StatelessWidget {
  HourPicker({
    Key? key,
  }) : super(key: key);

  final controller = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    /// Data
    double itemExtent = 40;
    double boxSize = 36;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            log('hour--');
            controller.hourController.animateTo(
              controller.hourController.offset - itemExtent,
              duration: const Duration(milliseconds: 80),
              curve: Curves.easeInOut,
            );
          },
          child: SizedBox(
            height: boxSize,
            width: boxSize,
            child: Image.asset(Assets.arrowUpward),
          ),
        ),
        SizedBox(
          height: 47,
          width: 36,
          child: ListWheelScrollView.useDelegate(
            controller: controller.hourController,
            onSelectedItemChanged: (value) {},
            itemExtent: itemExtent,
            perspective: 0.005,
            physics: const FixedExtentScrollPhysics(),
            childDelegate: ListWheelChildBuilderDelegate(
              childCount: 12,
              builder: (context, index) {
                // hour from 1 to 12 and controller index from 0 to 11
                return Hours(
                  hours: index + 1,
                );
              },
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            log('hour++');
            controller.hourController.animateTo(
              controller.hourController.offset + itemExtent,
              duration: const Duration(milliseconds: 80),
              curve: Curves.easeInOut,
            );
          },
          child: SizedBox(
            height: boxSize,
            width: boxSize,
            child: Image.asset(Assets.arrowDownaward),
          ),
        ),
      ],
    );
  }
}
