import 'package:flutter/material.dart';
import 'package:remood/app/core/values/text_style.dart';

class Minutes extends StatelessWidget {
  const Minutes({super.key, required this.mins});
  final int mins;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Center(
          child: Text(
        mins < 10 ? "0$mins" : "$mins",
        style: CustomTextStyle.normalText(Colors.black).copyWith(fontSize: 18),
      )),
    );
  }
}
