
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/data/models/diary.dart';
import 'package:remood/app/data/models/list_negative_diary.dart';
import 'package:remood/app/data/models/list_positive_diary.dart';
import 'package:remood/app/data/models/list_topic.dart';
import 'package:remood/app/data/models/topic.dart';
import 'package:remood/app/modules/write_diary/widgets/bottom_sheet_add_topic.dart';
import 'dart:io';

class DiaryController extends GetxController {
// hive box
  final _mybox = Hive.box('mybox');
  ListNegativeDiary hiveBoxNegative = ListNegativeDiary();
  ListPositveDiary hiveBoxPositive = ListPositveDiary();
  RxList<CardTopic> listTopic = <CardTopic>[].obs;
  ListTopic hiveBoxTopic = ListTopic();
  @override
  void onInit() {
    if (_mybox.get("topic") == null) {
      hiveBoxTopic.createInitialData();
    } else {
      hiveBoxTopic.loadData();
    }
    listTopic.value = ListTopic.topics;
    super.onInit();
  }

  RxInt current = 0.obs;
// change Tag positive negative
  void changeColortag(index) {
    current.value = index;
  }

// open bottomsheet ( add topic)
  void createTopic(context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
      isScrollControlled: true,
      context: context,
      builder: ((context) {
        return const SheetAddTopic();
      }),
    );
  }

// choose topic
  RxInt currentTopic = 0.obs;
  void changeTopic(index) {
    currentTopic.value = index;
  }

// add diary
  Rx<IconData> iconTopic = Icons.work.obs;
  Rx<Color> colorDiary = AppColors.lightGreen18.obs;
  Rx<String> titleDiary = "Work".obs;
  TextEditingController diaryNote = TextEditingController();
  File? image;
  late DateTime addDate;
  // add diary function
  void addDiary() {
    Diary addDiary = Diary(
      diary: diaryNote.text.trim(),
      date: addDate,
      diaryColor: colorDiary.value.value,
      icon: iconTopic.value.codePoint,
      title: titleDiary.value,
      image: image == null ? null : image!.path,
    );
    current.value == 0
        ? ListPositveDiary.listPositiveDiary.add(addDiary)
        : ListNegativeDiary.listNegativeDiary.add(addDiary);
    hiveBoxNegative.updateDatabase();
    hiveBoxPositive.updateDatabase();
    diaryNote.clear();
  }

// choose color added topic
  RxInt currentColorTopic = 0.obs;
  Rx<Color> colorTopic = AppColors.lightprimary250.obs;
  void changeColorTopic(index, Color currentColor) {
    currentColorTopic.value = index;
    colorTopic.value = currentColor;
  }

// choose icon added topic
  Rx<int> currentIconTopic = 0.obs;
  int get getCurrentIconTopic => currentColorTopic.value;
  Rx<IconData> addtopicIcon = Icons.search.obs;
  void changeIconTopic(int index, IconData currentIcon) {
    currentIconTopic(index);
    addtopicIcon(currentIcon);
  }

// add topic
  TextEditingController titleController = TextEditingController();

  void addCurrentTopic() {
    CardTopic newTopic = CardTopic(
      title: titleController.text.trim(),
      TopicColor: colorTopic.value.value,
      icons: addtopicIcon.value.codePoint,
    );
    listTopic.add(newTopic);
    hiveBoxTopic.updateDatabase();
  }
}
