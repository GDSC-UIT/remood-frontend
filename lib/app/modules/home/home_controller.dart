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
        return SheetReadDiary(tag: tag, id: id);
      }),
    );
  }

  void searchDiary(context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
      isScrollControlled: true,
      context: context,
      builder: ((context) {
        return const SheetSearchDiary();
      }),
    );
  }

  Rx<ListPositveDiary> listPositiveDiary = ListPositveDiary().obs;
  Rx<ListNegativeDiary> listNegativeDiary = ListNegativeDiary().obs;

  TextEditingController controller = TextEditingController();
  void search(String value) {
    List<Diary> results = [];
    if (value.isEmpty) {
      results = listPositiveDiary.value.listPositiveDiary;
    } else {
      results = listPositiveDiary.value.listPositiveDiary
          .where((element) => element.title.contains(controller.text.trim()))
          .toList();
    }
    listNegativeDiary.value.listNegativeDiary = results;
  }

  void sortDiary(context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32.0),
      ),
      isScrollControlled: true,
      context: context,
      builder: ((context) {
        return const SheetSortDiary();
      }),
    );
  }

  RxInt currentSort = 0.obs;
  void ChangeSort(index) {
    currentSort.value = index;
  }

  RxInt currentTopic = 0.obs;
  void ChangeTopic(index) {
    currentTopic.value = index;
  }
}
