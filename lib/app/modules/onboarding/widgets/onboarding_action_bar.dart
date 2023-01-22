import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/modules/onboarding/onboarding_controller.dart';

class ActionBar extends StatelessWidget {
  const ActionBar({
    Key? key,
    required this.pageIndex,
    required this.controler,
  }) : super(key: key);
  final RxInt pageIndex;
  final OnboardingController controler;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Obx(() => Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              pageIndex > 0
                  ? IconButton(
                      onPressed: () {}, icon: Image.asset(Assets.narrowBack))
                  : const SizedBox(),
              TextButton(
                onPressed: () {},
                child: Text("Skip",
                    style: CustomTextStyle.textButton(
                        AppColors.onboardingSkipButton)),
              )
            ],
          )),
    );
  }
}
