import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:remood/app/data/models/diary.dart';
import 'package:remood/app/data/models/list_negative_diary.dart';
import 'package:remood/app/data/models/list_positive_diary.dart';
import 'package:remood/app/modules/read_diary/widgets/bottom_sheet_read_diary.dart';
import 'package:flutter/material.dart';
import 'package:remood/app/modules/read_diary/widgets/bottom_sheet_search_diary.dart';
import 'package:remood/app/modules/read_diary/widgets/bottom_sheet_sort_diary.dart';

class HomeController extends GetxController {
  RxInt current = 0.obs;
  final Rx<ValueNotifier<int>> currentScreen = ValueNotifier(0).obs;
  void changeBottomScreen(index) {
    current.value = index;
    currentScreen.value.value = index;
  }

  RxBool ispressed = false.obs;
  void onPressedButton() {
    ispressed.value = !ispressed.value;
  }
}
