import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/data/models/topic.dart';
import 'package:remood/app/modules/setting/screens/mt_create_new_topic_screen.dart';
import 'package:remood/app/modules/setting/setting_controller.dart';
import 'package:remood/app/modules/setting/widgets/confirm_button.dart';
import 'package:remood/app/modules/setting/widgets/stack_setting_appbar.dart';
import 'package:remood/app/routes/app_routes.dart';

class TopicDetailScreen extends StatelessWidget {
  const TopicDetailScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final SettingController controller = Get.find();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    String appBarTitle = controller.currentTopic.value.title;
    CardTopic currentTopic = controller.currentTopic.value;
    double widthValueBox = screenWidth * 0.1;

    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                StackSettingAppbar(
                  title: appBarTitle,
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.033,
                    right: screenWidth * 0.053,
                  ),
                  alignment: Alignment.topRight,
                  child: const Icon(Icons.delete_outline),
                ),
              ],
            ),
            const SizedBox(
              height: 13.0,
            ),
// Rename
            GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.renameTopic),
              child: Container(
                width: screenWidth,
                padding: const EdgeInsets.only(
                    right: 35, left: 25, top: 8, bottom: 8),
                color: AppColors.settingTopicProps,
                child: Row(
                  children: [
                    // Label
                    Text(
                      "Rename",
                      style: CustomTextStyle.h3(
                        Colors.black,
                      ).copyWith(fontSize: 14),
                    ),

                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // Value
                          Text(
                            currentTopic.title,
                            style: CustomTextStyle.normalText(
                              Color(controller.currentTopic.value.TopicColor)
                                  .withOpacity(1),
                            ),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          // Arrow-right icon
                          const Icon(Icons.keyboard_arrow_right),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.0197,
            ),
// Change icon
            GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.changeIconTopic),
              child: Container(
                width: screenWidth,
                padding: const EdgeInsets.only(
                    right: 35, left: 25, top: 8, bottom: 8),
                color: AppColors.settingTopicProps,
                child: Row(
                  children: [
                    // Label
                    Text(
                      "Change icon",
                      style: CustomTextStyle.h3(
                        Colors.black,
                      ).copyWith(fontSize: 14),
                    ),

                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // Value
                          SizedBox(
                            width: widthValueBox,
                            child: Icon(
                              IconData(currentTopic.icons,
                                  fontFamily: "MaterialIcons"),
                              color:
                                  Color(currentTopic.TopicColor).withOpacity(1),
                            ),
                          ),

                          // Arrow-right icon
                          const Icon(Icons.keyboard_arrow_right),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.0197,
            ),
// Change color
            GestureDetector(
              onTap: () => Get.toNamed(AppRoutes.changeColorTopic),
              child: Container(
                width: screenWidth,
                padding: const EdgeInsets.only(
                    right: 35, left: 25, top: 8, bottom: 8),
                color: AppColors.settingTopicProps,
                child: Row(
                  children: [
                    // Label
                    Text(
                      "Change color",
                      style: CustomTextStyle.h3(
                        Colors.black,
                      ).copyWith(fontSize: 14),
                    ),

                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // Value
                          Container(
                            margin:
                                EdgeInsets.only(right: screenWidth * 0.0267),
                            height: screenHeight * 0.024,
                            width: screenWidth * 0.053,
                            decoration: BoxDecoration(
                              color: Color(currentTopic.TopicColor),
                              shape: BoxShape.circle,
                            ),
                          ),

                          // Arrow-right icon
                          const Icon(Icons.keyboard_arrow_right),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
// Done button
            const ConfirmButton(label: "Done"),
            SizedBox(
              height: screenHeight * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
