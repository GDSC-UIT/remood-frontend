import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/data/models/setting_function.dart';
import 'package:remood/app/modules/setting/screens/language_screen.dart';
import 'package:remood/app/modules/setting/screens/manage_topics_screen.dart';
import 'package:remood/app/modules/setting/screens/notification_screen.dart';
import 'package:remood/app/modules/setting/screens/privacy_screen.dart';
import 'package:remood/app/modules/setting/screens/security_screen.dart';
import 'package:remood/app/modules/setting/screens/start_of_the_week_screen.dart';

class ColSettingFuncs extends StatelessWidget {
  const ColSettingFuncs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var settingList = [
      SettingFunc(icon: Assets.calendar, title: "Start of the week"),
      SettingFunc(icon: Assets.language, title: "Language"),
      SettingFunc(icon: Assets.notification, title: "Notification"),
      SettingFunc(icon: Assets.dangerCircle, title: "Privacy"),
      SettingFunc(icon: Assets.category, title: "Manage topics"),
      SettingFunc(icon: Assets.password, title: "Security"),
    ];

    var settingLabel = CustomTextStyle.normalText(Colors.black);

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            log("Start of the week button");
            Get.to(const StartOfTheWeekScreen());
          },
          child: ListTile(
            leading: Image.asset(settingList[0].icon),
            trailing: Image.asset(Assets.arrowRight),
            title: Text(
              settingList[0].title,
              style: settingLabel,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            log("Laguage button");
            Get.to(const LanguageScreen());
          },
          child: ListTile(
            leading: Image.asset(settingList[1].icon),
            trailing: Image.asset(Assets.arrowRight),
            title: Text(
              settingList[1].title,
              style: settingLabel,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            log("Notification button");
            Get.to(const NotificationScreen());
          },
          child: ListTile(
            leading: Image.asset(settingList[2].icon),
            trailing: Image.asset(Assets.arrowRight),
            title: Text(
              settingList[2].title,
              style: settingLabel,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            log("Privacy button");
            Get.to(const PrivacyScreen());
          },
          child: ListTile(
            leading: Image.asset(settingList[3].icon),
            trailing: Image.asset(Assets.arrowRight),
            title: Text(
              settingList[3].title,
              style: settingLabel,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            log("Manage-topic button");
            Get.to(const ManageTopicsScreen());
          },
          child: ListTile(
            leading: Image.asset(settingList[4].icon),
            trailing: Image.asset(Assets.arrowRight),
            title: Text(
              settingList[4].title,
              style: settingLabel,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            log("Security button");
            Get.to(const SecurityScreen());
          },
          child: ListTile(
            leading: Image.asset(settingList[5].icon),
            trailing: Image.asset(Assets.arrowRight),
            title: Text(
              settingList[5].title,
              style: settingLabel,
            ),
          ),
        ),
      ],
    );
  }
}
