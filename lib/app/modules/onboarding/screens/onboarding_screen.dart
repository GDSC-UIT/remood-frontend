import 'package:flutter/material.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/modules/onboarding/widgets/onboarding_button.dart';
import 'package:remood/app/modules/onboarding/widgets/onboarding_decoration.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:
            OnboardingDecoration.imageBackround(Assets.onboardingBackground),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: 3,
                itemBuilder: (_, i) {
                  // TODO: Tạo widget Onboarding content
                  return Container(
                    decoration: OnboardingDecoration.imageBackround(
                        Assets.onboardingBackground1),
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(Assets.onboardingImage1),
                        // Paragraph
                        Text(
                          "This is a paragraph. This is a paragraph. This is a paragraph. "
                          "This is a paragraph. This is a paragraph. This is a paragraph. "
                          "This is a paragraph. This is a paragraph. This is a paragraph. "
                          "This is a paragraph. This is a paragraph. ",
                          style:
                              CustomTextStyle.onboardingText(AppColors.primary),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // todo: Dots
            // Row
            // List.generate
            // Container
            const OnboardingButton(),
          ],
        ),
      ),
    );
  }
}
