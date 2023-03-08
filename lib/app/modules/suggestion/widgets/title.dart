import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:remood/app/core/values/text_style.dart';

class TitleContainer extends StatelessWidget {
  String text;
  TitleContainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: _screenWidth * 0.363,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(34)),
      child: Center(
          child: Text(
        text,
        style: CustomTextStyle.suggestionTitle(),
      )),
    );
  }
}
