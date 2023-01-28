import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:remood/app/data/models/diary.dart';
import 'package:remood/app/data/models/list_negative_diary.dart';
import 'package:remood/app/data/models/list_positive_diary.dart';
import 'package:remood/app/modules/read_diary/widgets/bottom_sheet_read_diary.dart';
import 'package:flutter/material.dart';
import 'package:remood/app/modules/read_diary/widgets/bottom_sheet_search_diary.dart';
import 'package:remood/app/modules/read_diary/widgets/bottom_sheet_sort_diary.dart';
import 'package:remood/app/routes/app_routes.dart';

class ReadDiaryController extends GetxController {
// read diary
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
        return AnimatedPadding(
          padding: MediaQuery.of(context).viewInsets,
          duration: const Duration(milliseconds: 100),
          curve: Curves.decelerate,
          child: SingleChildScrollView(
            child: SheetReadDiary(
              tag: tag,
              id: id,
            ),
          ),
        );
      }),
    );
  }

// search diary
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

// sort diary
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

// change sort
  RxInt currentSort = 0.obs;
  void ChangeSort(index) {
    currentSort.value = index;
  }

// change topic
  RxInt currentTopic = 0.obs;
  void ChangeTopic(index) {
    currentTopic.value = index;
  }

// delete diary
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

// edit diary
  RxBool isPressed = false.obs;
  TextEditingController editingController = TextEditingController();
  void editPositiveDiary() {
    isPressed.value = !isPressed.value;
    editingController.text =
        ListPositveDiary.listPositiveDiary[currentDiary.value].diary;
  }

  void editNegativeDiary() {
    isPressed.value = !isPressed.value;
    editingController.text =
        ListNegativeDiary.listNegativeDiary[currentDiary.value].diary;
  }

// save edit task
  void donePositivePress() {
    if (isPressed.value) {
      ListPositveDiary.listPositiveDiary[currentDiary.value].diary =
          editingController.text;
      positiveDiaryList[currentDiary.value].diary = editingController.text;
      Get.toNamed(AppRoutes.home);
      Get.back();
    } else
      Get.back();
  }

  void doneNegativePress() {
    if (isPressed.value) {
      ListNegativeDiary.listNegativeDiary[currentDiary.value].diary =
          editingController.text;
      negativeDiaryList[currentDiary.value].diary = editingController.text;
      Get.back();
    } else
      Get.back();
  }
}
