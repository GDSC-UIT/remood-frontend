import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/data/models/setting_box.dart';
import 'package:remood/app/data/services/permission_service.dart';
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
    if (widget.pageIndex == (onboardingController.contents.length - 1).obs) {
      Get.toNamed(AppRoutes.loginScreen);
    }

    log(widget.pageIndex.toString());

    /// When the next page is setting time one,
    /// init scroll position with local data
    if (widget.pageIndex.value == 2) {
      log(DateTime.now().toString());
    }

    /// When the current page is setting time one,
    /// save data locally
    if (widget.pageIndex.value == 3) {
      /// Ask for notification permission
      await PermissionService.askPermissionFirstTime();
      settingController.saveTimeOnboarding();
    }
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
        onPressed: () {
          var titleNotificationScreen = "Setting notification time";
          // TODO: If this screen is setting time screen, it will update current time in setting controller
          if (onboardingController.contents[widget.pageIndex.value].title ==
              titleNotificationScreen) {}
          nextScreen();
        },
        color: AppColors.mainColor,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        child: Obx(
          () => Text(
            widget.pageIndex == (onboardingController.contents.length - 1).obs
                ? "Continue"
                : "Next",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}
