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
    // Controller
    SettingController settingController = Get.find();
    DiaryController diaryController = Get.find();

    // Data
    String appBarTitle = "Change icon";
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    ListSelectedIcons listSelectedIcons = ListSelectedIcons();
    var currentTopic = settingController.currentTopic;
    var currentIconTopic = settingController.currentTopicIcon;
    var colorTopic = diaryController.colorTopic;

    // Function
    var changeIconTopic = settingController.changeTopicIconIndex;
    var changeIconTopicSetting = settingController.changeIconTopicSetting;

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
                    onTap: () {
                      // Icon được bấm vào được cập nhậ
                      changeIconTopic(index);

                      // * TODO: Khởi tạo màu cho currentIconTopic (int - số thứ tự) là màu của currentTopic.icons (int - số codePoint)
                      // currentTopic.icons =
                      //     listSelectedIcons.selectedIcons[index].codePoint;
                    },
                    child: Obx(
                      () => Container(
                        width: screenWidth * 0.093,
                        height: screenHeight * 0.043,
                        decoration: BoxDecoration(
                          // Icon được bấm vào thì background của icon được tô màu
                          color: currentIconTopic.value == index
                              ? colorTopic.value
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          listSelectedIcons.selectedIcons[index],
                          // Icon được bấm vào thì icon được tô màu đậm
                          color: currentIconTopic.value == index
                              ? colorTopic.value.withOpacity(1)
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
// TODO: ----Stuck----- Change-icon function
// Parent page does not update when Get.back()
            ConfirmButton(
              label: "Save",
              func: changeIconTopicSetting,
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
