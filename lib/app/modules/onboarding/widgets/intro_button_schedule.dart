import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/data/services/permission_service.dart';
import 'package:remood/app/modules/setting/setting_controller.dart';
import 'package:remood/app/routes/app_routes.dart';

class OnboardingButtonSchedule extends StatelessWidget {
  const OnboardingButtonSchedule({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SettingController settingController = Get.find();

    void nextScreen() async {
      log(DateTime.now().toString());

      /// Ask for notification permission
      await PermissionService.askPermissionFirstTime();

      /// Save data locally
      settingController.saveTimeOnboarding();

      Get.toNamed(AppRoutes.home);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      height: 52.0,
      width: double.infinity,
      child: MaterialButton(
        onPressed: () {
          nextScreen();
        },
        color: AppColors.mainColor,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        child: const Text(
          "Get started",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
        ),
      ),
    );
  }
}
