import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'diary.g.dart';

@HiveType(typeId: 0)
class Diary extends HiveObject {
  @HiveField(0)
  String diary;
  @HiveField(1)
  DateTime date;
  @HiveField(2)
  int icon;
  @HiveField(3)
  int diaryColor;
  @HiveField(4)
  String title;
  @HiveField(5)
  String? image;
  @HiveField(6)
  bool? isPinned = false;
  Diary({
    required this.diary,
    required this.date,
    required this.diaryColor,
    required this.icon,
    required this.title,
    this.image,
  });
}
