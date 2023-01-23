import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/app_strings.dart';
import 'package:remood/app/data/models/list_topic.dart';
import 'package:remood/app/modules/home/home_controller.dart';

import 'package:remood/app/modules/read_diary/widgets/card_topic_sort.dart';

class SheetSortDiary extends StatelessWidget {
  const SheetSortDiary({super.key});

  @override
  Widget build(BuildContext context) {
    ListTopic _ListTopics = ListTopic();
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    HomeController sortDiary = Get.find();
    return Container(
      height: _screenHeight * 0.82,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
// "Sort"
          Padding(
            padding: EdgeInsets.only(
              top: _screenHeight * 0.039,
              left: _screenWidth * 0.064,
            ),
            child: const Text(
              "Sort",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(
            height: 17,
          ),
// latest sort
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _screenWidth * 0.0453),
            child: SizedBox(
              height: _screenHeight * 0.058,
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  width: 5,
                ),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
// container
                  return GestureDetector(
                    onTap: () {
                      sortDiary.ChangeSort(index);
                    },
                    child: Obx(
                      () => Container(
                        width: _screenWidth * 0.448,
                        height: _screenHeight * 0.058,
                        decoration: BoxDecoration(
                          color: sortDiary.currentSort.value == index
                              ? AppColors.mainColor
                              : AppColors.greyscale,
                          borderRadius: BorderRadius.circular(16),
                        ),
// nameSort
                        child: Center(
                          child: Text(
                            AppStrings.nameSort[index],
                            style: TextStyle(
                                color: sortDiary.currentSort.value == index
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: 2,
              ),
            ),
          ),
// underline
          const SizedBox(
            height: 21,
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.greyscale),
              ),
            ),
          ),
          const SizedBox(
            height: 9,
          ),
// "Sort by topic"
          const Padding(
            padding: EdgeInsets.only(left: 24),
            child: Text(
              "Sort by topic",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
// list topic
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _screenWidth * 0.165),
            child: SizedBox(
              width: _screenWidth * 0.67,
              height: _screenHeight * 0.059,
              child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) => GestureDetector(
                      onTap: (() {
                        sortDiary.ChangeTopic(index);
                      }),
                      child: TopicSortCard(
                        topic: _ListTopics.topics[index],
                        index: index,
                      ),
                    )),
                separatorBuilder: ((context, index) => SizedBox(
                      width: _screenWidth * 0.024,
                    )),
                itemCount: _ListTopics.topics.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
