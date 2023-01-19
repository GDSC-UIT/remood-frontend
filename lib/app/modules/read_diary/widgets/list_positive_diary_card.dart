import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:remood/app/data/models/list_positive_diary.dart';
import 'package:remood/app/modules/write_diary/diary_controller.dart';
import 'package:remood/app/modules/read_diary/widgets/card_diary.dart';

class PositiveDiaryList extends StatelessWidget {
  PositiveDiaryList({super.key});

  @override
  Widget build(BuildContext context) {
    ListPositveDiary positveDiaryList = ListPositveDiary();
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    DiaryController readPositveDiary = Get.find();
    return ListView.separated(
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      itemCount: positveDiaryList.listPositiveDiary.length,
      itemBuilder: ((context, index) {
        return GestureDetector(
          onTap: (() {
            // readPositveDiary.readDiary(context, "Positive");
          }),
          child: DiaryCard(diary: positveDiaryList.listPositiveDiary[index]),
        );
      }),
      separatorBuilder: (context, index) => SizedBox(
        height: _screenHeight * 0.0197,
      ),
    );
  }
}
