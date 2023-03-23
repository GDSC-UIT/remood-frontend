import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/data/models/topic.dart';
import 'package:remood/app/modules/setting/setting_controller.dart';
import 'package:remood/app/modules/setting/widgets/col_topic_avt.dart';
import 'package:remood/app/routes/app_routes.dart';

class ColTopicList extends StatelessWidget {
  const ColTopicList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final settingController = Get.find<SettingController>();
    TextStyle topicLabelStyle = settingController.settingLabelStyle;
    RxList<CardTopic> list = settingController.listTopic;

    return GetBuilder<SettingController>(
      init: SettingController(),
      initState: (_) {},
      builder: (_) {
        return Column(
          children: List.generate(
            list.length,
            (index) => GestureDetector(
              onTap: () {
                log(list[index].title);

                // Gán thứ tự topic được chọn
                settingController.currentTopic(list[index]);
                settingController.currentTopicIndex(index);

                log(list[index].icons.toString());

                // Chuyển đến trang "Cài đặt topic"
                Get.toNamed(AppRoutes.topicDetail);
                // var res = await Get.toNamed(AppRoutes.topicDetail);
                // list.value = res;
              },
              child: GetBuilder<SettingController>(
                builder: (_) {
                  return ListTile(
                    // Topic icon
                    leading: TopicAvatar(
                      topic: list[index],
                      index: index,
                      currentIndex: index.obs,
                    ),

                    // Right-arrow icon
                    trailing: Image.asset(Assets.arrowRight),

                    // Topic label
                    title: Text(
                      list[index].title,
                      style: topicLabelStyle,
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
