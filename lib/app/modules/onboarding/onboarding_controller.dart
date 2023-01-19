import 'package:get/get.dart';
import 'package:remood/app/core/values/assets_images.dart';

class OnboardingContent {
  final String background;
  final String image;
  final String content;
  OnboardingContent(
      {required this.background, required this.image, required this.content});
}

class OnboardingController extends GetxController {
  List<OnboardingContent> get contents => [
        OnboardingContent(
            background: Assets.onboardingBackground1,
            image: Assets.onboardingImage1,
            content:
                "This is onboarding content 1. This is onboarding content 1. "
                "This is onboarding content 1. This is onboarding content 1. "
                "This is onboarding content 1. This is onboarding content 1. "
                "This is onboarding content 1. This is onboarding content 1. "
                "This is onboarding content 1. This is onboarding content 1. "),
        OnboardingContent(
            background: Assets.onboardingBackground2,
            image: Assets.onboardingImage2,
            content:
                "This is onboarding content 2. This is onboarding content 2. "
                "This is onboarding content 2. This is onboarding content 2. "
                "This is onboarding content 2. This is onboarding content 2. "
                "This is onboarding content 2. This is onboarding content 2. "
                "This is onboarding content 2. This is onboarding content 2. "),
        OnboardingContent(
            background: Assets.onboardingBackground3,
            image: Assets.onboardingImage3,
            content:
                "This is onboarding content 3. This is onboarding content 3. "
                "This is onboarding content 3. This is onboarding content 3. "
                "This is onboarding content 3. This is onboarding content 3. "
                "This is onboarding content 3. This is onboarding content 3. "
                "This is onboarding content 3. This is onboarding content 3. "),
      ];
}
