import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/global_widgets/time_ampm.dart';
import 'package:remood/app/modules/setting/setting_controller.dart';

class AmpmPicker extends StatelessWidget {
  AmpmPicker({
    Key? key,
  }) : super(key: key);

  final controller = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    double itemExtent = 40;
    double boxSize = 36;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            log('AM');
            controller.ampmController.animateTo(
              controller.ampmController.offset - itemExtent,
              duration: const Duration(milliseconds: 80),
              curve: Curves.easeInOut,
            );
          },
          child: SizedBox(
              height: boxSize,
              width: boxSize,
              child: Image.asset(Assets.arrowUpward)),
        ),
        SizedBox(
          height: 47,
          width: 36,
          child: ListWheelScrollView.useDelegate(
            controller: controller.ampmController,
            onSelectedItemChanged: (value) {},
            itemExtent: itemExtent,
            perspective: 0.005,
            physics: const FixedExtentScrollPhysics(),
            childDelegate: ListWheelChildBuilderDelegate(
              childCount: 2,
              builder: (context, index) {
                return AmPm(ampm: index);
              },
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            log('PM');
            controller.ampmController.animateTo(
              controller.ampmController.offset + itemExtent,
              duration: const Duration(milliseconds: 80),
              curve: Curves.easeInOut,
            );
          },
          child: SizedBox(
              width: boxSize,
              height: boxSize,
              child: Image.asset(Assets.arrowDownaward)),
        ),
      ],
    );
  }
}
