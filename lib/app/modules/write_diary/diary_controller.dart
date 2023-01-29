import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/data/models/diary.dart';
import 'package:remood/app/data/models/list_negative_diary.dart';
import 'package:remood/app/data/models/list_positive_diary.dart';
import 'package:remood/app/data/models/list_topic.dart';
import 'package:remood/app/data/models/topic.dart';
import 'package:remood/app/modules/write_diary/widgets/bottom_sheet_add_topic.dart';
import 'dart:io';
import 'package:flutter/animation.dart';

class DiaryController extends GetxController {
  //
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
  Rx<Color> colorDiary = AppColors.LightGreen18.obs;
  Rx<String> titleDiary = "".obs;
  TextEditingController diaryNote = TextEditingController();
  File? image;
  // add diary function
  void addDiary() {
    Diary addDiary = Diary(
      diary: diaryNote.text.trim(),
      date: DateTime.now(),
      diaryColor: colorDiary.value,
      icon: iconTopic.value,
      title: titleDiary.value,
      image: image,
    );

    current.value == 0
        ? ListPositveDiary.listPositiveDiary.add(addDiary)
        : ListNegativeDiary.listNegativeDiary.add(addDiary);
    diaryNote.clear();
  }

// choose color added topic
  Rx<int> currentColorTopic = 0.obs;
  Rx<Color> colorTopic = AppColors.LightPrimary250.obs;
  void changeColorTopic(index, Color currentColor) {
    currentColorTopic.value = index;
    colorTopic.value = currentColor;
  }

// choose icon added topic
  Rx<int> currentIconTopic = 0.obs;
  Rx<IconData> addtopicIcon = Icons.search.obs;
  void changeIconTopic(index, IconData currentIcon) {
    currentIconTopic.value = index;
    addtopicIcon.value = currentIcon;
  }

// add topic
  TextEditingController titleController = TextEditingController();
  RxList<CardTopic> listTopic = ListTopic.topics.obs;
  void addCurrentTopic() {
    CardTopic newTopic = CardTopic(
        title: titleController.text.trim(),
        TopicColor: colorTopic.value,
        icons: addtopicIcon.value);
    ListTopic.topics.add(newTopic);
    listTopic.add(newTopic);
  }

// pick photos

/*  */
}
