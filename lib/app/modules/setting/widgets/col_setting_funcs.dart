import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/data/models/setting_function.dart';
import 'package:remood/app/modules/setting/screens/start_of_the_week_screen.dart';
import 'package:remood/app/modules/setting/setting_controller.dart';

class ColSettingFuncs extends StatelessWidget {
  const ColSettingFuncs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingController());
    var settingList = [
      SettingFunc(icon: Assets.calendar, title: "Start of the week"),
      SettingFunc(icon: Assets.language, title: "Language"),
      SettingFunc(icon: Assets.notification, title: "Notification"),
      SettingFunc(icon: Assets.dangerCircle, title: "Privacy"),
      SettingFunc(icon: Assets.category, title: "Manage topics"),
      SettingFunc(icon: Assets.password, title: "Security"),
    ];
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            log("Clicked Start of the week");
            Get.to(const StartOfTheWeek());
          },
          child: ListTile(
            leading: Image.asset(settingList[0].icon),
            trailing: Image.asset(Assets.arrowRight),
            title: Text(
              settingList[0].title,
              style: CustomTextStyle.onboardingText(Colors.black),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            log("Clicked setting function!");
          },
          child: ListTile(
            leading: Image.asset(settingList[1].icon),
            trailing: Image.asset(Assets.arrowRight),
            title: Text(
              settingList[1].title,
              style: CustomTextStyle.onboardingText(Colors.black),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            log("Clicked setting function!");
          },
          child: ListTile(
            leading: Image.asset(settingList[2].icon),
            trailing: Image.asset(Assets.arrowRight),
            title: Text(
              settingList[2].title,
              style: CustomTextStyle.onboardingText(Colors.black),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            log("Clicked setting function!");
          },
          child: ListTile(
            leading: Image.asset(settingList[3].icon),
            trailing: Image.asset(Assets.arrowRight),
            title: Text(
              settingList[3].title,
              style: CustomTextStyle.onboardingText(Colors.black),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            log("Clicked setting function!");
          },
          child: ListTile(
            leading: Image.asset(settingList[4].icon),
            trailing: Image.asset(Assets.arrowRight),
            title: Text(
              settingList[4].title,
              style: CustomTextStyle.onboardingText(Colors.black),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            log("Clicked setting function!");
          },
          child: ListTile(
            leading: Image.asset(settingList[5].icon),
            trailing: Image.asset(Assets.arrowRight),
            title: Text(
              settingList[5].title,
              style: CustomTextStyle.onboardingText(Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
