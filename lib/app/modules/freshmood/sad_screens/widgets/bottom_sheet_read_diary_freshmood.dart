import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/data/models/list_negative_diary.dart';
import 'package:remood/app/data/models/list_positive_diary.dart';
import 'package:intl/intl.dart';
import 'package:remood/app/modules/read_diary/read_diary_controller.dart';
import 'package:remood/app/modules/read_diary/widgets/list_positive_diary_card.dart';
import 'dart:io';

class SheetReadDiaryFreshmood extends StatelessWidget {
  String tag;
  int id;
  RxInt currentDiary;
  SheetReadDiaryFreshmood({
    super.key,
    required this.tag,
    required this.id,
    required this.currentDiary,
  });

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;

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
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: _screenHeight * 0.03,
              left: _screenWidth * 0.0453,
            ),
            child: Row(
              children: [
// Icon
                Icon(
                  id == 0
                      ? ListPositveDiary
                          .listPositiveDiary[currentDiary.value].icon
                      : ListNegativeDiary
                          .listNegativeDiary[currentDiary.value].icon,
                  color: id == 0
                      ? ListPositveDiary
                          .listPositiveDiary[currentDiary.value].diaryColor
                          .withOpacity(1)
                      : ListNegativeDiary
                          .listNegativeDiary[currentDiary.value].diaryColor
                          .withOpacity(1),
                  size: 30,
                ),
                const SizedBox(
                  width: 16,
                ),
// date
                Text(
                  DateFormat('dd/MM/yyyy').format(id == 0
                      ? ListPositveDiary
                          .listPositiveDiary[currentDiary.value].date
                      : ListNegativeDiary
                          .listNegativeDiary[currentDiary.value].date),
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
                SizedBox(
                  width: _screenWidth * 0.115,
                ),
// tag
                Container(
                  width: _screenWidth * 0.355,
                  height: _screenHeight * 0.046,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                        color: AppColors.grey22.withOpacity(1), width: 1),
                  ),
                  child: Center(
                      child: Text(
                    tag,
                    style: TextStyle(color: AppColors.grey22.withOpacity(1)),
                  )),
                )
              ],
            ),
          ),
// underline
          SizedBox(
            height: _screenHeight * 0.021,
          ),
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.greyscale),
              ),
            ),
          ),
// photos
          const SizedBox(
            height: 20,
          ),
          Container(
            width: _screenWidth * 0.771,
            height: _screenHeight * 0.232,
            decoration: BoxDecoration(
              color: AppColors.primary42,
              borderRadius: BorderRadius.circular(10),
            ),
            child: id == 0
                ? ListPositveDiary
                            .listPositiveDiary[currentDiary.value].image !=
                        null
                    ? Image.file(File(ListPositveDiary
                        .listPositiveDiary[currentDiary.value].image!))
                    : const Center(
                        child: Icon(
                          Icons.camera_alt,
                          color: AppColors.darkgrey,
                          size: 40,
                        ),
                      )
                : ListNegativeDiary
                            .listNegativeDiary[currentDiary.value].image !=
                        null
                    ? Image.file(File(ListNegativeDiary
                        .listNegativeDiary[currentDiary.value].image!))
                    : const Center(
                        child: Icon(
                          Icons.camera_alt,
                          color: AppColors.darkgrey,
                          size: 40,
                        ),
                      ),
          ),
// diary
          const SizedBox(
            height: 19,
          ),
          Container(
            width: _screenWidth * 0.848,
            height: _screenHeight * 0.34,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: id == 0
                  ? ListPositveDiary
                      .listPositiveDiary[currentDiary.value].diaryColor
                  : ListNegativeDiary
                      .listNegativeDiary[currentDiary.value].diaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    id == 0
                        ? ListPositveDiary
                            .listPositiveDiary[currentDiary.value].diary
                        : ListNegativeDiary
                            .listNegativeDiary[currentDiary.value].diary,
                    style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColors.textDiaryColor,
                        fontSize: 15),
                  ),
                ),
              ),
            ),
          ),

// done button
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: _screenWidth * 0.88,
            child: ElevatedButton(
              onPressed: () {
                Get.back();
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(AppColors.mainColor),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
              ),
              child: const Text('Done'),
            ),
          ),
        ],
      ),
    );
  }
}
