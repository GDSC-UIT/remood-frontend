import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/data/models/language.dart';
import 'package:remood/app/data/models/list_topic.dart';
import 'package:remood/app/data/models/setting_button.dart';
import 'package:remood/app/data/models/topic.dart';
import 'package:remood/app/routes/app_routes.dart';

class SettingController extends GetxController {
  // Main screen
  List<SettingButton> settingList = [
    SettingButton(
      icon: Assets.calendar,
      title: "Start of the week",
      screen: AppRoutes.starOfTheWeek,
    ),
    SettingButton(
        icon: Assets.language, title: "Language", screen: AppRoutes.language),
    SettingButton(
      icon: Assets.notification,
      title: "Notification",
      screen: AppRoutes.notification,
    ),
    SettingButton(
      icon: Assets.dangerCircle,
      title: "Privacy",
      screen: AppRoutes.privacy,
    ),
    SettingButton(
      icon: Assets.category,
      title: "Manage topics",
      screen: AppRoutes.manageTopics,
    ),
    SettingButton(
      icon: Assets.category,
      title: "Pinned diaries",
      screen: AppRoutes.pinnedDiaries,
    ),
    SettingButton(
      icon: Assets.password,
      title: "Security",
      screen: AppRoutes.security,
    ),
  ];

  List<SettingButton> helpList = [
    SettingButton(
      icon: Assets.call,
      title: "Contact Us",
      screen: AppRoutes.contactUs,
    ),
    SettingButton(
      icon: Assets.document,
      title: "FAQ",
      screen: AppRoutes.faq,
    ),
  ];

  List<SettingButton> topicList = [
    SettingButton(
      icon: CardTopic(
        title: "",
        TopicColor: AppColors.lightGreen18.value,
        icons: Icons.work.codePoint,
      ),
      title: "Work",
      screen: null,
    ),
    SettingButton(
      icon: CardTopic(
        title: "",
        TopicColor: AppColors.lightRed22.value,
        icons: Icons.favorite.codePoint,
      ),
      title: "Love",
      screen: null,
    ),
    SettingButton(
      icon: CardTopic(
        title: "",
        TopicColor: AppColors.lightOrange27.value,
        icons: Icons.group.codePoint,
      ),
      title: "Friends",
      screen: null,
    ),
    SettingButton(
      icon: CardTopic(
        title: "",
        TopicColor: AppColors.lightPurple22.value,
        icons: Icons.family_restroom.codePoint,
      ),
      title: "Family",
      screen: null,
    ),
  ];
  var settingLabelStyle = CustomTextStyle.normalText(Colors.black);

  // First day of the week
  RxBool isSunday = true.obs;

  bool get getIsSunday => isSunday.value;
  bool get getIsMonday => !isSunday.value;

  void onTapSunday() {
    isSunday(true);
    log('Sunday is the first day.');
  }

  void onTapMonday() {
    isSunday(false);
    log('Monday is the first day');
  }

  // -------------------------------------------
  // Language

  // Current language
  late Language choice;

  // Languages list
  var lanList = [
    Language(label: "English", actived: true.obs),
    Language(label: "Tiếng Việt", actived: false.obs),
    Language(label: "日本語", actived: false.obs),
  ];

  // Language label style (selected)
  var styleActivedLan = CustomTextStyle.reportHeading()
      .copyWith(color: Colors.black, fontSize: 16);

  // Language label style (unselected)
  var styleInactivedLan =
      CustomTextStyle.normalText(Colors.black).copyWith(fontSize: 16);

  // Language label style will change when that language is selected
  TextStyle getStyleLan(int index) =>
      lanList[index].actived.value ? styleActivedLan : styleInactivedLan;

  // Select the language
  void activeLanguage(int index) {
    for (var lan in lanList) {
      lan.actived(false);
    }
    lanList[index].actived(true);
    choice = lanList[index];
    log(choice.label.toString());
  }

  // -------------------------------------------
  // Notification

  // Active the reminder
  RxBool actived = false.obs;

  // Hour - minute - AM/PM
  late RxInt hour = 0.obs;
  late RxInt minute = 0.obs;
  late RxInt ampm = 0.obs;

  // Get hour
  String get getHour => hour.value < 10 ? '0$hour' : '$hour';

  // Get minute
  String get getMin => minute.value < 10 ? '0$minute' : '$minute';

  // Turn on/off the reminder
  void switchOnChange() {
    actived(!actived.value);
    log(actived.value.toString());
  }

  void updateHour(int value) {
    hour(value);
    log("hour: $hour");
  }

  void updateMinute(int value) {
    minute(value);
    log("min: $minute");
  }

  void updateAmPm(int value) {
    // am is 0, pm is 1
    ampm(value);
    log("ampm: $ampm");
  }
}
