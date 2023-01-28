import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/data/models/setting_function.dart';

class ListTileHelpFunc extends StatelessWidget {
  const ListTileHelpFunc({
    Key? key,
    required this.helpList,
    required this.index,
  }) : super(key: key);

  final List<SettingFunc> helpList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log("Clicked help function!");
      },
      child: ListTile(
        leading: Image.asset(helpList[index].icon),
        trailing: Image.asset(Assets.arrowRight),
        title: Text(
          helpList[index].title,
          style: CustomTextStyle.onboardingText(Colors.black),
        ),
      ),
    );
  }
}
