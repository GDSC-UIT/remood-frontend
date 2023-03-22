import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/modules/read_diary/read_diary_controller.dart';
import 'package:remood/app/modules/read_diary/widgets/list_negative_diary_card.dart';
import 'package:remood/app/modules/read_diary/widgets/list_positive_diary_card.dart';

class ReadDiaryScreen extends StatefulWidget {
  const ReadDiaryScreen({super.key});

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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    ReadDiaryController SearchAndSort = Get.find();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.backgroundPage,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // tab bar
            Padding(
              padding: EdgeInsets.only(
                top: screenHeight * 0.078,
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
                      SearchAndSort.searchDiary(context);
                    }),
                  ),
                  // tab bar
                  Container(
                    width: screenWidth * 0.71,
                    height: screenHeight * 0.055,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(45)),
                    child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: TabBar(
                          unselectedLabelColor: AppColors.greyscale,
                          labelColor: Colors.white,
                          indicatorColor: AppColors.tagColors,
                          indicatorWeight: 2,
                          indicator: BoxDecoration(
                            color: AppColors.tagColors,
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
                      SearchAndSort.sortPress.value =
                          !SearchAndSort.sortPress.value;

                      SearchAndSort.sortPress.value
                          ? SearchAndSort.sortBoxOldtoNew()
                          : SearchAndSort.sortBoxNewtoOld();
                    },
                  ),
                ],
              ),
            ),
            // tab bar view
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Container(
              height: screenHeight * 0.68,
              width: screenWidth * 0.837,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(31),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  top: screenHeight * 0.0209,
                  left: screenWidth * 0.056,
                  right: screenWidth * 0.056,
                  bottom: screenHeight * 0.0172,
                ),
                child: SizedBox(
                  height: screenHeight * 0.651,
                  child: TabBarView(controller: tabController, children: const [
                    PositiveDiaryList(),
                    NegativeDiaryList()
                  ]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
