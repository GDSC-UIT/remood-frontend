import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/global_widgets/time_picker_ampm.dart';
import 'package:remood/app/global_widgets/time_picker_hour.dart';
import 'package:remood/app/global_widgets/time_picker_minute.dart';
import 'package:remood/app/modules/onboarding/onboarding_controller.dart';

// ignore: must_be_immutable
class TimePicker extends StatelessWidget {
  const TimePicker({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardingController>();

    return Container(
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 10.0,
            color: Color(0xfff2f2f2),
          ),
        ],
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(5.0),
      height: 139.0,
      width: 254.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Hour Picker
          Expanded(
            child: HourPicker(controller: controller),
          ),

          Text(":",
              style: CustomTextStyle.normalText(Colors.black)
                  .copyWith(fontSize: 18)),

          // Minute Picker
          Expanded(
            child: MinutePicker(controller: controller),
          ),

          // AM/PM Picker
          Expanded(
            child: AmpmPicker(controller: controller),
          ),
        ],
      ),
    );
  }
}
