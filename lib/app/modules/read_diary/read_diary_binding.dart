import 'package:get/get.dart';
import 'read_diary_controller.dart';

class ReadDiaryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReadDiaryController>(() => ReadDiaryController());
  }
}
