import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/data/models/diary.dart';
import 'package:intl/intl.dart';
import 'package:remood/app/modules/read_diary/read_diary_controller.dart';

class DiaryCard extends StatelessWidget {
  final Diary diary;
  const DiaryCard({super.key, required this.diary});

  @override
  Widget build(BuildContext context) {
    // Controller
    ReadDiaryController controller = Get.find();

    // Data
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    controller.pressPin(diary);

    return Container(
      width: screenWidth * 0.723,
      height: screenHeight * 0.167,
      decoration: BoxDecoration(
        color: Color(diary.diaryColor),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  // IconData(
                  //   diary.icon,
                  //   fontFamily: 'MaterialIcons',
                  // ),
                  Icons.abc,
                  color: Color(diary.diaryColor).withOpacity(1),
                ),
                const SizedBox(
                  width: 7,
                ),
                Text(DateFormat('dd/MM/yyyy').format(diary.date),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    )),
                const Spacer(),
                GetBuilder<ReadDiaryController>(
                  builder: (_) {
                    return GestureDetector(
                      onTap: () {
                        controller.setPinMark(diary);
                      },
                      child: controller.isPinPressed.value == false
                          ? Image.asset(Assets.pinnedDiary)
                          : Image.asset(Assets.isPinnedDiary),
                    );
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(child: SingleChildScrollView(child: Text(diary.diary))),
          ],
        ),
      ),
    );
  }
}
