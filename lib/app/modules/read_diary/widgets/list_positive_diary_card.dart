import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/modules/read_diary/read_diary_controller.dart';
import 'package:remood/app/global_widgets/card_diary.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class PositiveDiaryList extends StatelessWidget {
  const PositiveDiaryList({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    ReadDiaryController readPositveDiary = Get.find();
    return Obx(
      () => ListView.separated(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        itemCount: readPositveDiary.positiveDiaryList.length,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: (() {
              readPositveDiary.readDiary(context, index, "Positive diary",
                  readPositveDiary.positiveDiaryList[index], 0);
            }),
            child: Slidable(
              endActionPane:
                  ActionPane(motion: const ScrollMotion(), children: [
                SlidableAction(
                  onPressed: (context) {
                    readPositveDiary.deletePinnedDiary(
                        index, readPositveDiary.positiveDiaryList[index]);
                    readPositveDiary.deletePositiveDiary(index);
                  },
                  icon: Icons.delete,
                ),
              ]),
              child: DiaryCard(
                diary: readPositveDiary.positiveDiaryList[index],
              ),
            ),
          );
        }),
        separatorBuilder: (context, index) => SizedBox(
          height: screenHeight * 0.0197,
        ),
      ),
    );
  }
}
