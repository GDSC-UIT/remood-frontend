import 'package:hive/hive.dart';
import 'package:remood/app/data/models/diary.dart';
import 'package:flutter/material.dart';
import 'package:remood/app/core/values/app_colors.dart';

class ListNegativeDiary {
  static List<Diary> listNegativeDiary = [];
  final _mybox = Hive.box('mybox');
  void createInitialData() {
    listNegativeDiary = [
      Diary(
        diary:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris interdum sapien sodales mi sagittis hendrerit. Curabitur ut lectus nec orci cursus rhoncus. Donec a ultrices risus. ",
        date: DateTime.now(),
        diaryColor: AppColors.lightRed22.value,
        icon: Icons.work.codePoint,
        title: "Work",
      ),
      Diary(
        diary:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris interdum sapien sodales mi sagittis hendrerit. Curabitur ut lectus nec orci cursus rhoncus. Donec a ultrices risus. ",
        date: DateTime.now(),
        diaryColor: AppColors.lightRed22.value,
        icon: Icons.work.codePoint,
        title: "Work",
      ),
    ];
  }

  void loadData() {
    listNegativeDiary = _mybox.get("negativediary")!.cast<Diary>();
  }

  void updateDatabase() {
    _mybox.put("negativediary", listNegativeDiary);
  }
}
