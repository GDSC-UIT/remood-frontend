import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/data/models/topic.dart';

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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: screenWidth * 0.093,
      height: screenHeight * 0.059,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => Container(
              height: screenHeight * 0.043,
              width: screenWidth * 0.093,
              decoration: BoxDecoration(
                color: currentIndex.value == index
                    ? Color(topic.TopicColor)
                    : AppColors.grey22,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Icon(
                  // IconData(
                  //   topic.icons,
                  //   fontFamily: 'MaterialIcons',
                  // ),
                  Icons.abc,
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
