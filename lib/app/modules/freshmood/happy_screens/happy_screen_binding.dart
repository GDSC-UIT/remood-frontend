import 'package:get/get.dart';
import 'happy_screen_controller.dart';

class HappyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HappyController>(() => HappyController());
  }
}
