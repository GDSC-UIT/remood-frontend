import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/data/models/list_topic.dart';
import 'package:remood/app/global_widgets/card_topic.dart';
import 'package:remood/app/modules/freshmood/sad_screens/sad_screen_controller.dart';
import 'package:remood/app/modules/home/home_controller.dart';
import 'package:remood/app/routes/app_routes.dart';

class SadScreen extends StatelessWidget {
  const SadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ListTopic ListTopics = ListTopic();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    HomeController changeAsset = Get.find();
    SadController changeTopic = Get.find();
    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
// back container
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 22),
            child: GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.home);
              },
              child: Container(
                height: 46,
                width: 46,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 1.0,
                        offset: Offset(1, 1),
                      )
                    ],
                    borderRadius: BorderRadius.circular(10)),
                child: const Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 17,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.18,
          ),
// message container
          Center(
            child: Container(
              width: screenWidth * 0.72,
              height: screenHeight * 0.09,
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
            child: SizedBox(
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
              width: screenWidth * 0.84,
              height: screenHeight * 0.134,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(blurRadius: 1, offset: Offset(1, 1))
                ],
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
                              width: screenWidth * 0.024,
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
          const SizedBox(
            height: 22,
          ),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.67),
            child: GestureDetector(
              onTap: () {
                // next
                Get.toNamed(AppRoutes.choosefreshmood);
              },
              child: Container(
                width: screenWidth * 0.253,
                height: screenHeight * 0.05,
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(blurRadius: 1, offset: Offset(1, 1))
                    ],
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
