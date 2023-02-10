import 'package:flutter/material.dart';
import 'package:remood/app/core/values/text_style.dart';

class Hours extends StatelessWidget {
  const Hours({super.key, required this.hours});
  final int hours;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Center(
          child: Text(
        hours < 10 ? "0$hours" : "$hours",
        style: CustomTextStyle.normalText(Colors.black).copyWith(fontSize: 18),
      )),
    );
  }
}
