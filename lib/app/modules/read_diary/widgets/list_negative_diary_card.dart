import 'package:flutter/material.dart';
import 'package:remood/app/modules/read_diary/read_diary_controller.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:remood/app/global_widgets/card_diary.dart';
import 'package:get/get.dart';

class NegativeDiaryList extends StatelessWidget {
  const NegativeDiaryList({super.key});

  @override
  Widget build(BuildContext context) {
    // double _screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    ReadDiaryController readNegativeDiary = Get.find();
    return Obx(
      () => ListView.separated(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        itemCount: readNegativeDiary.negativeDiaryList.length,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: () {
              readNegativeDiary.readDiary(context, index, "Negative diary", 1);
            },
            child: Slidable(
              endActionPane:
                  ActionPane(motion: const ScrollMotion(), children: [
                SlidableAction(
                  onPressed: ((context) {
                    readNegativeDiary.deletePinnedDiary(
                        index, readNegativeDiary.positiveDiaryList[index]);
                    readNegativeDiary.deleteNegativeDiary(index);
                  }),
                  icon: Icons.delete,
                ),
              ]),
              child:
                  DiaryCard(diary: readNegativeDiary.negativeDiaryList[index]),
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
