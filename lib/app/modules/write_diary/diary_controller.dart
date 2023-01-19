import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/modules/diary/widgets/bottom_sheet_add_topic.dart';
import 'package:remood/app/modules/diary/widgets/bottom_sheet_read_diary.dart';
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

  void readDiary(context, String tag) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
      isScrollControlled: true,
      context: context,
      builder: ((context) {
        return SheetReadDiary(
          tag: tag,
        );
      }),
    );
  }
}
