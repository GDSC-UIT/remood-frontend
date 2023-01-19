import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:remood/app/data/models/list_positive_diary.dart';
import 'package:remood/app/modules/diary/widgets/card_diary.dart';

class PositiveDiaryList extends StatelessWidget {
  const PositiveDiaryList({super.key});

  @override
  Widget build(BuildContext context) {
    ListPositveDiary positveDiaryList = ListPositveDiary();
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return ListView.separated(
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      itemCount: positveDiaryList.listPositiveDiary.length,
      itemBuilder: ((context, index) {
        return DiaryCard(
            positiveDiary: positveDiaryList.listPositiveDiary[index]);
      }),
      separatorBuilder: (context, index) => SizedBox(
        height: _screenHeight * 0.0197,
      ),
    );
  }
}
