import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/data/models/topic.dart';
import 'package:remood/app/global_widgets/card_topic.dart';
import 'package:remood/app/modules/setting/setting_controller.dart';

class ColButtonList extends StatelessWidget {
  const ColButtonList({
    Key? key,
    required this.list,
  }) : super(key: key);
  final List list;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SettingController>();
    List settingList = list;
    TextStyle settingLabelStyle = controller.settingLabelStyle;

    return Column(
      children: List.generate(
        settingList.length,
        (index) => GestureDetector(
          onTap: () {
            log(settingList[index].title);
            if (settingList[index].screen != null) {
              Get.toNamed(settingList[index].screen);
            }
          },
          child: ListTile(
            leading: settingList[index].icon.runtimeType == String
                ? Image.asset(settingList[index].icon)
                : TopicCard(
                    topic: settingList[index].icon,
                    index: index,
                    currentIndex: index.obs),
            trailing: Image.asset(Assets.arrowRight),
            title: Text(
              settingList[index].title,
              style: settingLabelStyle,
            ),
          ),
        ),
      ),
    );
  }
}
