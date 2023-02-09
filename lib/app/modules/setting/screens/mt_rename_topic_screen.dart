import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/data/models/list_topic.dart';
import 'package:remood/app/modules/setting/setting_controller.dart';
import 'package:remood/app/modules/setting/widgets/confirm_button.dart';
import 'package:remood/app/modules/setting/widgets/stack_setting_appbar.dart';
import 'package:remood/app/modules/write_diary/diary_controller.dart';

class RenameTopicScreen extends StatelessWidget {
  const RenameTopicScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    DiaryController diaryController = Get.find();
    SettingController settingController = Get.find();

    String appBarTitle = "Rename";
    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      body: SafeArea(
        child: Column(
          children: [
            StackSettingAppbar(
              title: appBarTitle,
            ),
            const SizedBox(
              height: 15,
            ),
// Textfield
            SizedBox(
              width: screenWidth * 0.872,
              child: TextField(
                controller: diaryController.topicName,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: AppColors.mainColor,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  hintText: settingController.currentTopic.value.title,
                  hintStyle: CustomTextStyle.normalText(AppColors.grey),
                ),
                style: const TextStyle(fontSize: 20),
              ),
            ),
            // Save button
            ConfirmButton(
              label: "Save",
              func: diaryController.renameTopicSetting,
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
