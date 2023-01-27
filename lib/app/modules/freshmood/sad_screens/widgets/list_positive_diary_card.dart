import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:remood/app/data/models/list_positive_diary.dart';
import 'package:remood/app/modules/freshmood/sad_screens/sad_screen_controller.dart';
import 'package:remood/app/modules/home/home_controller.dart';
import 'package:remood/app/modules/read_diary/read_diary_controller.dart';
import 'package:remood/app/global_widgets/card_diary.dart';

class PositiveDiaryListFreshmood extends StatelessWidget {
  PositiveDiaryListFreshmood({super.key});

  @override
  Widget build(BuildContext context) {
    ListPositveDiary listPositiveDiary = ListPositveDiary();
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    SadController readPositveDiary = Get.find();
    return ListView.separated(
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      itemCount: ListPositveDiary.listPositiveDiary.length,
      itemBuilder: ((context, index) {
        return GestureDetector(
          onTap: (() {
            readPositveDiary.readDiary(context, index, "Positive diary", 0);
          }),
          child: DiaryCard(diary: ListPositveDiary.listPositiveDiary[index]),
        );
      }),
      separatorBuilder: (context, index) => SizedBox(
        height: _screenHeight * 0.0197,
      ),
    );
  }
}
