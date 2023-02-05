import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/global_widgets/time_minute.dart';
import 'package:remood/app/modules/setting/setting_controller.dart';

class MinutePicker extends StatelessWidget {
  MinutePicker({
    Key? key,
  }) : super(key: key);

  final controller = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            log('minute++');
          },
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Image.asset(Assets.arrowUpward),
          ),
        ),
        SizedBox(
          height: 47,
          width: 36,
          child: ListWheelScrollView.useDelegate(
            onSelectedItemChanged: (value) {
              controller.updateMinute(value);
            },
            itemExtent: 40,
            perspective: 0.005,
            physics: const FixedExtentScrollPhysics(),
            childDelegate: ListWheelChildBuilderDelegate(
              childCount: 60,
              builder: (context, index) {
                return Minutes(
                  mins: index,
                );
              },
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            log('minute--');
          },
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Image.asset(Assets.arrowDownaward),
          ),
        ),
      ],
    );
  }
}
