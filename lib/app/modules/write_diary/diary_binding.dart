import 'package:get/get.dart';

import 'diary_controller.dart';

class DiaryBinding implements Bindings {
  @override
  void dependencies() async {
    Get.lazyPut<DiaryController>(() => DiaryController());
  }
}
