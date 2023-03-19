import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';

class OnboardingDecoration extends BoxDecoration {
  static BoxDecoration imageBackround(RxInt index, String image) {
    return BoxDecoration(
      color: AppColors.backgroundPage,
      image: DecorationImage(
        image: AssetImage(image),
        fit: BoxFit.cover,
      ),
    );
  }
}
