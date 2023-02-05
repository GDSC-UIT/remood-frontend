import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/data/models/list_selected_icons_topic.dart';
import 'package:remood/app/data/models/topic.dart';
import 'package:remood/app/modules/setting/setting_controller.dart';
import 'package:remood/app/modules/setting/widgets/confirm_button.dart';
import 'package:remood/app/modules/setting/widgets/stack_setting_appbar.dart';
import 'package:remood/app/modules/write_diary/diary_controller.dart';

class ChangeIconTopicScreen extends StatelessWidget {
  const ChangeIconTopicScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String appBarTitle = "Change icon";
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    SettingController settingController = Get.find();
    DiaryController diaryController = Get.find();
    ListSelectedIcons listSelectedIcons = ListSelectedIcons();
    CardTopic currentTopic = settingController.currentTopic.value;

    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      body: SafeArea(
        child: Column(
          children: [
            StackSettingAppbar(
              title: appBarTitle,
            ),
            SizedBox(
              height: screenHeight * 0.0332,
            ),

// Icon list
// TODO: Change to current topic icon
            SizedBox(
              width: screenWidth * 0.89,
              height: screenHeight * 0.13,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                  crossAxisSpacing: screenWidth * 0.067,
                  mainAxisSpacing: screenHeight * 0.035,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (() {
                      diaryController.changeIconTopic(
                          index, listSelectedIcons.selectedIcons[index]);
                    }),
                    child: Obx(
                      () => Container(
                        width: screenWidth * 0.093,
                        height: screenHeight * 0.043,
                        decoration: BoxDecoration(
                          color: diaryController.currentIconTopic.value == index
                              ? diaryController.colorTopic.value
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          listSelectedIcons.selectedIcons[index],
                          color: diaryController.currentIconTopic.value == index
                              ? diaryController.colorTopic.value.withOpacity(1)
                              : AppColors.darkBlue,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),

// Save button
            const ConfirmButton(label: "Save"),
            SizedBox(
              height: screenHeight * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
