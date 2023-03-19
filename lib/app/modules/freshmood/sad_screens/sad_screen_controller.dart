import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:remood/app/data/models/diary.dart';
import 'package:remood/app/data/models/list_negative_diary.dart';
import 'package:remood/app/data/models/list_positive_diary.dart';
import 'package:remood/app/data/models/list_topic.dart';
import 'package:remood/app/modules/freshmood/sad_screens/widgets/bottom_sheet_read_diary_freshmood.dart';

class SadController extends GetxController {
  final _mybox = Hive.box<List>('mybox');
  ListTopic hiveBoxListTopic = ListTopic();
  ListNegativeDiary hiveBoxListNegative = ListNegativeDiary();
  ListPositveDiary hiveBoxListPositive = ListPositveDiary();
  @override
  void onInit() {
    if (_mybox.get("topic") == null) {
      hiveBoxListTopic.createInitialData();
    } else {
      hiveBoxListTopic.loadData();
    }
    iconSelected = ListTopic.topics[0].icons;
    positiveDiaryList = ListPositveDiary.listPositiveDiary
        .where((element) =>
            element.icon.toString().contains(iconSelected.toString()))
        .toList();
    negativeDiarylist = ListNegativeDiary.listNegativeDiary
        .where((element) =>
            element.icon.toString().contains(iconSelected.toString()))
        .toList();
    super.onInit();
  }

  RxInt currentTopic = 0.obs;
  late int iconSelected;
  List<Diary> positiveDiaryList = <Diary>[];
  List<Diary> negativeDiarylist = <Diary>[];
  void changeTopic(index) {
    currentTopic.value = index;
    iconSelected = ListTopic.topics[index].icons;
    positiveDiaryList = ListPositveDiary.listPositiveDiary
        .where((element) =>
            element.icon.toString().contains(iconSelected.toString()))
        .toList();
    negativeDiarylist = ListNegativeDiary.listNegativeDiary
        .where((element) =>
            element.icon.toString().contains(iconSelected.toString()))
        .toList();
  }

  void sortDiaryTopic() {}

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
