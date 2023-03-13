import 'package:flutter/material.dart';
import 'package:remood/app/modules/read_diary/read_diary_controller.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:remood/app/global_widgets/card_diary.dart';
import 'package:get/get.dart';

class NegativeDiaryList extends StatelessWidget {
  NegativeDiaryList({super.key});

  @override
  Widget build(BuildContext context) {
    // double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
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
              child:
                  DiaryCard(diary: readNegativeDiary.negativeDiaryList[index]),
              endActionPane: ActionPane(motion: ScrollMotion(), children: [
                SlidableAction(
                  onPressed: ((context) =>
                      readNegativeDiary.deleteNegativeDiary(index)),
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
