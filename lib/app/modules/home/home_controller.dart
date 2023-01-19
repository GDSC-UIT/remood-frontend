import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt current = 0.obs;
  final Rx<ValueNotifier<int>> currentScreen = ValueNotifier(0).obs;
  void changeBottomScreen(index) {
    current.value = index;
    currentScreen.value.value = index;
  }

  RxBool ispressed = false.obs;
  void onPressedButton() {
    ispressed.value = !ispressed.value;
  }
}
