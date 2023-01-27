import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:remood/app/data/models/diary.dart';
import 'package:remood/app/data/models/list_negative_diary.dart';
import 'package:remood/app/data/models/list_positive_diary.dart';
import 'package:remood/app/global_widgets/bottom_sheet_read_diary.dart';
import 'package:flutter/material.dart';
import 'package:remood/app/modules/read_diary/widgets/bottom_sheet_search_diary.dart';
import 'package:remood/app/modules/read_diary/widgets/bottom_sheet_sort_diary.dart';

class ReadDiaryController extends GetxController {
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

  RxList<Diary> positiveDiaryList = <Diary>[].obs;
  RxList<Diary> negativeDiaryList = <Diary>[].obs;
  @override
  void onInit() {
    positiveDiaryList.value = ListPositveDiary.listPositiveDiary;
    negativeDiaryList.value = ListNegativeDiary.listNegativeDiary;
    super.onInit();
  }

  void deletePositiveDiary(index) {
    positiveDiaryList.removeAt(index);
    ListPositveDiary.listPositiveDiary = positiveDiaryList.value;
  }

  void deleteNegativeDiary(index) {
    negativeDiaryList.removeAt(index);
    ListNegativeDiary.listNegativeDiary = negativeDiaryList.value;
  }
}
