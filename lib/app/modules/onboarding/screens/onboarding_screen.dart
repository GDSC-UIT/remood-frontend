import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/modules/onboarding/onboarding_controller.dart';
import 'package:remood/app/modules/onboarding/widgets/action_bar.dart';
import 'package:remood/app/modules/onboarding/widgets/intro_button.dart';
import 'package:remood/app/modules/onboarding/widgets/content.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<OnboardingController>();
    final pageController = Get.put(PageController());

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  // Onboarding content
                  GetBuilder<OnboardingController>(
                    builder: (controller) {
                      return Column(
                        children: [
                          Expanded(
                            child: PageView.builder(
                              controller: pageController,
                              itemCount: controller.contents.length,
                              onPageChanged: (value) {
                                controller.updateIndex(value);
                              },
                              itemBuilder: (_, i) {
                                return OnboardingContent(index: i);
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  ),

                  // Action bar
                  GetBuilder<OnboardingController>(
                    builder: (controller) {
                      return ActionBar(
                        pageIndex: controller.pageIndex,
                      );
                    },
                  ),

                  /// Page control
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // Dots
                      GetBuilder<OnboardingController>(
                        builder: (controller) {
                          return FittedBox(
                            child: Row(
                              children: List.generate(
                                controller.contents.length,
                                (index) => controller.buildDots(
                                    controller.pageIndex, index),
                              ),
                            ),
                          );
                        },
                      ),

                      const SizedBox(height: 20.0),

                      //Onboarding button
                      GetBuilder<OnboardingController>(
                        builder: (controller) {
                          return OnboardingButton(
                              pageIndex: controller.pageIndex);
                        },
                      ),
                      const SizedBox(height: 20.0)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
