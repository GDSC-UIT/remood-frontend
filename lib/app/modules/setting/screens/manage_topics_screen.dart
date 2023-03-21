import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/data/models/list_topic.dart';
import 'package:remood/app/data/models/topic.dart';
import 'package:remood/app/modules/setting/setting_controller.dart';
import 'package:remood/app/modules/setting/widgets/col_topic_avt.dart';
import 'package:remood/app/modules/setting/widgets/col_topic_list.dart';
import 'package:remood/app/modules/setting/widgets/stack_setting_appbar.dart';
import 'package:remood/app/routes/app_routes.dart';

class ManageTopicsScreen extends StatelessWidget {
  const ManageTopicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SettingController settingController = Get.find();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    String titleAddButton = "Create new topic";
    TextStyle topicLabelStyle = settingController.settingLabelStyle;

    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 24),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.home);
                    },
                    child: Container(
                      height: 46,
                      width: 46,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 1.0,
                              offset: Offset(1, 1),
                            )
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 17,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 28.0),
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Manage topics",
                    style: CustomTextStyle.h2(Colors.black),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView(
                  children: [
// Topic list
                    const ColTopicList(),

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
