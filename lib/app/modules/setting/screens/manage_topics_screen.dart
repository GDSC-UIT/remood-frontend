import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/data/models/list_topic.dart';
import 'package:remood/app/data/models/topic.dart';
import 'package:remood/app/modules/setting/setting_controller.dart';
import 'package:remood/app/modules/setting/widgets/col_topic_avt.dart';
import 'package:remood/app/modules/setting/widgets/col_topic_list.dart';
import 'package:remood/app/modules/setting/widgets/stack_setting_appbar.dart';
import 'package:remood/app/modules/write_diary/diary_controller.dart';
import 'package:remood/app/routes/app_routes.dart';

class ManageTopicsScreen extends StatelessWidget {
  const ManageTopicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingController settingController = Get.find();
    final DiaryController diaryController = Get.find();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    String titleAddButton = "Create new topic";
    TextStyle topicLabelStyle = settingController.settingLabelStyle;
    List<CardTopic> listTopic = diaryController.listTopic;

    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      body: SafeArea(
        child: Column(
          children: [
            const StackSettingAppbar(title: "Manage topics"),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView(
                  children: [
// Topic list
                    ColTopicList(list: listTopic),

// Create-new-topic button
                    GestureDetector(
                      onTap: () {
                        log(titleAddButton);
                        Get.toNamed(AppRoutes.createNewTopic);
                      },
                      child: ListTile(
                        leading: TopicAvatar(
                            topic: CardTopic(
                              title: titleAddButton,
                              TopicColor: AppColors.grey22.value,
                              icons: Icons.add.codePoint,
                            ),
                            index: 0,
                            currentIndex: 0.obs),
                        trailing: Image.asset(Assets.arrowRight),
                        title: Text(
                          titleAddButton,
                          style: topicLabelStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
