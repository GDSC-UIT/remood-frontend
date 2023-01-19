import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:remood/app/modules/home/widgets/button_today_diary.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: _screenHeight * 0.714,
        ),
// button (today's diary)
        const ButtonDiary(),
      ],
    );
  }
}
