import 'package:flutter/cupertino.dart';

class Diary {
  String diary;
  DateTime date;
  IconData icon;
  Color diaryColor;
  String title;
  Diary({
    required this.diary,
    required this.date,
    required this.diaryColor,
    required this.icon,
    required this.title,
  });
}
