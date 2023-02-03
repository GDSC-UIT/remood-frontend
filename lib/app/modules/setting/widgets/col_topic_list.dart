import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/number_symbols_data.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/data/models/topic_button.dart';
import 'package:remood/app/global_widgets/card_topic.dart';
import 'package:remood/app/modules/setting/setting_controller.dart';

class ColTopicList extends StatelessWidget {
  const ColTopicList({
    Key? key,
    required this.list,
  }) : super(key: key);
  final List<TopicButton> list;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SettingController>();
    List<TopicButton> topicList = list;
    TextStyle topicLabelStyle = controller.settingLabelStyle;

    return Column(
      children: List.generate(
        topicList.length,
        (index) => GestureDetector(
          onTap: () {
            log(topicList[index].label);
            controller.currentTopic = topicList[index].obs;
            Get.toNamed(topicList[index].screen.toString());
          },
          child: ListTile(
            leading: TopicCard(
                topic: topicList[index].icon,
                index: index,
                currentIndex: index.obs),
            trailing: Image.asset(Assets.arrowRight),
            title: Text(
              topicList[index].label,
              style: topicLabelStyle,
            ),
          ),
        ),
      ),
    );
  }
}
