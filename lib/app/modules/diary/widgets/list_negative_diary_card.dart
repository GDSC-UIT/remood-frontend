import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:remood/app/data/models/list_negative_diary.dart';
import 'package:remood/app/modules/diary/widgets/card_diary.dart';

class NegativeDiaryList extends StatelessWidget {
  const NegativeDiaryList({super.key});

  @override
  Widget build(BuildContext context) {
    ListNegativeDiary negativeDiaryList = ListNegativeDiary();
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return ListView.separated(
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      itemCount: negativeDiaryList.listNegativeDiary.length,
      itemBuilder: ((context, index) {
        return DiaryCard(
            positiveDiary: negativeDiaryList.listNegativeDiary[index]);
      }),
      separatorBuilder: (context, index) => SizedBox(
        height: _screenHeight * 0.0197,
      ),
    );
  }
}
