import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/modules/onboarding/onboarding_controller.dart';
import 'package:remood/app/modules/onboarding/widgets/time_picker.dart';
import 'decoration.dart';
import 'time_title.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    Key? key,
    required this.controller,
    required this.index,
  }) : super(key: key);

  final OnboardingController controller;
  final int index;

  bool isLastView() {
    if (index == controller.contents.length - 1) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    // Time to get notification
    RxInt hour = 0.obs;
    RxInt minute = 0.obs;

    return Container(
      decoration: OnboardingDecoration.imageBackround(
          controller.contents[index].background),
      padding:
          isLastView() ? const EdgeInsets.all(0.0) : const EdgeInsets.all(30.0),
      child: isLastView()
          // Setting time page
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Time Setting Title
                const TimeTitle(),
                const SizedBox(height: 26.0),

                // Time picker
                TimePicker(hour: hour, minute: minute),
                const SizedBox(height: 18.0),

                // Alarm image
                Image.asset(Assets.onboardingAlarm),
              ],
            )
          // App intro page
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Intro image
                Image.asset(controller.contents[index].image),
                const SizedBox(height: 40.0),

                // Intro paragraph
                Text(
                  controller.contents[index].content,
                  style: CustomTextStyle.onboardingText(AppColors.primary),
                ),
              ],
            ),
    );
  }
}
