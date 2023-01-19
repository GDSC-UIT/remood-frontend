import 'package:get/get.dart';
import 'package:remood/app/modules/write_diary/diary_controller.dart';

import 'home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
