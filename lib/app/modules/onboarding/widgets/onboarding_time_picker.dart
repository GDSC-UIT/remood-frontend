import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/modules/onboarding/onboarding_controller.dart';
import 'package:remood/app/modules/onboarding/widgets/onboarding_time_hour.dart';
import 'package:remood/app/modules/onboarding/widgets/onboarding_time_minute.dart';

// ignore: must_be_immutable
class TimePicker extends StatelessWidget {
  TimePicker({
    Key? key,
    required this.hour,
    required this.minute,
  }) : super(key: key);

  RxInt hour;
  RxInt minute;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardingController>();

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColors.onboardingContainer,
      ),
      padding: const EdgeInsets.all(5.0),
      height: 60.0,
      width: 166.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Hour Picker
          Expanded(
            child: ListWheelScrollView.useDelegate(
              onSelectedItemChanged: (value) {
                controller.updateHour(hour, value);
              },
              itemExtent: 40,
              perspective: 0.005,
              physics: const FixedExtentScrollPhysics(),
              childDelegate: ListWheelChildBuilderDelegate(
                childCount: 24,
                builder: (context, index) {
                  return Hours(
                    hours: index,
                  );
                },
              ),
            ),
          ),

          Text(":", style: CustomTextStyle.timeNumber(AppColors.mainColor)),

          // Minute Picker
          Expanded(
            child: ListWheelScrollView.useDelegate(
              onSelectedItemChanged: (value) {
                controller.updateMinute(minute, value);
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
        ],
      ),
    );
  }
}
