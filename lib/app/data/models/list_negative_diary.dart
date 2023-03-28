import 'package:hive/hive.dart';
import 'package:remood/app/data/models/diary.dart';
import 'package:flutter/material.dart';
import 'package:remood/app/core/values/app_colors.dart';

class ListNegativeDiary {
  static List<Diary> listNegativeDiary = [];
  final _mybox = Hive.box('mybox');
  void createInitialData() {
    listNegativeDiary = [];
  }

  void loadData() {
    listNegativeDiary = _mybox.get("negativediary")!.cast<Diary>();
  }

  void updateDatabase() {
    _mybox.put("negativediary", listNegativeDiary);
  }
}
