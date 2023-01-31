import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/global_widgets/time_picker_ampm.dart';
import 'package:remood/app/global_widgets/time_picker_hour.dart';
import 'package:remood/app/global_widgets/time_picker_minute.dart';
import 'package:remood/app/modules/setting/setting_controller.dart';

class TimePicker extends StatelessWidget {
  const TimePicker({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SettingController>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Hour Picker
        Expanded(
          child: HourPicker(),
        ),

        Text(":",
            style: CustomTextStyle.normalText(Colors.black)
                .copyWith(fontSize: 18)),

        // Minute Picker
        Expanded(
          child: MinutePicker(),
        ),

        // AM/PM Picker
        Expanded(
          child: AmpmPicker(),
        ),
      ],
    );
  }
}
