import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/modules/home/home_controller.dart';
import 'package:remood/app/modules/read_diary/read_diary_controller.dart';
import 'package:remood/app/global_widgets/card_diary.dart';
import 'package:remood/app/modules/write_diary/diary_controller.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class PositiveDiaryList extends StatelessWidget {
  PositiveDiaryList({super.key});

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    ReadDiaryController readPositveDiary = Get.find();
    return Obx(
      () => ListView.separated(
        padding: EdgeInsets.zero,
        physics: const BouncingScrollPhysics(),
        itemCount: readPositveDiary.positiveDiaryList.length,
        itemBuilder: ((context, index) {
          return GestureDetector(
            onTap: (() {
              readPositveDiary.readDiary(context, index, "Positive diary", 0);
            }),
            child: Slidable(
              child: DiaryCard(
                diary: readPositveDiary.positiveDiaryList[index],
              ),
              endActionPane: ActionPane(motion: ScrollMotion(), children: [
                SlidableAction(
                  onPressed: (context) =>
                      readPositveDiary.deletePositiveDiary(index),
                  icon: Icons.delete,
                ),
              ]),
            ),
          );
        }),
        separatorBuilder: (context, index) => SizedBox(
          height: _screenHeight * 0.0197,
        ),
      ),
    );
  }
}
