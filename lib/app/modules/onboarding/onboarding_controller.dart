import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/assets_images.dart';

class Onboarding {
  final String background;
  final String image;
  final String title;
  final String content;
  Onboarding(
      {required this.background,
      required this.image,
      required this.title,
      required this.content});
}

class OnboardingController extends GetxController {
  RxInt pageIndex = 0.obs;

  void updateIndex(int index) {
    pageIndex(index);
  }

  bool isLastView(int index) {
    if (index == contents.length - 1) {
      return true;
    }
    return false;
  }

  void previousScreen(PageController pageController) {
    pageController.previousPage(
        duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
  }

  List<Onboarding> get contents => [
        Onboarding(
            background: Assets.onboardingBackground1,
            image: Assets.onboardingImage1,
            title: "Diary",
            content:
                "Journal your thoughts and feelings with REMOOD’s diary for deeper self-awareness"),
        Onboarding(
            background: Assets.onboardingBackground2,
            image: Assets.onboardingImage2,
            title: "Freshmood",
            content:
                "Evaluate and boost your mood with Freshmood - Personalized diary journey and mood enhancing tips"),
        Onboarding(
            background: Assets.onboardingBackground3,
            image: Assets.onboardingImage3,
            title: "Report",
            content: "Mood meter, measuring happiness"),
        Onboarding(
            background: Assets.onboardingBackground,
            image: "",
            title: "",
            content: "This is time setting screen"),
      ];

  Obx buildDots(RxInt currentIndex, int index) {
    return Obx(
      () => Container(
        width: currentIndex == index.obs ? 20 : 8,
        height: currentIndex == index.obs ? 4 : 8,
        margin: const EdgeInsets.only(right: 3.5, left: 3.5),
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
