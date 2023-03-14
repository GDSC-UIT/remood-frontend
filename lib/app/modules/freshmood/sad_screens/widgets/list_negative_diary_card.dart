import 'package:flutter/cupertino.dart';
import 'package:remood/app/modules/freshmood/sad_screens/sad_screen_controller.dart';
import 'package:remood/app/global_widgets/card_diary.dart';
import 'package:get/get.dart';

class NegativeDiaryListFreshmood extends StatelessWidget {
  const NegativeDiaryListFreshmood({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    SadController readNegativeDiary = Get.find();
    return ListView.separated(
      padding: EdgeInsets.zero,
      physics: const BouncingScrollPhysics(),
      itemCount: readNegativeDiary.negativeDiarylist.length,
      itemBuilder: ((context, index) {
        return GestureDetector(
            onTap: () {
              readNegativeDiary.readDiary(context, index, "Negative diary", 1);
            },
            child:
                DiaryCard(diary: readNegativeDiary.negativeDiarylist[index]));
      }),
      separatorBuilder: (context, index) => SizedBox(
        height: screenHeight * 0.0197,
      ),
    );
  }
}
