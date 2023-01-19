import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:remood/app/data/models/list_negative_diary.dart';
import 'package:remood/app/modules/diary/diary_controller.dart';
import 'package:remood/app/modules/diary/widgets/card_diary.dart';
import 'package:get/get.dart';

class NegativeDiaryList extends StatelessWidget {
  NegativeDiaryList({super.key});

  @override
  Widget build(BuildContext context) {
    ListNegativeDiary negativeDiaryList = ListNegativeDiary();
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    DiaryController readNegativeDiary = Get.find();
    return ListView.separated(
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      itemCount: negativeDiaryList.listNegativeDiary.length,
      itemBuilder: ((context, index) {
        return GestureDetector(
            onTap: () {
              // readNegativeDiary.readDiary(context, "Negative diary");
            },
            child:
                DiaryCard(diary: negativeDiaryList.listNegativeDiary[index]));
      }),
      separatorBuilder: (context, index) => SizedBox(
        height: _screenHeight * 0.0197,
      ),
    );
  }
}
