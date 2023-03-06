import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:remood/app/core/values/text_style.dart';

class TodayMotivation extends StatelessWidget {
  Color color;
  TodayMotivation({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: _screenWidth * 0.55,
      height: _screenHeight * 0.064,
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
