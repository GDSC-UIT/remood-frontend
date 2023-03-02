import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/modules/home/home_controller.dart';
import 'package:remood/app/modules/read_diary/read_diary_controller.dart';
import 'package:remood/app/modules/report/report_controller.dart';
import 'package:remood/app/modules/setting/setting_binding.dart';
import 'package:remood/app/modules/setting/setting_controller.dart';
import 'package:remood/app/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () => Get.toNamed(AppRoutes.onboarding),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.logo,
              height: 211.68,
              width: 217.2,
            ),
            Image.asset(
              Assets.logoText,
              height: 64,
              width: 167,
            ),
            const SizedBox(
              height: 10.0,
            ),
            const CircularProgressIndicator(
              color: AppColors.mainColor,
            ),
          ],
        ),
      ),
    );
  }
}
