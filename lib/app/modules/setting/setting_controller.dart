import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/data/models/language.dart';
import 'package:remood/app/data/models/list_selected_icons_topic.dart';
import 'package:remood/app/data/models/list_topic.dart';
import 'package:remood/app/data/models/setting_button.dart';
import 'package:remood/app/data/models/topic.dart';
import 'package:remood/app/modules/write_diary/diary_controller.dart';
import 'package:remood/app/routes/app_routes.dart';

class SettingController extends GetxController {
  // DiaryController diaryController = Get.find();

  // Main screen
  List<SettingButton> settingList = [
    SettingButton(
      icon: Assets.calendar,
      label: "Start of the week",
      screen: AppRoutes.starOfTheWeek,
    ),
    SettingButton(
      icon: Assets.language,
      label: "Language",
      screen: AppRoutes.language,
    ),
    SettingButton(
      icon: Assets.notification,
      label: "Notification",
      screen: AppRoutes.notification,
    ),
    SettingButton(
      icon: Assets.dangerCircle,
      label: "Privacy",
      screen: AppRoutes.privacy,
    ),
    SettingButton(
      icon: Assets.category,
      label: "Manage topics",
      screen: AppRoutes.manageTopics,
    ),
    SettingButton(
      icon: Assets.category,
      label: "Pinned diaries",
      screen: AppRoutes.pinnedDiaries,
    ),
    SettingButton(
      icon: Assets.password,
      label: "Security",
      screen: AppRoutes.security,
    ),
  ];

  List<SettingButton> helpList = [
    SettingButton(
      icon: Assets.call,
      label: "Contact Us",
      screen: AppRoutes.contactUs,
    ),
    SettingButton(
      icon: Assets.document,
      label: "FAQ",
      screen: AppRoutes.faq,
    ),
  ];

  var settingLabelStyle = CustomTextStyle.normalText(Colors.black);

  // Manage topics

  // Rx<int> currentIconTopic = 0.obs;

  Rx<CardTopic> currentTopic = CardTopic(
    title: "",
    TopicColor: AppColors.lightGreen18.value,
    icons: Icons.work.codePoint,
  ).obs;

  /// action 0 is Renaming topic
  /// action 1 is Changing topic icon
  /// action 2 is Changing topic color
  int actionIndex = 0;

  void actions() {
    // Store index of current topic selected
    // int indexCurrentTopic = diaryController.currentTopic.value;

    switch (actionIndex) {
// Rename
      case 0:
        break;
// Changing topic icon
      case 1:
        break;
// Changing topic color
      case 2:
        break;
      default:
        break;
    }
  }

  // Properties of topics button
  List<CardTopic> topicList = [
    CardTopic(
      title: "Work",
      TopicColor: AppColors.lightGreen18.value,
      icons: Icons.work.codePoint,
    ),
    CardTopic(
      title: "Love",
      TopicColor: AppColors.lightRed22.value,
      icons: Icons.favorite.codePoint,
    ),
    CardTopic(
      title: "Friends",
      TopicColor: AppColors.lightOrange27.value,
      icons: Icons.group.codePoint,
    ),
    CardTopic(
      title: "Family",
      TopicColor: AppColors.lightPurple22.value,
      icons: Icons.family_restroom.codePoint,
    ),
  ];

  // First day of the week
  RxBool isSunday = true.obs;

  // Get value of isSunday
  bool get getIsSunday => isSunday.value;
  bool get getIsMonday => !isSunday.value;

  // Active Sunday button
  void onTapSunday() {
    isSunday(true);
    log('Sunday is the first day.');
  }

  // Active Sunday button
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
