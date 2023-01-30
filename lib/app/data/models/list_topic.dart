import 'package:flutter/material.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/data/models/topic.dart';

class ListTopic {
  List<CardTopic> topics = [
    CardTopic(
      title: "Work",
      TopicColor: AppColors.lightGreen18,
      icons: Icons.work,
    ),
    CardTopic(
      title: "Love",
      TopicColor: AppColors.lightRed22,
      icons: Icons.favorite,
    ),
    CardTopic(
      title: "Friends",
      TopicColor: AppColors.lightOrange27,
      icons: Icons.group,
    ),
    CardTopic(
      title: "Family",
      TopicColor: AppColors.lightPurple22,
      icons: Icons.family_restroom,
    ),
  ];
}
