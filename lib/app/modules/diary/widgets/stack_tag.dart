import 'package:flutter/material.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/app_strings.dart';
import 'package:remood/app/modules/diary/diary_controller.dart';
import 'package:get/get.dart';

class StackTag extends StatelessWidget {
  const StackTag({super.key});

  @override
  Widget build(BuildContext context) {
    DiaryController changTag = Get.find();
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: _screenWidth * 0.731,
            height: _screenHeight * 0.09,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.Primary)),
            // Positve \ Negative tag
            child: Padding(
              padding: EdgeInsets.only(
                  left: _screenWidth * 0.048,
                  top: _screenHeight * 0.034,
                  bottom: _screenHeight * 0.025),
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  width: _screenWidth * 0.048,
                ),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  // container
                  return GestureDetector(
                    onTap: () => {changTag.changeColortag(index)},
                    child: Obx(
                      () => Container(
                        width: _screenWidth * 0.293,
                        height: _screenHeight * 0.031,
                        decoration: BoxDecoration(
                          color: changTag.current.value == index
                              ? AppColors.MainColor
                              : Colors.white,
                          border: Border.all(color: AppColors.MainColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // nameTag
                        child: Center(
                          child: Text(
                            AppStrings.nameTag[index],
                            style: TextStyle(
                                color: changTag.current.value == index
                                    ? Colors.white
                                    : AppColors.TagColors,
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
          // 'Tag' container
          Positioned(
            top: -30,
            left: -26,
            child: Container(
              width: _screenWidth * 0.224,
              height: _screenHeight * 0.061,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.Primary),
              ),
              child: const Center(
                  child: Text(
                'Tag',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: AppColors.Primary,
                    fontSize: 18),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
