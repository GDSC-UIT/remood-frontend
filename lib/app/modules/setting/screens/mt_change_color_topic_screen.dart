import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/data/models/list_selected_color_topic.dart';
import 'package:remood/app/data/models/setting_button.dart';
import 'package:remood/app/modules/setting/widgets/confirm_button.dart';
import 'package:remood/app/modules/setting/widgets/stack_setting_appbar.dart';
import 'package:remood/app/modules/write_diary/diary_controller.dart';

class ChangeColorTopicScreen extends StatelessWidget {
  const ChangeColorTopicScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String appBarTitle = "Change color";
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    DiaryController controller = Get.find();
    ListSelectedColor listSelectedColor = ListSelectedColor();

    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      body: SafeArea(
        child: Column(
          children: [
            StackSettingAppbar(
              title: appBarTitle,
            ),
            SizedBox(
              height: screenHeight * 0.0357,
            ),

// Color list
            // TODO: Change to current topic color
            SizedBox(
              width: screenWidth * 0.89,
              height: screenHeight * 0.13,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                  crossAxisSpacing: screenWidth * 0.067,
                  mainAxisSpacing: screenHeight * 0.035,
                ),
                itemCount: 12,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        controller.changeColorTopic(
                            index, listSelectedColor.selectedColors[index]);
                      },
                      child: Obx(
                        () => Container(
                          width: screenWidth * 0.093,
                          height: screenHeight * 0.043,
                          decoration: BoxDecoration(
                            color: listSelectedColor.selectedColors[index],
                            borderRadius: BorderRadius.circular(10),
                            border: controller.currentColorTopic.value == index
                                ? Border.all(color: Colors.black)
                                : Border.all(color: Colors.transparent),
                          ),
                        ),
                      ));
                },
              ),
            ),
            SizedBox(
              height: screenHeight * 0.187,
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
