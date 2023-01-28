import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/data/models/setting_function.dart';

class ListTileSettingFunc extends StatelessWidget {
  const ListTileSettingFunc({
    Key? key,
    required this.settingList,
    required this.index,
  }) : super(key: key);

  final List<SettingFunc> settingList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        log("Clicked setting function!");
      },
      child: ListTile(
        leading: Image.asset(settingList[index].icon),
        trailing: Image.asset(Assets.arrowRight),
        title: Text(
          settingList[index].title,
          style: CustomTextStyle.onboardingText(Colors.black),
        ),
      ),
    );
  }
}
