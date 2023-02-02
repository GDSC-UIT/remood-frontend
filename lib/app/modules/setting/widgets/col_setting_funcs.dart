import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/modules/setting/setting_controller.dart';

class ColSettingFuncs extends StatelessWidget {
  const ColSettingFuncs({
    Key? key,
    required this.list,
  }) : super(key: key);
  final List list;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SettingController>();
    List settingList = list;
    TextStyle settingLabelStyle = controller.settingLabelStyle;

    return Column(
      children: List.generate(
        settingList.length,
        (index) => GestureDetector(
          onTap: () {
            log(settingList[index].title);
            Get.to(settingList[index].screen);
          },
          child: ListTile(
            leading: Image.asset(settingList[index].icon),
            trailing: Image.asset(Assets.arrowRight),
            title: Text(
              settingList[index].title,
              style: settingLabelStyle,
            ),
          ),
        ),
      ),
    );
  }
}
