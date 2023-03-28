import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/data/models/diary.dart';

class ListPositveDiary {
  static List<Diary> listPositiveDiary = [];
  final _mybox = Hive.box('mybox');
  void createInitialData() {
    listPositiveDiary = [];
  }

  void loadData() {
    listPositiveDiary = _mybox.get("positivediary")!.cast<Diary>();
  }

  void updateDatabase() {
    _mybox.put("positivediary", listPositiveDiary);
  }
}
