import 'package:flutter/cupertino.dart';
import 'dart:io';

class Diary {
  String diary;
  DateTime date;
  IconData icon;
  Color diaryColor;
  String title;
  File? image;
  Diary({
    required this.diary,
    required this.date,
    required this.diaryColor,
    required this.icon,
    required this.title,
    this.image,
  });
}
