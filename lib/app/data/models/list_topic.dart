import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/data/models/topic.dart';

class ListTopic {
  static List<CardTopic> topics = [];
  final _mybox = Hive.box<List>('mybox');
  void createInitialData() {
    topics = [
      CardTopic(
        title: "Work",
        TopicColor: AppColors.lightGreen18.value,
        icons: Icons.work.codePoint,
      ),
      CardTopic(
        title: "Love",
        TopicColor: AppColors.lightRed22.value,
        icons: Icons.favorite.codePoint,
      ),
      CardTopic(
        title: "Friends",
        TopicColor: AppColors.lightOrange27.value,
        icons: Icons.group.codePoint,
      ),
      CardTopic(
        title: "Family",
        TopicColor: AppColors.lightPurple22.value,
        icons: Icons.family_restroom.codePoint,
      ),
    ];
  }

  void loadData() {
    topics = _mybox.get("topic")!.cast<CardTopic>();
  }

  void updateDatabase() {
    _mybox.put("topic", topics);
  }
}
