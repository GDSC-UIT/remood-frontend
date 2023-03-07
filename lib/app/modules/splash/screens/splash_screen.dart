import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/data/services/notification_service.dart';
import 'package:remood/app/data/services/permission_service.dart';
import 'package:remood/app/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () => Get.toNamed(AppRoutes.onboarding),
    );

    /// Ask for notification permission
    // WidgetsBinding.instance.addPostFrameCallback(
    //   (_) async {
    //     PermissionService.askPermissionFirstTime();
    //   },
    // );
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
