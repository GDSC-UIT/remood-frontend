import 'package:flutter/material.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/modules/onboarding/widgets/onboarding_decoration.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: 3,
        itemBuilder: (_, i) {
          return Container(
            decoration: OnboardingDecoration.imageBackround(Assets.onboarding1),
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Background

                // Paragraph
                Center(
                  child: Text(
                    "This is a paragraph. This is a paragraph. This is a paragraph. "
                    "This is a paragraph. This is a paragraph. This is a paragraph. "
                    "This is a paragraph. This is a paragraph. This is a paragraph. "
                    "This is a paragraph. This is a paragraph. ",
                    style: CustomTextStyle.onboardingText(AppColors.primary),
                  ),
                ),
                // Dots

                // Next screen
                ElevatedButton(onPressed: () {}, child: const Text("Next"))
              ],
            ),
          );
        },
      ),
    );
  }
}
