import 'package:flutter/cupertino.dart';
import 'package:remood/app/core/values/text_style.dart';

class TodayMotivation extends StatelessWidget {
  Color color;
  TodayMotivation({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth * 0.55,
      height: screenHeight * 0.064,
      decoration: BoxDecoration(
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          "today’s motivation",
          style: CustomTextStyle.todayMotivationText(color),
        ),
      ),
    );
  }
}
