import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/modules/onboarding/onboarding_controller.dart';
import 'onboarding_decoration.dart';

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
    RxString hour = "05".obs;
    RxString minute = "12".obs;

    return Container(
      decoration: OnboardingDecoration.imageBackround(
          controller.contents[index].background),
      padding:
          isLastView() ? const EdgeInsets.all(0.0) : const EdgeInsets.all(30.0),
      child: isLastView()
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text
                Container(
                  color: AppColors.onboardingBackground,
                  height: 72,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Choose time to get notification",
                          style:
                              CustomTextStyle.mainStyle(AppColors.textBrown)),
                    ],
                  ),
                ),
                const SizedBox(height: 26.0),

                // Alarm clock
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: AppColors.onboardingContainer,
                  ),
                  padding: const EdgeInsets.all(5.0),
                  height: 60.0,
                  width: 166.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        hour.toString(),
                        style: CustomTextStyle.alarmNumber(AppColors.mainColor),
                      ),
                      Text(":",
                          style:
                              CustomTextStyle.alarmNumber(AppColors.mainColor)),
                      Text(minute.toString(),
                          style:
                              CustomTextStyle.alarmNumber(AppColors.mainColor)),
                    ],
                  ),
                ),
                const SizedBox(height: 18.0),
                Image.asset(Assets.onboardingAlarmImage),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(controller.contents[index].image),
                const SizedBox(height: 40.0),
                // Paragraph
                Text(
                  controller.contents[index].content,
                  style: CustomTextStyle.onboardingText(AppColors.primary),
                ),
              ],
            ),
    );
  }
}
