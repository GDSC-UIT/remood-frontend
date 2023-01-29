import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/data/models/language.dart';

class SettingController extends GetxController {
  // First day of the week
  RxBool isSunday = true.obs;

  bool get getIsSunday => isSunday.value;
  bool get getIsMonday => !isSunday.value;

  void onTapSunday() {
    isSunday(true);
    log('Sunday is the first day.');
  }

  void onTapMonday() {
    isSunday(false);
    log('Monday is the first day');
  }

  // Language
  var styleActivedLan = CustomTextStyle.reportHeading()
      .copyWith(color: Colors.black, fontSize: 16);
  var styleInactivedLan =
      CustomTextStyle.onboardingText(Colors.black).copyWith(fontSize: 16);

  void activeLanguage(List<Language> lanList, int index) {
    for (var lan in lanList) {
      lan.actived = false;
    }

    lanList[index].actived = true;
  }
}
