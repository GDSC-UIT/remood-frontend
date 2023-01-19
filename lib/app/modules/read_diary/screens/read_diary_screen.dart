import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/modules/write_diary/diary_controller.dart';
import 'package:remood/app/modules/read_diary/widgets/card_diary.dart';
import 'package:remood/app/modules/write_diary/widgets/list_negative_diary_card.dart';
import 'package:remood/app/modules/read_diary/widgets/list_positive_diary_card.dart';
import 'package:remood/app/modules/home/home_controller.dart';

class ReadDiaryScreen extends StatefulWidget {
  ReadDiaryScreen({super.key});

  @override
  State<ReadDiaryScreen> createState() => _ReadDiaryScreenState();
}

class _ReadDiaryScreenState extends State<ReadDiaryScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    DiaryController diaryController = Get.find<DiaryController>();
    return Scaffold(
      backgroundColor: AppColors.BackgroundColor,
      body: Column(
        children: [
// tab bar
          Padding(
            padding: EdgeInsets.only(
              top: _screenHeight * 0.078,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
// search button
                IconButton(
                  icon: const Icon(
                    Icons.search,
                    size: 25,
                  ),
                  onPressed: (() {
                    //search
                  }),
                ),
// tab bar
                Container(
                  width: _screenWidth * 0.71,
                  height: _screenHeight * 0.055,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(45)),
                  child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: TabBar(
                        unselectedLabelColor: AppColors.Greyscale,
                        labelColor: Colors.white,
                        indicatorColor: AppColors.TagColors,
                        indicatorWeight: 2,
                        indicator: BoxDecoration(
                          color: AppColors.TagColors,
                          borderRadius: BorderRadius.circular(45),
                        ),
                        controller: tabController,
                        tabs: const [
                          Tab(
                            text: 'Positive diary',
                          ),
                          Tab(
                            text: 'Negative diary',
                          )
                        ],
                      )),
                ),
// sort button
                IconButton(
                  icon: const Icon(
                    Icons.sort,
                    size: 25,
                  ),
                  onPressed: () {
                    // sort
                  },
                ),
              ],
            ),
          ),
// tab bar view
          SizedBox(
            height: _screenHeight * 0.01,
          ),
          Container(
            height: _screenHeight * 0.68,
            width: _screenWidth * 0.837,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(31),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: _screenHeight * 0.0209,
                left: _screenWidth * 0.056,
                right: _screenWidth * 0.056,
                bottom: _screenHeight * 0.0172,
              ),
              child: SizedBox(
                height: _screenHeight * 0.651,
                child: TabBarView(controller: tabController, children: [
                  PositiveDiaryList(),
                  NegativeDiaryList(),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
