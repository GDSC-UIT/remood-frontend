import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/data/models/language.dart';
import 'package:remood/app/data/models/list_selected_color_topic.dart';
import 'package:remood/app/data/models/list_selected_icons_topic.dart';
import 'package:remood/app/data/models/list_topic.dart';
import 'package:remood/app/data/models/setting.dart';
import 'package:remood/app/data/models/setting_box.dart';
import 'package:remood/app/data/models/setting_button.dart';
import 'package:remood/app/data/models/topic.dart';
import 'package:remood/app/data/models/user.dart';
import 'package:remood/app/data/models/user_box.dart';
import 'package:remood/app/routes/app_routes.dart';

class SettingController extends GetxController {
  double designWidth = 375;
  double designHeight = 812;

  /// Percentage of width and height
  /// of design screen and real screen
  double pctWidth(context) => MediaQuery.of(context).size.width / designWidth;
  double pctHeight(context) =>
      MediaQuery.of(context).size.height / designHeight;

  // Hive box (Store data locally)
  final _userBox = Hive.box<User>('user');
  final _settingBox = Hive.box<Setting>('setting');
  UserBox hiveUser = UserBox();
  SettingBox hiveSetting = SettingBox();
  Rx<User> user = User(
    name: "Untitle",
    avtURL: Assets.settingUserAvt1,
  ).obs;
  Rx<Setting> setting = Setting(
    isSundayFirstDayOfWeek: false,
    isOnNotification: false,
    isOnPINLock: false,
    language: 0,
  ).obs;

  @override
  void onInit() {
    /// Create initial data if this is the first-time open
    /// or load data if this is not the first time.
    if (_userBox.get("user") == null) {
      hiveUser.createInitialData();
    } else {
      hiveUser.loadData();
    }
    if (_settingBox.get("setting") == null) {
      hiveSetting.createInitialData();
    } else {
      hiveSetting.loadData();
    }
    // Observe data
    user = UserBox.user.obs;
    setting = SettingBox.setting.obs;
    super.onInit();
  }

  // Main screen
  TextEditingController nameController = TextEditingController();
  RxString nickname = "cute pie".obs;
  // RxString avatar = UserBox.user.avtURL.obs;
  RxBool isEditableName = false.obs;
  List<String> avatars = [
    Assets.settingUserAvt1,
    Assets.settingUserAvt2,
  ];

  void editAvatar(int index) {
    // Update UI data
    user(
      User(
        name: user.value.name,
        avtURL: avatars[index],
      ),
    );
    // Update local data
    UserBox.user.avtURL = avatars[index];
    hiveUser.updateDatabase();
  }

  void editNickName() {
    String newName = nameController.text.trim();
    if (newName != "") {
      user.value.name = newName;
      hiveUser.updateDatabase();
    }
    isEditableName(!isEditableName.value);
  }

  var settingLabelStyle = CustomTextStyle.normalText(Colors.black);

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

  // Manage topics
  TextEditingController topicName = TextEditingController();
  ListSelectedIcons listSelectedIcons = ListSelectedIcons();
  ListSelectedColor listSelectedColor = ListSelectedColor();
  RxInt currentTopicIndex = 0.obs;
  RxInt currentTopicIcon = 0.obs;
  RxInt currentTopicColor = 0.obs;
  Rx<CardTopic> currentTopic = CardTopic(
    title: "",
    TopicColor: AppColors.lightGreen18.value,
    icons: Icons.work.codePoint,
  ).obs;
  int get icon => currentTopic.value.icons;

  // Properties of topics button
  ListTopic hiveBoxTopic = ListTopic();
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

// choose topic

  void changeTopic(int index) {
    currentTopicIndex(index);
  }

  void changeTopicIconIndex(int index) {
    currentTopicIcon(index);
  }

  void changeTopicColorIndex(int index) {
    currentTopicColor(index);
  }

  void changeNameTopicSetting() {
    // Update local data
    ListTopic.topics[currentTopicIndex.value].title = topicName.text.trim();

    // Update Topic-detail screen
    currentTopic(ListTopic.topics[currentTopicIndex.value]);
    hiveBoxTopic.updateDatabase();
  }

  void changeIconTopicSetting() {
    // Update local data
    ListTopic.topics[currentTopicIndex.value].icons =
        listSelectedIcons.selectedIcons[currentTopicIcon.value].codePoint;

    // Update Topic-detail screen
    currentTopic(ListTopic.topics[currentTopicIndex.value]);

    // listTopic[currentTopicIndex.value]

    log(currentTopic.value.icons.toString());

    hiveBoxTopic.updateDatabase();
  }

  void changeColorTopicSetting() {
    // Update local data
    ListTopic.topics[currentTopicIndex.value].TopicColor =
        listSelectedColor.selectedColors[currentTopicColor.value].value;

    // Update UI
    currentTopic(ListTopic.topics[currentTopicIndex.value]);

    hiveBoxTopic.updateDatabase();
  }

  // First day of the week
  var isSunday = SettingBox.setting.isSundayFirstDayOfWeek.obs;

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

  void saveFirstDayOfWeek() {
    log('Before-setting: ${setting.value.isSundayFirstDayOfWeek}');
    log('Before-settingBox: ${SettingBox.setting.isSundayFirstDayOfWeek}');
    // Update UI data
    setting(
      Setting(
        isSundayFirstDayOfWeek: isSunday.value,
        language: setting.value.language,
        isOnNotification: setting.value.isOnNotification,
        isOnPINLock: setting.value.isOnPINLock,
      ),
    );
    // Update local data
    SettingBox.setting.isSundayFirstDayOfWeek = isSunday.value;
    hiveSetting.updateDatabase();
    log("After-setting: ${setting.value.isSundayFirstDayOfWeek}");
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

  // -------------------------------------------
  // PIN LOCK
  // Passcode is typed
  var code = [-1, -1, -1, -1].obs;

  // Number of code was typed
  var count = 0.obs;

  // Status of dots
  bool isActiveDot(int index) {
    if (index > 4) return false;
    return code[index] >= 0 ? true : false;
  }

  void deleteCode(int index, RxList<int> code, RxInt count) {
    /// Nếu có ít nhất 1 giá trị passcode và giá trị đó = -2,
    /// passcode sẽ xóa đi 1 giá trị bên phải
    if (count > 0 && index == -2) {
      code[--count.value] = -1;
    }
  }

  void enterCode(int index, RxList<int> code, RxInt count) {
    /// Nếu số code đã đủ 4 hoặc
    /// nút có giá trị âm (bao gồm nút whitespace và nút xóa)
    /// thì sẽ không lưu giá trị của nút
    if (count < code.length && index >= 0) {
      code[count.value++] = index;
    }
  }
}
