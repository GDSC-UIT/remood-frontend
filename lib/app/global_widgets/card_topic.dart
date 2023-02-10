import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/data/models/topic.dart';
import 'package:remood/app/modules/write_diary/diary_controller.dart';

class TopicCard extends StatelessWidget {
  CardTopic topic;
  int index;
  RxInt currentIndex;
  TopicCard({
    super.key,
    required this.topic,
    required this.index,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
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
                color: currentIndex.value == index
                    ? Color(topic.TopicColor)
                    : AppColors.grey22,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Icon(
                  IconData(
                    topic.icons,
                    fontFamily: 'MaterialIcons',
                  ),
                  color: currentIndex.value == index
                      ? Color(topic.TopicColor).withOpacity(1)
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
