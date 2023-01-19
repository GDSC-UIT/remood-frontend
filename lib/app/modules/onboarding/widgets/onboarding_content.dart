import 'package:flutter/material.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/text_style.dart';
import '../onboarding_controller.dart';
import 'onboarding_decoration.dart';

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
      padding: const EdgeInsets.all(30.0),
      child: Column(
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
