import 'package:get/get.dart';
import 'sad_screen_controller.dart';

class SadBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SadController>(() => SadController());
  }
}
