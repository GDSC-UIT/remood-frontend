import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/data/services/media_query_service.dart';
import 'package:remood/app/modules/home/screens/home_screen.dart';
import 'package:remood/app/modules/onboarding/screens/onboarding_screen.dart';
import 'package:remood/app/modules/splash/splash_controller.dart';
import 'package:remood/app/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashController controller = Get.find();

  // late Future _boxLoadFuture;
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 2),
      () async => Get.offAndToNamed(await controller.isFirstOnboard() == true
          ? AppRoutes.onboarding
          : AppRoutes.home),
    );

    // _boxLoadFuture = Future.wait([Hive.openBox('mybox')]);
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
