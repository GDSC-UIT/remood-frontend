import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/data/models/topic.dart';
import 'package:remood/app/modules/setting/setting_controller.dart';
import 'package:remood/app/modules/setting/widgets/col_topic_avt.dart';
import 'package:remood/app/modules/write_diary/diary_controller.dart';
import 'package:remood/app/routes/app_routes.dart';

class ColTopicList extends StatelessWidget {
  const ColTopicList({
    Key? key,
    required this.list,
  }) : super(key: key);
  final RxList<CardTopic> list;

  @override
  Widget build(BuildContext context) {
    final settingController = Get.find<SettingController>();
    final diaryController = Get.find<DiaryController>();
    RxList<CardTopic> topicList = list;
    TextStyle topicLabelStyle = settingController.settingLabelStyle;

    return Obx(
      () => Column(
        children: List.generate(
          list.length,
          (index) => GestureDetector(
            onTap: () {
              log(topicList[index].title);

              // Gán thứ tự topic được chọn
              settingController.currentTopic(topicList[index]);
              diaryController.currentTopic(index);

              Get.toNamed(AppRoutes.topicDetail);
            },
            child: ListTile(
              leading: TopicAvatar(
                topic: list[index],
                index: index,
                currentIndex: index.obs,
              ),
              trailing: Image.asset(Assets.arrowRight),
              title: Text(
                list[index].title,
                style: topicLabelStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
