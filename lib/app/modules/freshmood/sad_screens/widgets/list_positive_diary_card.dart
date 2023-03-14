import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/data/models/list_positive_diary.dart';
import 'package:remood/app/modules/freshmood/sad_screens/sad_screen_controller.dart';
import 'package:remood/app/global_widgets/card_diary.dart';

class PositiveDiaryListFreshmood extends StatelessWidget {
  const PositiveDiaryListFreshmood({super.key});

  @override
  Widget build(BuildContext context) {
    ListPositveDiary listPositiveDiary = ListPositveDiary();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    SadController readPositveDiary = Get.find();
    return ListView.separated(
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      itemCount: readPositveDiary.positiveDiaryList.length,
      itemBuilder: ((context, index) {
        return GestureDetector(
          onTap: (() {
            readPositveDiary.readDiary(context, index, "Positive diary", 0);
          }),
          child: DiaryCard(diary: readPositveDiary.positiveDiaryList[index]),
        );
      }),
      separatorBuilder: (context, index) => SizedBox(
        height: screenHeight * 0.0197,
      ),
    );
  }
}
