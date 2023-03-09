import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/data/services/media_query_service.dart';
import 'package:remood/app/modules/onboarding/onboarding_controller.dart';
import 'package:remood/app/routes/app_routes.dart';

class ActionBar extends StatefulWidget {
  const ActionBar({
    Key? key,
    required this.pageIndex,
  }) : super(key: key);
  final RxInt pageIndex;

  @override
  State<ActionBar> createState() => _ActionBarState();
}

class _ActionBarState extends State<ActionBar> {
  @override
  Widget build(BuildContext context) {
    // Controller
    final PageController pageController = Get.find();
    final OnboardingController onboardingController = Get.find();

    // Data
    var pctWidth = MediaQueryService.pctWidth(context);
    var pctHeight = MediaQueryService.pctHeight(context);

    return Container(
      color: Colors.transparent,
      child: Stack(
        children: [
          Obx(
            () => Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Previous button
                widget.pageIndex > 0
                    ? IconButton(
                        onPressed: () {
                          onboardingController.previousScreen(pageController);
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
                ),
              ],
            ),
          ),
          // Logo
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  width: 103 * pctWidth,
                  height: 38 * pctHeight,
                  child: Image.asset(Assets.logoText),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
