import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/data/models/list_selected_color_topic.dart';
import 'package:remood/app/data/models/list_selected_icons_topic.dart';
import 'package:remood/app/modules/setting/widgets/confirm_button.dart';
import 'package:remood/app/modules/setting/widgets/stack_setting_appbar.dart';
import 'package:remood/app/modules/write_diary/diary_controller.dart';
import 'package:remood/app/modules/write_diary/widgets/bottom_sheet_add_topic.dart';

class CreateNewTopicScreen extends StatelessWidget {
  const CreateNewTopicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DiaryController controller = Get.find();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    ListSelectedIcons listSelectedIcons = ListSelectedIcons();
    ListSelectedColor listSelectedColor = ListSelectedColor();
    double px20w = screenWidth * 0.053;
    double px4w = screenWidth * 0.01067;
    double px11h = screenHeight * 0.0135;

    String appBarTitle = "Create new topic";
    String name;

    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      body: SafeArea(
        child: Column(
          children: [
            StackSettingAppbar(
              title: appBarTitle,
            ),
            SizedBox(height: px11h),
            Padding(
              padding: EdgeInsets.only(left: px20w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
// "Name"
                  Text(
                    "Name",
                    style: CustomTextStyle.h2(Colors.black),
                  ),
                  SizedBox(
                    height: screenHeight * 0.015,
                  ),
// Textfield
                  SizedBox(
                    width: screenWidth * 0.872,
                    child: TextField(
                      controller: controller.titleController,
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
                      ),
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
// Underline
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: AppColors.greyscale),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.015,
                  ),
//"Icon"
                  Text(
                    "Icon",
                    style: CustomTextStyle.h2(Colors.black),
                  ),

                  SizedBox(height: screenHeight * 0.0135),
// Icon gridview
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
                            controller.changeIconTopic(
                                index, listSelectedIcons.selectedIcons[index]);
                          }),
                          child: Obx(
                            () => Container(
                              width: screenWidth * 0.093,
                              height: screenHeight * 0.043,
                              decoration: BoxDecoration(
                                color:
                                    controller.currentIconTopic.value == index
                                        ? controller.colorTopic.value
                                        : AppColors.grey22,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                listSelectedIcons.selectedIcons[index],
                                color: controller.currentIconTopic.value ==
                                        index
                                    ? controller.colorTopic.value.withOpacity(1)
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
// "Color"
                  Text(
                    "Color",
                    style: CustomTextStyle.h2(Colors.black),
                  ),

                  SizedBox(height: screenHeight * 0.0135),
// selected Icon color
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
                              controller.changeColorTopic(index,
                                  listSelectedColor.selectedColors[index]);
                            },
                            child: Obx(
                              () => Container(
                                width: screenWidth * 0.093,
                                height: screenHeight * 0.043,
                                decoration: BoxDecoration(
                                  color:
                                      listSelectedColor.selectedColors[index],
                                  borderRadius: BorderRadius.circular(10),
                                  border: controller.currentColorTopic.value ==
                                          index
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
                ],
              ),
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
