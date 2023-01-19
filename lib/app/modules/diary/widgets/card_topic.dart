import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/data/models/topic.dart';

class TopicCard extends StatelessWidget {
  CardTopic topic;
  TopicCard({
    super.key,
    required this.topic,
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
          Container(
            height: _screenHeight * 0.043,
            width: _screenWidth * 0.093,
            decoration: BoxDecoration(
              color: topic.TopicColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Icon(
                topic.icons,
                color: topic.TopicColor.withOpacity(1),
                size: 19,
              ),
            ),
          ),
          Text(
            topic.title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
