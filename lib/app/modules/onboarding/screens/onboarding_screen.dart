import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/modules/onboarding/onboarding_controller.dart';
import 'package:remood/app/modules/onboarding/widgets/onboarding_action_bar.dart';
import 'package:remood/app/modules/onboarding/widgets/onboarding_intro_button.dart';
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
    // final controller = Get.put(OnboardingController());
    PageController pageController = Get.put(PageController());

    void updateIndex(int index) {
      pageIndex(index);
    }

    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration:
              OnboardingDecoration.imageBackround(Assets.onboardingBackground),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    // Onboarding content
                    GetBuilder<OnboardingController>(
                      builder: (controller) {
                        return Expanded(
                          child: PageView.builder(
                            controller: pageController,
                            itemCount: controller.contents.length,
                            onPageChanged: (value) {
                              updateIndex(value);
                            },
                            itemBuilder: (_, i) {
                              return OnboardingContent(
                                  controller: controller, index: i);
                            },
                          ),
                        );
                      },
                    ),

                    // Action bar
                    GetBuilder<OnboardingController>(
                      builder: (controller) {
                        return ActionBar(
                            pageIndex: pageIndex, controler: controller);
                      },
                    ),
                  ],
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
                builder: (controller) {
                  return OnboardingButton(
                      pageIndex: pageIndex, content: controller.contents);
                },
              ),
              const SizedBox(height: 20.0)
            ],
          ),
        ),
      ),
    );
  }
}
