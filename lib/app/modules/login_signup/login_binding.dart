import 'package:get/get.dart';
import 'package:remood/app/modules/login_signup/login_controller.dart';

class LogInBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LogInController>(() => LogInController());
  }
}
