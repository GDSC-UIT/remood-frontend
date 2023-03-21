import 'package:get/get.dart';
import 'package:remood/app/modules/home/widgets/container_freshmood.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  RxString token = "".obs;
  updateToken({@required token}) {
    this.token = token;
  }

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
      Overlay.of(context)?.insert(floatingcontainer);
    }
    ispressed.value = !ispressed.value;
  }

  RxInt valueSlider = 50.obs;
  void onChangeSlider(value) {
    valueSlider.value = value;
  }

  Rx<DateTime> currentdate = DateTime.now().obs;
  void changedate(DateTime date) {
    currentdate.value = date;
  }
}
