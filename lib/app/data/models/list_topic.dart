import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/data/models/topic.dart';

class ListTopic {
  List<CardTopic> topics = [
    CardTopic(
      title: "Work",
      TopicColor: AppColors.LightGreen18,
      icons: Icons.work,
      IconColor: AppColors.LightGreen18.withOpacity(1),
    ),
    CardTopic(
      title: "Love",
      TopicColor: AppColors.LightRed22,
      icons: Icons.favorite,
      IconColor: AppColors.LightRed22.withOpacity(1),
    ),
    CardTopic(
      title: "Friends",
      TopicColor: AppColors.LightOrange27,
      icons: Icons.group,
      IconColor: AppColors.LightOrange27.withOpacity(1),
    ),
    CardTopic(
      title: "Family",
      TopicColor: AppColors.LightPurple22,
      icons: Icons.family_restroom,
      IconColor: AppColors.LightPurple22.withOpacity(1),
    ),
  ];
}
