import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:remood/app/data/models/list_negative_diary.dart';
import 'package:remood/app/modules/freshmood/sad_screens/sad_screen_controller.dart';
import 'package:remood/app/modules/home/home_controller.dart';
import 'package:remood/app/modules/read_diary/read_diary_controller.dart';

import 'package:remood/app/modules/write_diary/diary_controller.dart';
import 'package:remood/app/global_widgets/card_diary.dart';
import 'package:get/get.dart';

class NegativeDiaryListFreshmood extends StatelessWidget {
  NegativeDiaryListFreshmood({super.key});

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    SadController readNegativeDiary = Get.find();
    return ListView.separated(
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      itemCount: ListNegativeDiary.listNegativeDiary.length,
      itemBuilder: ((context, index) {
        return GestureDetector(
            onTap: () {
              readNegativeDiary.readDiary(context, index, "Negative diary", 1);
            },
            child:
                DiaryCard(diary: ListNegativeDiary.listNegativeDiary[index]));
      }),
      separatorBuilder: (context, index) => SizedBox(
        height: _screenHeight * 0.0197,
      ),
    );
  }
}
