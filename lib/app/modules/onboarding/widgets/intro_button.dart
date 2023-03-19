import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/modules/onboarding/onboarding_controller.dart';
import 'package:remood/app/modules/setting/setting_controller.dart';
import 'package:remood/app/routes/app_routes.dart';

class OnboardingButton extends StatefulWidget {
  const OnboardingButton({
    Key? key,
    required this.pageIndex,
  }) : super(key: key);
  final RxInt pageIndex;

  @override
  State<OnboardingButton> createState() => _OnboardingButtonState();
}

class _OnboardingButtonState extends State<OnboardingButton> {
  final OnboardingController onboardingController = Get.find();
  final PageController pageController = Get.find();
  final SettingController settingController = Get.find();
  final localTime = DateTime.now().toLocal();

  void nextScreen() async {
    log(widget.pageIndex.toString());

    /// The current page is the last page
    if (widget.pageIndex == (onboardingController.contents.length - 1).obs) {
      Get.toNamed(AppRoutes.scheduleNotification);
    }

    /// Navigate to the next page
    pageController.nextPage(
        duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 52.0,
      width: double.infinity,
      child: MaterialButton(
        onPressed: () => nextScreen(),
        color: AppColors.mainColor,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        child: const Text(
          "Continue",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
        ),
      ),
    );
  }
}
