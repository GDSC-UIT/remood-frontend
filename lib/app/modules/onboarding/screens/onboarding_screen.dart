import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/modules/onboarding/onboarding_controller.dart';
import 'package:remood/app/modules/onboarding/widgets/onboarding_button.dart';
import 'package:remood/app/modules/onboarding/widgets/onboarding_decoration.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    return Scaffold(
      body: Container(
        decoration:
            OnboardingDecoration.imageBackround(Assets.onboardingBackground),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: controller.contents.length,
                itemBuilder: (_, i) {
                  // TODO: Tạo widget Onboarding content
                  return Container(
                    decoration: OnboardingDecoration.imageBackround(
                        controller.contents[i].background),
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(controller.contents[i].image),
                        const SizedBox(height: 40.0),
                        // Paragraph
                        Text(
                          controller.contents[i].content,
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
