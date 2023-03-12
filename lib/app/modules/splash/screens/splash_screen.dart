import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/data/services/media_query_service.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    var pctWidth = MediaQueryService().pctWidth(context);
    var pctHeight = MediaQueryService().pctHeight(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.logo,
              width: pctWidth * 148,
              height: pctHeight * 137,
            ),
            SizedBox(
              height: pctHeight * 32,
            ),
            Image.asset(
              Assets.logoText,
              width: pctWidth * 167,
              height: pctHeight * 64,
            ),
            const SizedBox(
              height: 15.0,
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
