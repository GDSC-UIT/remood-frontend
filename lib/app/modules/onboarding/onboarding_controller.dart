import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/assets_images.dart';

class Onboarding {
  final String background;
  final String image;
  final String content;
  Onboarding(
      {required this.background, required this.image, required this.content});
}

class OnboardingController extends GetxController {
  late RxInt hour = 0.obs;
  late RxInt minute = 0.obs;
  late RxInt ampm = 0.obs;

  void updateHour(int value) {
    hour(value);
    log("hour: $hour");
  }

  void updateMinute(int value) {
    minute(value);
    log("min: $minute");
  }

  void updateAmPm(int value) {
    // am is 0, pm is 1
    ampm(value);
    log("ampm: $ampm");
  }

  bool isLastView(int index) {
    if (index == contents.length - 1) {
      return true;
    }
    return false;
  }

  List<Onboarding> get contents => [
        Onboarding(
            background: Assets.onboardingBackground1,
            image: Assets.onboardingImage1,
            content:
                "This is onboarding content 1. This is onboarding content 1. "
                "This is onboarding content 1. This is onboarding content 1. "
                "This is onboarding content 1. This is onboarding content 1. "
                "This is onboarding content 1. This is onboarding content 1. "
                "This is onboarding content 1. This is onboarding content 1. "),
        Onboarding(
            background: Assets.onboardingBackground2,
            image: Assets.onboardingImage2,
            content:
                "This is onboarding content 2. This is onboarding content 2. "
                "This is onboarding content 2. This is onboarding content 2. "
                "This is onboarding content 2. This is onboarding content 2. "
                "This is onboarding content 2. This is onboarding content 2. "
                "This is onboarding content 2. This is onboarding content 2. "),
        Onboarding(
            background: Assets.onboardingBackground3,
            image: Assets.onboardingImage3,
            content:
                "This is onboarding content 3. This is onboarding content 3. "
                "This is onboarding content 3. This is onboarding content 3. "
                "This is onboarding content 3. This is onboarding content 3. "
                "This is onboarding content 3. This is onboarding content 3. "
                "This is onboarding content 3. This is onboarding content 3. "),
        Onboarding(
            background: Assets.onboardingBackground,
            image: "",
            content: "This is time setting screen"),
      ];

  Obx buildDots(RxInt currentIndex, int index) {
    return Obx(
      () => Container(
        width: currentIndex == index.obs ? 20 : 8,
        height: currentIndex == index.obs ? 4 : 8,
        margin: const EdgeInsets.only(right: 7.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: currentIndex == index.obs
              ? AppColors.mainColor
              : AppColors.darkgrey,
        ),
      ),
    );
  }
}
