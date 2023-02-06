import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/modules/setting/setting_controller.dart';

class ColButtonList extends StatelessWidget {
  const ColButtonList({
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
            log(settingList[index].label);
            if (settingList[index].screen != null) {
              Get.toNamed(settingList[index].screen);
            }
          },
          child: ListTile(
            leading: Container(
              padding: const EdgeInsets.all(10.0),
              width: 42,
              height: 42,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.settingIconBg,
              ),
              child: Image.asset(
                settingList[index].icon,
              ),
            ),
            trailing: Image.asset(Assets.arrowRight),
            title: Text(
              settingList[index].label,
              style: settingLabelStyle,
            ),
          ),
        ),
      ),
    );
  }
}
