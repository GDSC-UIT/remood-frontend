import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/global_widgets/time_picker.dart';
import 'package:remood/app/modules/onboarding/onboarding_controller.dart';
import 'package:remood/app/modules/setting/setting_controller.dart';
import 'decoration.dart';
import 'time_title.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    final onboardingController = Get.find<OnboardingController>();

    return Container(
      decoration: OnboardingDecoration.imageBackround(
        onboardingController.pageIndex,
        onboardingController.contents[index].background,
      ),
      padding: onboardingController.isLastView(index)
          ? const EdgeInsets.all(0.0)
          : const EdgeInsets.all(30.0),

      /// App introduction page
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Intro image
          SizedBox(
              width: 297,
              height: 293,
              child: Image.asset(onboardingController.contents[index].image)),
          const SizedBox(height: 40.0),

          // Intro title
          Text(
            onboardingController.contents[index].title,
            style: CustomTextStyle.h1(AppColors.primary).copyWith(height: 1.7),
          ),

          // Intro paragraph
          Text(
            onboardingController.contents[index].content,
            textAlign: TextAlign.center,
            style: CustomTextStyle.normalText(AppColors.primary)
                .copyWith(height: 1.7),
          ),
        ],
      ),
    );
  }
}
