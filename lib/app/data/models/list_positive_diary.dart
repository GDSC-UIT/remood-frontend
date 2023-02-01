import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/data/models/diary.dart';

class ListPositveDiary {
  static var listPositiveDiary = <Diary>[
    Diary(
      diary:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris interdum sapien sodales mi sagittis hendrerit. Curabitur ut lectus nec orci cursus rhoncus. Donec a ultrices risus. ",
      date: DateTime.now(),
      diaryColor: AppColors.lightGreen18,
      icon: Icons.work,
      title: "Work",
    ),
    Diary(
      diary:
          "Mauris interdum sapien sodales mi sagittis hendrerit. Curabitur ut lectus nec orci cursus rhoncus. Donec a ultrices risus. ",
      date: DateTime.now(),
      diaryColor: AppColors.lightGreen18,
      icon: Icons.work,
      title: "Work",
    ),
    Diary(
      diary:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris interdum sapien sodales mi sagittis hendrerit. Curabitur ut lectus nec orci cursus rhoncus. Donec a ultrices risus. ",
      date: DateTime.now(),
      diaryColor: AppColors.lightGreen18,
      icon: Icons.work,
      title: "Love",
    ),
    Diary(
      diary:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris interdum sapien sodales mi sagittis hendrerit. Curabitur ut lectus nec orci cursus rhoncus. Donec a ultrices risus. ",
      date: DateTime.now(),
      diaryColor: AppColors.lightGreen18,
      icon: Icons.work,
      title: "Love",
    ),
    Diary(
      diary:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris interdum sapien sodales mi sagittis hendrerit. Curabitur ut lectus nec orci cursus rhoncus. Donec a ultrices risus. ",
      date: DateTime.now(),
      diaryColor: AppColors.lightGreen18,
      icon: Icons.work,
      title: "Work",
    ),
  ];
  final _mybox = Hive.box<List>('mybox');
  void createInitialData() {
    listPositiveDiary = [
      Diary(
        diary:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris interdum sapien sodales mi sagittis hendrerit. Curabitur ut lectus nec orci cursus rhoncus. Donec a ultrices risus. ",
        date: DateTime.now(),
        diaryColor: AppColors.lightGreen18,
        icon: Icons.work,
        title: "Work",
      ),
      Diary(
        diary:
            "Mauris interdum sapien sodales mi sagittis hendrerit. Curabitur ut lectus nec orci cursus rhoncus. Donec a ultrices risus. ",
        date: DateTime.utc(2022, 12, 9),
        diaryColor: AppColors.lightGreen18,
        icon: Icons.work,
        title: "Work",
      ),
    ];
  }

  void loadData() {
    listPositiveDiary = _mybox.get("positivediary")!.cast<Diary>();
  }

  void updateDatabase() {
    _mybox.put("positivediary", listPositiveDiary);
  }
}
