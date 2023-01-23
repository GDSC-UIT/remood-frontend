import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/data/models/topic.dart';
import 'package:remood/app/modules/home/home_controller.dart';

class TopicSortCard extends StatelessWidget {
  CardTopic topic;
  int index;
  TopicSortCard({
    super.key,
    required this.topic,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    HomeController currentTopicIndex = Get.find();
    return SizedBox(
      width: _screenWidth * 0.093,
      height: _screenHeight * 0.059,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => Container(
              height: _screenHeight * 0.043,
              width: _screenWidth * 0.093,
              decoration: BoxDecoration(
                color: currentTopicIndex.currentTopic.value == index
                    ? topic.TopicColor
                    : AppColors.grey22,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Icon(
                  topic.icons,
                  color: currentTopicIndex.currentTopic.value == index
                      ? topic.TopicColor.withOpacity(1)
                      : AppColors.darkBlue,
                  size: 19,
                ),
              ),
            ),
          ),
          Text(
            topic.title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 8,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
