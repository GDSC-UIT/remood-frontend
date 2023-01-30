import 'package:flutter/material.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/global_widgets/time_picker.dart';
import 'package:remood/app/modules/onboarding/onboarding_controller.dart';
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

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: OnboardingDecoration.imageBackround(
          controller.contents[index].background),
      padding: controller.isLastView(index)
          ? const EdgeInsets.all(0.0)
          : const EdgeInsets.all(30.0),
      child: controller.isLastView(index)
          // Setting time page
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                // Time Setting Title
                TimeTitle(),
                SizedBox(height: 26.0),

                // Time picker
                TimePicker(),
                SizedBox(height: 18.0),
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
                  style: CustomTextStyle.normalText(AppColors.primary),
                ),
              ],
            ),
    );
  }
}