import 'package:flutter/material.dart';
import 'package:remood/app/core/values/text_style.dart';

class AmPm extends StatelessWidget {
  const AmPm({super.key, required this.ampm});
  final int ampm;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.transparent,
      child: Text(
        ampm == 0 ? 'AM' : "PM",
        style: CustomTextStyle.normalText(Colors.black).copyWith(fontSize: 18),
      ),
    );
  }
}
