import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/data/models/topic.dart';

class ListTopic {
  static List<CardTopic> topics = [
    CardTopic(
      title: "Work",
      TopicColor: AppColors.LightGreen18,
      icons: Icons.work,
    ),
    CardTopic(
      title: "Love",
      TopicColor: AppColors.LightRed22,
      icons: Icons.favorite,
    ),
    CardTopic(
      title: "Friends",
      TopicColor: AppColors.LightOrange27,
      icons: Icons.group,
    ),
    CardTopic(
      title: "Family",
      TopicColor: AppColors.LightPurple22,
      icons: Icons.family_restroom,
    ),
  ];
}
