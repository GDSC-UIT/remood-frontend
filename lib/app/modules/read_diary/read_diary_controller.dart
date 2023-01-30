import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/data/models/diary.dart';
import 'package:remood/app/data/models/list_negative_diary.dart';
import 'package:remood/app/data/models/list_positive_diary.dart';
import 'package:remood/app/modules/read_diary/screens/read_diary_screen.dart';
import 'package:remood/app/modules/read_diary/widgets/bottom_sheet_read_diary.dart';
import 'package:flutter/material.dart';
import 'package:remood/app/modules/read_diary/widgets/bottom_sheet_search_diary.dart';
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
  TextEditingController searchController = TextEditingController();
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

  void searchTitleDiary(value) {
    List<Diary> resultsPositive = <Diary>[];
    List<Diary> resultsNegative = <Diary>[];
    if (searchController.text.isEmpty) {
      resultsPositive = ListPositveDiary.listPositiveDiary;
      resultsNegative = ListNegativeDiary.listNegativeDiary;
    } else {
      resultsPositive = ListPositveDiary.listPositiveDiary
          .where((element) => element.title
              .toLowerCase()
              .contains(value.toString().toLowerCase()))
          .toList();

      resultsNegative = ListNegativeDiary.listNegativeDiary
          .where((element) => element.title
              .toLowerCase()
              .contains(value.toString().toLowerCase()))
          .toList();
    }
    positiveDiaryList.value = resultsPositive;
    negativeDiaryList.value = resultsNegative;
    positiveDiaryList.refresh();
    negativeDiaryList.refresh();
  }

// sort diary

  RxBool sortPress = false.obs;
  void sortBoxOldtoNew() {
    positiveDiaryList.sort(((a, b) => a.date.compareTo(b.date)));
    negativeDiaryList.sort(((a, b) => a.date.compareTo(b.date)));
  }

  void sortBoxNewtoOld() {
    positiveDiaryList.sort(((b, a) => a.date.compareTo(b.date)));
    negativeDiaryList.sort(((b, a) => a.date.compareTo(b.date)));
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
  Rx<String?> title = null.obs;
  void donePositivePress() {
    if (isPressed.value) {
      ListPositveDiary.listPositiveDiary[currentDiary.value].diary =
          editingController.text;
      positiveDiaryList[currentDiary.value].diary = editingController.text;
      positiveDiaryList.refresh();
      isPressed.value = false;
      Get.back();
    } else
      Get.back();
  }

  void doneNegativePress() {
    if (isPressed.value) {
      ListNegativeDiary.listNegativeDiary[currentDiary.value].diary =
          editingController.text;
      negativeDiaryList[currentDiary.value].diary = editingController.text;
      negativeDiaryList.refresh();
      isPressed.value = false;
      Get.back();
    } else
      Get.back();
  }
}
