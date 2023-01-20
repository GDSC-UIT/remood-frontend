import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/text_style.dart';

class SettingClock extends StatelessWidget {
  const SettingClock({
    Key? key,
    required this.hour,
    required this.minute,
  }) : super(key: key);

  final RxString hour;
  final RxString minute;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: AppColors.onboardingContainer,
      ),
      padding: const EdgeInsets.all(5.0),
      height: 60.0,
      width: 166.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            hour.toString(),
            style: CustomTextStyle.alarmNumber(AppColors.mainColor),
          ),
          Text(":", style: CustomTextStyle.alarmNumber(AppColors.mainColor)),
          Text(minute.toString(),
              style: CustomTextStyle.alarmNumber(AppColors.mainColor)),
        ],
      ),
    );
  }
}

class SettingTitle extends StatelessWidget {
  const SettingTitle({
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
              style: CustomTextStyle.mainStyle(AppColors.textBrown)),
        ],
      ),
    );
  }
}
