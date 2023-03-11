import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/data/services/media_query_service.dart';
import 'package:remood/app/modules/onboarding/onboarding_controller.dart';
import 'package:remood/app/routes/app_routes.dart';

class ActionBarSchedule extends StatelessWidget {
  const ActionBarSchedule({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Data
    var pctWidth = MediaQueryService().pctWidth(context);
    var pctHeight = MediaQueryService().pctHeight(context);

    return Container(
      color: Colors.transparent,
      child: Stack(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Previous button
              IconButton(
                  onPressed: () {
                    /// Jump back to the last onboarding screen
                    Get.back();
                  },
                  icon: Image.asset(Assets.arrowBack)),

              /// Skip button
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
