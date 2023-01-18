import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/modules/diary/widgets/bottom_sheet.dart';

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
        return const Sheet();
      }),
    );
  }
}
