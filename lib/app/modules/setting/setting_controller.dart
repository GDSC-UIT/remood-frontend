import 'dart:developer';

import 'package:get/get.dart';

class SettingController extends GetxController {
  // First day of the weel
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
}
