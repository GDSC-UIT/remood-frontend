import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/modules/onboarding/onboarding_controller.dart';
import 'package:remood/app/routes/app_routes.dart';

class ActionBar extends StatefulWidget {
  const ActionBar({
    Key? key,
    required this.pageIndex,
    required this.controler,
  }) : super(key: key);
  final RxInt pageIndex;
  final OnboardingController controler;

  @override
  State<ActionBar> createState() => _ActionBarState();
}

class _ActionBarState extends State<ActionBar> {
  final PageController pageController = Get.find<PageController>();

  void previousScreen() {
    pageController.previousPage(
        duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Obx(() => Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Previous button
              widget.pageIndex > 0
                  ? IconButton(
                      onPressed: () {
                        previousScreen();
                      },
                      icon: Image.asset(Assets.arrowBack))
                  : const SizedBox(),

              // Skip button
              TextButton(
                onPressed: () {
                  Get.offAllNamed(AppRoutes.home);
                },
                child: Text("Skip",
                    style: CustomTextStyle.textButton(
                        AppColors.onboardingSkipButton)),
              )
            ],
          )),
    );
  }
}
