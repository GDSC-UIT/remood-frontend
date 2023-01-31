import 'package:flutter/material.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/text_style.dart';

class TimeTitle extends StatelessWidget {
  const TimeTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.onboardingBackground,
      height: 72,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Choose time to get notification",
              style: CustomTextStyle.h2(AppColors.textBrown)),
        ],
      ),
    );
  }
}
