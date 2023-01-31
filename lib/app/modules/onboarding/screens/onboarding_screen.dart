import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/modules/onboarding/onboarding_controller.dart';
import 'package:remood/app/modules/onboarding/widgets/action_bar.dart';
import 'package:remood/app/modules/onboarding/widgets/intro_button.dart';
import 'package:remood/app/modules/onboarding/widgets/content.dart';
import 'package:remood/app/modules/onboarding/widgets/decoration.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  RxInt pageIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OnboardingController>();
    final pageController = Get.put(PageController());

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
                    Expanded(
                      child: PageView.builder(
                        controller: pageController,
                        itemCount: controller.contents.length,
                        onPageChanged: (value) {
                          updateIndex(value);
                        },
                        itemBuilder: (_, i) {
                          return OnboardingContent(index: i);
                        },
                      ),
                    ),

                    // Action bar
                    ActionBar(pageIndex: pageIndex),
                  ],
                ),
              ),

              // Dots
              FittedBox(
                child: Row(
                  children: List.generate(
                    controller.contents.length,
                    (index) => controller.buildDots(pageIndex, index),
                  ),
                ),
              ),

              const SizedBox(height: 20.0),

              //Onboarding button
              OnboardingButton(pageIndex: pageIndex),

              const SizedBox(height: 20.0)
            ],
          ),
        ),
      ),
    );
  }
}
