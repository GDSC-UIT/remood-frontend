import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/data/models/setting_function.dart';

class ColHelpFuncs extends StatelessWidget {
  const ColHelpFuncs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var helpList = [
      SettingFunc(icon: Assets.call, title: "Contact Us"),
      SettingFunc(icon: Assets.document, title: "FAQ"),
    ];

    var settingHeading = CustomTextStyle.normalText(Colors.black);

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            log("Clicked help function!");
          },
          child: ListTile(
            leading: Image.asset(helpList[0].icon),
            trailing: Image.asset(Assets.arrowRight),
            title: Text(
              helpList[0].title,
              style: settingHeading,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            log("Clicked help function!");
          },
          child: ListTile(
            leading: Image.asset(helpList[1].icon),
            trailing: Image.asset(Assets.arrowRight),
            title: Text(
              helpList[1].title,
              style: settingHeading,
            ),
          ),
        ),
      ],
    );
  }
}
