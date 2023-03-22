import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/data/models/diary.dart';
import 'package:intl/intl.dart';
import 'package:remood/app/modules/read_diary/read_diary_controller.dart';
import 'dart:io';

class SheetReadDiary extends StatelessWidget {
  int id;
  String tag;
  Diary diary;
  SheetReadDiary({
    super.key,
    required this.tag,
    required this.diary,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    ReadDiaryController readDiaryController = Get.find();
    return Container(
      height: screenHeight * 0.82,
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
              top: screenHeight * 0.03,
              left: screenWidth * 0.0453,
            ),
            child: Row(
              children: [
                // Icon
                Icon(
                  IconData(
                    diary.icon,
                    fontFamily: 'MaterialIcons',
                  ),
                  color: Color(diary.diaryColor).withOpacity(1),
                  size: 30,
                ),
                const SizedBox(
                  width: 16,
                ),
                // date
                Text(
                  DateFormat('dd/MM/yyyy').format(diary.date),
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 20),
                ),
                const SizedBox(
                  width: 15,
                ),
                // tag
                Container(
                  width: screenWidth * 0.355,
                  height: screenHeight * 0.046,
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
                ),
                const SizedBox(
                  width: 0,
                ),
                // edit
                IconButton(
                    onPressed: () {
                      readDiaryController.editDiary(diary);
                    },
                    icon: Icon(
                      Icons.edit,
                      color: Color(diary.diaryColor).withOpacity(1),
                      size: 30,
                    ))
              ],
            ),
          ),
          // underline
          SizedBox(
            height: screenHeight * 0.021,
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
// image
          Container(
              width: screenWidth * 0.771,
              height: screenHeight * 0.232,
              decoration: BoxDecoration(
                color: AppColors.primary42,
                borderRadius: BorderRadius.circular(10),
              ),
              child: diary.image != null
                  ? Image.file(File(diary.image!))
                  : const Center(
                      child: Icon(
                        Icons.camera_alt,
                        color: AppColors.darkgrey,
                        size: 40,
                      ),
                    )),
          // diary
          const SizedBox(
            height: 19,
          ),
          Container(
            width: screenWidth * 0.848,
            height: screenHeight * 0.34,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Color(diary.diaryColor),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Obx(
                () => readDiaryController.isPressed.value == true
                    ? TextField(
                        controller: readDiaryController.editingController,
                        decoration:
                            const InputDecoration.collapsed(hintText: ''),
                        expands: true,
                        maxLines: null,
                      )
                    : SingleChildScrollView(
                        child: Text(
                          id == 0
                              ? readDiaryController
                                  .positiveDiaryList[
                                      readDiaryController.currentDiary.value]
                                  .diary
                              : readDiaryController
                                  .negativeDiaryList[
                                      readDiaryController.currentDiary.value]
                                  .diary,
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
            width: screenWidth * 0.88,
            child: ElevatedButton(
              onPressed: () {
                id == 0
                    ? readDiaryController.donePositivePress()
                    : readDiaryController.doneNegativePress();
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
