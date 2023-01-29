import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/data/models/language.dart';
import 'package:remood/app/modules/setting/setting_controller.dart';

class ListTileLaguage extends StatelessWidget {
  const ListTileLaguage({
    Key? key,
    required this.lanList,
    required this.index,
    required this.styleLan,
  }) : super(key: key);

  final List<Language> lanList;
  final int index;
  final TextStyle styleLan;

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SettingController>();

    // TODO: Làm single choice
    return GestureDetector(
      onTap: () {
        log('Tap');
        controller.activeLanguage(lanList, index);
      },
      child: ListTile(
        title: Text(
          lanList[index].label,
          style: styleLan,
        ),
        trailing: Checkbox(
          activeColor: AppColors.mainColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          value: lanList[index].actived,
          onChanged: (_) {},
        ),
      ),
    );
  }
}
