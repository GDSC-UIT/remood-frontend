import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/data/models/list_negative_diary.dart';
import 'package:remood/app/data/models/list_positive_diary.dart';
import 'package:intl/intl.dart';
import 'package:remood/app/modules/read_diary/read_diary_controller.dart';
import 'package:remood/app/modules/read_diary/widgets/list_positive_diary_card.dart';
import 'dart:io';

class SheetReadDiary extends StatelessWidget {
  String tag;
  int id;
  SheetReadDiary({
    super.key,
    required this.tag,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    ReadDiaryController readDiaryController = Get.find();
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
                  IconData(
                    id == 0
                        ? readDiaryController
                            .positiveDiaryList[
                                readDiaryController.currentDiary.value]
                            .icon
                        : readDiaryController
                            .negativeDiaryList[
                                readDiaryController.currentDiary.value]
                            .icon,
                    fontFamily: 'MaterialIcons',
                  ),
                  color: id == 0
                      ? Color(readDiaryController
                              .positiveDiaryList[
                                  readDiaryController.currentDiary.value]
                              .diaryColor)
                          .withOpacity(1)
                      : Color(readDiaryController
                              .negativeDiaryList[
                                  readDiaryController.currentDiary.value]
                              .diaryColor)
                          .withOpacity(1),
                  size: 30,
                ),
                const SizedBox(
                  width: 16,
                ),
                // date
                Text(
                  DateFormat('dd/MM/yyyy').format(id == 0
                      ? readDiaryController
                          .positiveDiaryList[
                              readDiaryController.currentDiary.value]
                          .date
                      : readDiaryController
                          .negativeDiaryList[
                              readDiaryController.currentDiary.value]
                          .date),
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 20),
                ),
                const SizedBox(
                  width: 20,
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
                ),
                const SizedBox(
                  width: 5,
                ),
                // edit
                IconButton(
                    onPressed: () {
                      id == 0
                          ? readDiaryController.editPositiveDiary()
                          : readDiaryController.editNegativeDiary();
                    },
                    icon: Icon(
                      Icons.edit,
                      color: id == 0
                          ? Color(readDiaryController
                                  .positiveDiaryList[
                                      readDiaryController.currentDiary.value]
                                  .diaryColor)
                              .withOpacity(1)
                          : Color(readDiaryController
                                  .negativeDiaryList[
                                      readDiaryController.currentDiary.value]
                                  .diaryColor)
                              .withOpacity(1),
                      size: 30,
                    ))
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
// image
          Container(
            width: _screenWidth * 0.771,
            height: _screenHeight * 0.232,
            decoration: BoxDecoration(
              color: AppColors.primary42,
              borderRadius: BorderRadius.circular(10),
            ),
            child: id == 0
                ? readDiaryController
                            .positiveDiaryList[
                                readDiaryController.currentDiary.value]
                            .image !=
                        null
                    ? Image.file(File(readDiaryController
                        .positiveDiaryList[
                            readDiaryController.currentDiary.value]
                        .image!))
                    : const Center(
                        child: Icon(
                          Icons.camera_alt,
                          color: AppColors.darkgrey,
                          size: 40,
                        ),
                      )
                : readDiaryController
                            .negativeDiaryList[
                                readDiaryController.currentDiary.value]
                            .image !=
                        null
                    ? Image.file(File(readDiaryController
                        .negativeDiaryList[
                            readDiaryController.currentDiary.value]
                        .image!))
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
                  ? Color(readDiaryController
                      .positiveDiaryList[readDiaryController.currentDiary.value]
                      .diaryColor)
                  : Color(readDiaryController
                      .negativeDiaryList[readDiaryController.currentDiary.value]
                      .diaryColor),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Obx(
                () => Expanded(
                  child: readDiaryController.isPressed.value == true
                      ? TextField(
                          controller: readDiaryController.editingController,
                          decoration: InputDecoration.collapsed(hintText: ''),
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
          ),

          // done button
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: _screenWidth * 0.88,
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
