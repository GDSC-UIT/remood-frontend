import 'package:get/get.dart';
import 'freshmood_controller.dart';

class FreshmoodBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FreshmoodController>(() => FreshmoodController());
  }
}
