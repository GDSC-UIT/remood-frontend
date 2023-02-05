import 'package:get/get.dart';

class DiaryController extends GetxController {
  //
  RxInt current = 0.obs;
  void changeColortag(index) {
    current.value = index;
  }
}
