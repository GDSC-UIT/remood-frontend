import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/modules/onboarding/onboarding_controller.dart';
import 'package:remood/app/modules/onboarding/widgets/onboarding_button.dart';
import 'package:remood/app/modules/onboarding/widgets/onboarding_content.dart';
import 'package:remood/app/modules/onboarding/widgets/onboarding_decoration.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  RxInt pageIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());

    void updateIndex(int index) {
      pageIndex(index);
    }

    return Scaffold(
      body: Container(
        decoration:
            OnboardingDecoration.imageBackround(Assets.onboardingBackground),
        child: Column(
          children: [
            // Onboarding content
            Expanded(
              child: PageView.builder(
                itemCount: controller.contents.length,
                onPageChanged: (value) {
                  updateIndex(value);
                },
                itemBuilder: (_, i) {
                  return OnboardingContent(controller: controller, index: i);
                },
              ),
            ),

            // Dots
            GetBuilder<OnboardingController>(
              builder: (controller) {
                return FittedBox(
                  child: Row(
                    children: List.generate(
                      controller.contents.length,
                      (index) => controller.buildDots(pageIndex, index),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20.0),

            //Onboarding button
            GetBuilder<OnboardingController>(
              builder: (_) {
                return OnboardingButton(
                    pageIndex: pageIndex, content: controller.contents);
              },
            ),
            const SizedBox(height: 40.0)
          ],
        ),
      ),
    );
  }
}
