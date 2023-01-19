import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/data/models/list_topic.dart';
import 'package:remood/app/modules/write_diary/diary_controller.dart';
import 'package:remood/app/modules/write_diary/widgets/bottom_sheet_add_topic.dart';
import 'package:remood/app/modules/write_diary/widgets/card_topic.dart';

class StackTopic extends StatelessWidget {
  const StackTopic({super.key});

  @override
  Widget build(BuildContext context) {
    ListTopic _ListTopics = ListTopic();
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    DiaryController topicController = Get.find();
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: _screenWidth * 0.731,
          height: _screenHeight * 0.115,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.Primary)),
          child: Padding(
            padding: EdgeInsets.only(
              top: _screenHeight * 0.038,
              bottom: _screenHeight * 0.0172,
              left: _screenWidth * 0.0773,
              right: _screenWidth * 0.0773,
            ),
            child: Row(
              children: [
// list topic
                SizedBox(
                  width: _screenWidth * 0.44,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) => TopicCard(
                          topic: _ListTopics.topics[index],
                        )),
                    separatorBuilder: ((context, index) => SizedBox(
                          width: _screenWidth * 0.024,
                        )),
                    itemCount: _ListTopics.topics.length,
                  ),
                ),
                SizedBox(
                  width: _screenWidth * 0.024,
                ),
// Add button
                SizedBox(
                  width: _screenWidth * 0.093,
                  height: _screenHeight * 0.059,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: (() {
                          // open bottomsheet
                          topicController.createTopic(context);
                        }),
                        child: Container(
                          alignment: Alignment.topCenter,
                          height: _screenHeight * 0.043,
                          width: _screenWidth * 0.093,
                          decoration: BoxDecoration(
                            color: AppColors.Primary13,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.add,
                              color: AppColors.BackgroundColor,
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
            width: _screenWidth * 0.224,
            height: _screenHeight * 0.061,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.Primary),
            ),
            child: const Center(
                child: Text(
              'Topic',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.Primary,
                  fontSize: 18),
            )),
          ),
        ),
      ],
    );
  }
}
