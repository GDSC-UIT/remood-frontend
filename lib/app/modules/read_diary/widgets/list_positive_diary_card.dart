import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/modules/home/home_controller.dart';
import 'package:remood/app/modules/read_diary/widgets/card_diary.dart';

class PositiveDiaryList extends StatelessWidget {
  PositiveDiaryList({super.key});

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    HomeController readPositveDiary = Get.find();
    return ListView.separated(
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      itemCount:
          readPositveDiary.listPositiveDiary.value.listPositiveDiary.length,
      itemBuilder: ((context, index) {
        return GestureDetector(
          onTap: (() {
            readPositveDiary.readDiary(context, index, "Positive diary", 0);
          }),
          child: DiaryCard(
              diary: readPositveDiary
                  .listPositiveDiary.value.listPositiveDiary[index]),
        );
      }),
      separatorBuilder: (context, index) => SizedBox(
        height: _screenHeight * 0.0197,
      ),
    );
  }
}
