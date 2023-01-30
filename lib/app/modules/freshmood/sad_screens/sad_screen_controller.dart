import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/data/models/diary.dart';
import 'package:remood/app/data/models/list_positive_diary.dart';
import 'package:remood/app/modules/freshmood/sad_screens/widgets/bottom_sheet_read_diary_freshmood.dart';

class SadController extends GetxController {
  RxInt currentTopic = 0.obs;
  void changeTopic(index) {
    currentTopic.value = index;
  }

  RxInt currentChoice = 0.obs;
  void changeChoice(index) {
    currentChoice.value = index;
  }

  RxInt currentDiary = 0.obs;
  void readDiary(context, index, String tag, int id) {
    currentDiary.value = index;
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
      isScrollControlled: true,
      context: context,
      builder: ((context) {
        return SheetReadDiaryFreshmood(
          tag: tag,
          id: id,
          currentDiary: currentDiary,
        );
      }),
    );
  }
}
