import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/data/models/language.dart';
import 'package:remood/app/data/models/setting_function.dart';

import 'screens/language_screen.dart';
import 'screens/manage_topics_screen.dart';
import 'screens/notification_screen.dart';
import 'screens/pinned_diaries_screen.dart';
import 'screens/privacy_screen.dart';
import 'screens/security_screen.dart';
import 'screens/start_of_the_week_screen.dart';

class SettingController extends GetxController {
  // Main screen
  var settingList = [
    SettingFunc(
      icon: Assets.calendar,
      title: "Start of the week",
      screen: const StartOfTheWeekScreen(),
    ),
    SettingFunc(
        icon: Assets.language,
        title: "Language",
        screen: const LanguageScreen()),
    SettingFunc(
      icon: Assets.notification,
      title: "Notification",
      screen: const NotificationScreen(),
    ),
    SettingFunc(
      icon: Assets.dangerCircle,
      title: "Privacy",
      screen: const PrivacyScreen(),
    ),
    SettingFunc(
      icon: Assets.category,
      title: "Manage topics",
      screen: const ManageTopicsScreen(),
    ),
    SettingFunc(
      icon: Assets.category,
      title: "Pinned diaries",
      screen: const PinnedDiariesScreen(),
    ),
    SettingFunc(
      icon: Assets.password,
      title: "Security",
      screen: const SecurityScreen(),
    ),
  ];

  var helpList = [
    SettingFunc(icon: Assets.call, title: "Contact Us", screen: null),
    SettingFunc(icon: Assets.document, title: "FAQ", screen: null),
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
