import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/data/models/diary.dart';
import 'package:remood/app/data/models/language.dart';
import 'package:remood/app/data/models/list_pinned_diary.dart';
import 'package:remood/app/data/models/list_selected_color_topic.dart';
import 'package:remood/app/data/models/list_selected_icons_topic.dart';
import 'package:remood/app/data/models/list_topic.dart';
import 'package:remood/app/data/models/setting.dart';
import 'package:remood/app/data/models/setting_box.dart';
import 'package:remood/app/data/models/setting_button.dart';
import 'package:remood/app/data/models/topic.dart';
import 'package:remood/app/data/models/user.dart';
import 'package:remood/app/data/models/user_box.dart';
import 'package:remood/app/data/services/notification_service.dart';
import 'package:remood/app/global_widgets/card_diary.dart';
import 'package:remood/app/data/services/setting_service.dart';
import 'package:remood/app/routes/app_routes.dart';

class SettingController extends GetxController {
  // Hive box (Store data locally)
  final _userBox = Hive.box<User>('user');
  final _settingBox = Hive.box<Setting>('setting');
  final _myBox = Hive.box<List>('mybox');
  PinnedDiary hiveBoxPinned = PinnedDiary();
  ListTopic hiveBoxTopic = ListTopic();
  UserBox hiveUser = UserBox();
  SettingBox hiveSetting = SettingBox();
  RxList<CardTopic> listTopic = <CardTopic>[].obs;
  Rx<User> user = User(
    name: "Untitle",
    avtURL: Assets.settingUserAvt1,
  ).obs;

  @override
  void onInit() {
    /// Create initial data if this is the first-time open
    /// or load data if this is not the first time.
    if (_myBox.get("topic") == null) {
      hiveBoxTopic.createInitialData();
    } else {
      hiveBoxTopic.loadData();
    }
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
    if (_myBox.get("pinneddiary") == null) {
      hiveBoxPinned.createInitialData();
    } else {
      hiveBoxPinned.loadData();
    }

    // Observe data
    listTopic = ListTopic.topics;
    user = UserBox.user.obs;
    SettingService.setting = SettingBox.setting.obs;

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
    Assets.settingUserAvt3,
    Assets.settingUserAvt4,
    Assets.settingUserAvt5,
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
  Rx<Color> colorTopic = AppColors.lightprimary250.obs;
  Rx<CardTopic> currentTopic = CardTopic(
    title: "",
    TopicColor: AppColors.lightGreen18.value,
    icons: Icons.work.codePoint,
  ).obs;

  // Add-topic data
  TextEditingController titleController = TextEditingController();
  Rx<IconData> addtopicIcon = Icons.search.obs;

// choose topic

  void changeTopicIndex(int index) {
    currentTopicIndex(index);
  }

  void changeIconIndex(int index) {
    currentTopicIcon(index);

    addtopicIcon(listSelectedIcons.selectedIcons[index]);
  }

  void changeColorIndex(int index) {
    currentTopicColor(index);

    colorTopic(listSelectedColor.selectedColors[index]);
  }

  void changeNameTopicSetting() {
    // Update local data
    ListTopic.topics[currentTopicIndex.value].title = topicName.text.trim();

    // Update Topic-detail screen
    currentTopic(ListTopic.topics[currentTopicIndex.value]);
    update();

    log(currentTopic.value.title);

    hiveBoxTopic.updateDatabase();
  }

  void changeIconTopicSetting() {
    // Update local data
    ListTopic.topics[currentTopicIndex.value].icons =
        listSelectedIcons.selectedIcons[currentTopicIcon.value].codePoint;

    // Update Topic-detail screen
    currentTopic(ListTopic.topics[currentTopicIndex.value]);
    update();

    log(currentTopic.value.icons.toString());

    hiveBoxTopic.updateDatabase();
  }

  void changeColorTopicSetting() {
    // Update local data
    ListTopic.topics[currentTopicIndex.value].TopicColor =
        listSelectedColor.selectedColors[currentTopicColor.value].value;

    // Update UI
    currentTopic(ListTopic.topics[currentTopicIndex.value]);
    update();

    hiveBoxTopic.updateDatabase();
  }

  void addTopicSetting() {
    CardTopic newTopic = CardTopic(
      title: titleController.text.trim(),
      TopicColor: colorTopic.value.value,
      icons: addtopicIcon.value.codePoint,
    );
    ListTopic.topics.add(newTopic);

    // Reset
    titleController.clear();

    hiveBoxTopic.updateDatabase();
  }

  void deleteTopic() {
    hiveBoxTopic.deleteTopic(currentTopic.value);
    log(listTopic.toString());
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
    log('Before-setting: ${SettingService.setting.value.isSundayFirstDayOfWeek}');
    log('Before-settingBox: ${SettingBox.setting.isSundayFirstDayOfWeek}');
    // Update UI data
    SettingService.setting = Setting(
      isSundayFirstDayOfWeek: isSunday.value,
      language: SettingService.setting.value.language,
      isOnNotification: SettingService.setting.value.isOnNotification,
      hour: SettingService.setting.value.hour,
      minute: SettingService.setting.value.minute,
      ampm: SettingService.setting.value.ampm,
      isOnPINLock: SettingService.setting.value.isOnPINLock,
    ).obs;

    // Update local data
    SettingBox.setting.isSundayFirstDayOfWeek = isSunday.value;
    hiveSetting.updateDatabase();
    log("After-setting: ${SettingService.setting.value.isSundayFirstDayOfWeek}");
    log("After-settingBox: ${SettingBox.setting.isSundayFirstDayOfWeek}");

    update();
  }

  // -------------------------------------------
  // Language

  // Current language
  RxInt choice = SettingBox.setting.language.obs;

  // Languages list
  var lanList = [
    Language(label: "English", actived: false.obs),
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
    choice(index);
    log(lanList[choice.value].label.toString());
  }

  void saveLanguage() {
    SettingBox.setting.language = choice.value;
    hiveSetting.updateDatabase();
    log(lanList[SettingBox.setting.language].label);
  }

  // -------------------------------------------
  // Notification

  /// hour from 1 to 12 and controller index from 0 to 11
  FixedExtentScrollController hourController =
      FixedExtentScrollController(initialItem: SettingBox.setting.hour - 1);
  FixedExtentScrollController minuteController =
      FixedExtentScrollController(initialItem: SettingBox.setting.minute);
  FixedExtentScrollController ampmController =
      FixedExtentScrollController(initialItem: SettingBox.setting.ampm);
  // ScrollPosition lastestHour

  // Active the reminder
  RxBool actived = SettingBox.setting.isOnNotification.obs;

  // Hour - minute - AM/PM
  RxInt hour = SettingBox.setting.hour.obs;
  RxInt minute = SettingBox.setting.minute.obs;
  RxInt ampm = SettingBox.setting.ampm.obs;

  // Get hour
  RxString get getHour => (hour < 10 ? '0$hour' : '$hour').obs;

  // Get minute
  RxString get getMin => (minute < 10 ? '0$minute' : '$minute').obs;

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

  void saveTimeSetting(BuildContext context) async {
    // Save local data
    SettingBox.setting.hour = hour.value;
    SettingBox.setting.minute = minute.value;
    SettingBox.setting.ampm = ampm.value;

    // Update UI
    // hour from 1 to 12 and controller index from 0 to 11
    updateHour(hourController.selectedItem + 1);
    updateMinute(minuteController.selectedItem);
    updateAmPm(ampmController.selectedItem);

    log(SettingBox.setting.hour.toString());
    log(SettingBox.setting.minute.toString());
    log(SettingBox.setting.ampm.toString());

    // Set for notification
    NotificationService.scheduleDailyAtTimeNotification(
        context, TimeOfDay(hour: hour.value, minute: minute.value));

    hiveSetting.updateDatabase();
  }

  void saveTimeOnboarding(BuildContext context) {
    SettingBox.setting.hour = hourController.selectedItem + 1;
    SettingBox.setting.minute = minuteController.selectedItem;
    SettingBox.setting.ampm = ampmController.selectedItem;

    /// Set for notification
    NotificationService.scheduleDailyAtTimeNotification(
      context,
      TimeOfDay(
        hour: SettingBox.setting.hour,
        minute: SettingBox.setting.minute,
      ),
    );

    hiveSetting.updateDatabase();
  }

  void saveNotification() {
    SettingBox.setting.isOnNotification = actived.value;

    log(SettingBox.setting.isOnNotification.toString());

    hiveSetting.updateDatabase();
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
