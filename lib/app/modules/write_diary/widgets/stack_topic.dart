import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/data/models/list_topic.dart';
import 'package:remood/app/modules/write_diary/diary_controller.dart';
import 'package:remood/app/global_widgets/card_topic.dart';

class StackTopic extends StatelessWidget {
  const StackTopic({super.key});

  @override
  Widget build(BuildContext context) {
    ListTopic ListTopics = ListTopic();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    DiaryController topicController = Get.find();
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: screenWidth * 0.731,
          height: screenHeight * 0.115,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.primary)),
          child: Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.038,
              bottom: screenHeight * 0.0172,
              left: screenWidth * 0.0773,
              right: screenWidth * 0.0773,
            ),
            child: Row(
              children: [
// list topic
                SizedBox(
                  width: screenWidth * 0.44,
                  child: Obx(
                    () => ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) => GestureDetector(
                            onTap: () {
                              // Chang the current index
                              topicController.changeTopic(index);

                              // Change the current icon
                              topicController.iconTopic.value = IconData(
                                ListTopic.topics[index].icons,
                                fontFamily: 'MaterialIcons',
                              );

                              // Change the current color
                              topicController.colorDiary.value =
                                  Color(ListTopic.topics[index].TopicColor);

                              // Change the current title
                              topicController.titleDiary.value =
                                  ListTopic.topics[index].title;
                            },
                            child: TopicCard(
                              topic: topicController.listTopic[index],
                              index: index,
                              currentIndex: topicController.currentTopic,
                            ),
                          )),
                      separatorBuilder: ((context, index) => SizedBox(
                            width: screenWidth * 0.024,
                          )),
                      itemCount: topicController.listTopic.length,
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.024,
                ),
// Add button
                SizedBox(
                  width: screenWidth * 0.093,
                  height: screenHeight * 0.059,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: (() {
                          // open bottomsheet
                          topicController.createTopic(context);
                        }),
                        child: Container(
                          alignment: Alignment.topCenter,
                          height: screenHeight * 0.043,
                          width: screenWidth * 0.093,
                          decoration: BoxDecoration(
                            color: AppColors.primary13,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.add,
                              color: AppColors.backgroundColor,
                              size: 19,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
// "Topic" container
        Positioned(
          top: -30,
          left: -26,
          child: Container(
            width: screenWidth * 0.224,
            height: screenHeight * 0.061,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.primary),
            ),
            child: const Center(
                child: Text(
              'Topic',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                  fontSize: 18),
            )),
          ),
        ),
      ],
    );
  }
}
