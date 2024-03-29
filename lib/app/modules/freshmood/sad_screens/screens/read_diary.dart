import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/app_strings.dart';
import 'package:remood/app/modules/freshmood/freshmood_widgets/back_button.dart';
import 'package:remood/app/modules/freshmood/sad_screens/sad_screen_controller.dart';
import 'package:remood/app/modules/freshmood/sad_screens/widgets/list_negative_diary_card.dart';
import 'package:remood/app/modules/freshmood/sad_screens/widgets/list_positive_diary_card.dart';
import 'package:remood/app/routes/app_routes.dart';

class ReadDiaryFreshmood extends StatelessWidget {
  const ReadDiaryFreshmood({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    SadController diaryController = Get.find();
    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BackButtonContainer(),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              width: screenWidth * 0.355,
              height: 37,
              decoration: BoxDecoration(
                  color: AppColors.tagColors,
                  borderRadius: BorderRadius.circular(40)),
              child: Center(
                child: Text(
                  AppStrings.nameTagDiary[diaryController.currentChoice.value],
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              width: screenWidth * 0.84,
              height: screenHeight * 0.65,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: diaryController.currentChoice == 0
                    ? const Center(
                        child: PositiveDiaryListFreshmood(),
                      )
                    : const Center(
                        child: NegativeDiaryListFreshmood(),
                      ),
              ),
            ),
          ),
          const SizedBox(
            height: 19,
          ),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.67),
            child: GestureDetector(
              onTap: () {
                // next
                diaryController.currentChoice.value == 0
                    ? Get.toNamed(AppRoutes.home)
                    : Get.toNamed(AppRoutes.finalNegativeScreen);
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
