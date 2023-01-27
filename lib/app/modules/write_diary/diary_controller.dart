import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/data/models/diary.dart';
import 'package:remood/app/data/models/list_negative_diary.dart';
import 'package:remood/app/data/models/list_positive_diary.dart';
import 'package:remood/app/modules/write_diary/widgets/bottom_sheet_add_topic.dart';

import 'package:flutter/animation.dart';

class DiaryController extends GetxController {
  //
  RxInt current = 0.obs;
  void changeColortag(index) {
    current.value = index;
  }

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

  RxInt currentTopic = 0.obs;
  void changeTopic(index) {
    currentTopic.value = index;
  }

  Rx<IconData> iconTopic = Icons.work.obs;
  Rx<Color> colorDiary = AppColors.LightGreen18.obs;
  Rx<String> titleDiary = "".obs;
  TextEditingController diaryNote = TextEditingController();
  void addDiary() {
    Diary addDiary = Diary(
        diary: diaryNote.text.trim(),
        date: DateTime.now(),
        diaryColor: colorDiary.value,
        icon: iconTopic.value,
        title: titleDiary.value);

    current.value == 0
        ? ListPositveDiary.listPositiveDiary.add(addDiary)
        : ListNegativeDiary.listNegativeDiary.add(addDiary);
    diaryNote.clear();
  }
/*  */
}
