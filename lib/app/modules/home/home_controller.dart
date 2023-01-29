import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:remood/app/data/models/diary.dart';
import 'package:remood/app/data/models/list_negative_diary.dart';
import 'package:remood/app/data/models/list_positive_diary.dart';
import 'package:remood/app/modules/home/widgets/container_freshmood.dart';
import 'package:remood/app/modules/freshmood/sad_screens/widgets/bottom_sheet_read_diary_freshmood.dart';
import 'package:flutter/material.dart';
import 'package:remood/app/modules/read_diary/widgets/bottom_sheet_search_diary.dart';

class HomeController extends GetxController {
  RxInt current = 0.obs;
  final Rx<ValueNotifier<int>> currentScreen = ValueNotifier(0).obs;
  void changeBottomScreen(index) {
    current.value = index;
    currentScreen.value.value = index;
  }

  RxBool ispressed = false.obs;
  OverlayEntry floatingcontainer = OverlayEntry(
      opaque: false,
      maintainState: true,
      builder: ((context) {
        return const FreshmoodPercent();
      }));
  void onPressedButton(BuildContext context) {
    if (ispressed.value) {
      floatingcontainer.remove();
    } else {
      Overlay.of(context)!.insert(floatingcontainer);
    }
    ispressed.value = !ispressed.value;
  }

  RxDouble valueSlider = 50.0.obs;
  void onChangeSlider(value) {
    valueSlider.value = value;
  }
}
