import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/data/models/list_topic.dart';
import 'package:remood/app/global_widgets/card_topic.dart';
import 'package:remood/app/modules/freshmood/freshmood_widgets/back_button.dart';
import 'package:remood/app/modules/freshmood/sad_screens/sad_screen_controller.dart';
import 'package:remood/app/modules/home/home_controller.dart';
import 'package:remood/app/routes/app_routes.dart';

class SadScreen extends StatelessWidget {
  const SadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ListTopic _ListTopics = ListTopic();
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    HomeController changeAsset = Get.find();
    SadController changeTopic = Get.find();
    return Scaffold(
      backgroundColor: AppColors.BackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
// back container
          const BackButtonContainer(),
          SizedBox(
            height: _screenHeight * 0.18,
          ),
// message container
          Center(
            child: Container(
              width: _screenWidth * 0.72,
              height: _screenHeight * 0.09,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Center(
                child: Text(
                  "What made you sad today?",
                  style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                ),
              ),
            ),
          ),
// arrow clipper
          Align(
            alignment: Alignment.center,
            child: ClipPath(
              clipper: ArrowClipper(),
              child: Container(
                height: 20,
                width: 30,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 13,
          ),
// icon feelings
          Center(
            child: Container(
              width: 56,
              height: 56,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.asset(changeAsset.valueSlider.value < 20
                    ? Assets.depressed
                    : Assets.sad),
              ),
            ),
          ),
          const SizedBox(
            height: 17,
          ),
// topic container
          Center(
            child: Container(
              width: _screenWidth * 0.84,
              height: _screenHeight * 0.134,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(blurRadius: 1, offset: Offset(1, 1))],
                borderRadius: BorderRadius.circular(23),
              ),
// list topic
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 18),
                    child: Container(
                      child: const Text(
                        "Choose a topic",
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                      ),
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: ((context, index) => GestureDetector(
                              onTap: (() {
                                changeTopic.changeTopic(index);
                              }),
                              child: TopicCard(
                                topic: ListTopic.topics[index],
                                index: index,
                                currentIndex: changeTopic.currentTopic,
                              ),
                            )),
                        separatorBuilder: ((context, index) => SizedBox(
                              width: _screenWidth * 0.024,
                            )),
                        itemCount: ListTopic.topics.length,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
// Next button
          SizedBox(
            height: 22,
          ),
          Padding(
            padding: EdgeInsets.only(left: _screenWidth * 0.67),
            child: GestureDetector(
              onTap: () {
                // next
                Get.toNamed(AppRoutes.choosefreshmood);
              },
              child: Container(
                width: _screenWidth * 0.253,
                height: _screenHeight * 0.05,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(blurRadius: 1, offset: Offset(1, 1))],
                    borderRadius: BorderRadius.circular(23)),
                child: const Center(
                  child: Text(
                    "Next",
                    style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width / 2, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
