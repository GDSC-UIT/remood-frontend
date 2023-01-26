import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/global_widgets/bottom_sheet_read_diary.dart';

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
        return SheetReadDiary(
          tag: tag,
          id: id,
          currentDiary: currentDiary,
        );
      }),
    );
  }
}
