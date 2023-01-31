import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/global_widgets/time_ampm.dart';
import 'package:remood/app/modules/setting/setting_controller.dart';

class AmpmPicker extends StatelessWidget {
  AmpmPicker({
    Key? key,
  }) : super(key: key);

  final controller = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 47,
      width: 36,
      child: ListWheelScrollView.useDelegate(
        onSelectedItemChanged: (value) {
          controller.updateAmPm(value);
        },
        itemExtent: 40,
        perspective: 0.005,
        physics: const FixedExtentScrollPhysics(),
        childDelegate: ListWheelChildBuilderDelegate(
          childCount: 2,
          builder: (context, index) {
            return AmPm(ampm: index);
          },
        ),
      ),
    );
  }
}
