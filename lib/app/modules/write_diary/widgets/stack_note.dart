import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/modules/write_diary/diary_controller.dart';

class StackNote extends StatelessWidget {
  const StackNote({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    DiaryController noteController = Get.find();
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: screenWidth * 0.731,
          height: screenHeight * 0.236,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.primary)),
// contain text field
          child: Center(
            child: Container(
              height: screenHeight * 0.167,
              width: screenWidth * 0.621,
              decoration: BoxDecoration(
                  color: AppColors.primary42,
                  borderRadius: BorderRadius.circular(10)),
              // text field
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: noteController.diaryNote,
                  decoration:
                      const InputDecoration.collapsed(hintText: 'Add note'),
                  style: const TextStyle(fontSize: 10),
                  expands: true,
                  maxLines: null,
                ),
              ),
            ),
          ),
        ),
        // Container(
        //   width: _screenWidth * 0.731,
        //   height: _screenHeight * 0.236,
        //   color: Colors.red,
        // ),
// 'Note' container
        Positioned(
          top: -30,
          left: -26,
          child: Container(
            width: screenWidth * 0.224,
            height: screenHeight * 0.061,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.primary),
            ),
            child: const Center(
                child: Text(
              'Note',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                  fontSize: 18),
            )),
          ),
        ),
      ],
    );
  }
}
