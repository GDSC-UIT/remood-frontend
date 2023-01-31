import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'topic.g.dart';

@HiveType(typeId: 1)
class CardTopic {
  @HiveField(0)
  String title;
  @HiveField(1)
  int icons;
  @HiveField(2)
  int TopicColor;
  CardTopic({
    required this.title,
    required this.TopicColor,
    required this.icons,
  });
}
