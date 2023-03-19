import 'package:get/get.dart';

class SuggestionController extends GetxController {
  RxInt isPressedTitle = (-1).obs;
  RxBool isPressed = true.obs;
  RxString topic = ''.obs;
  void pressTitle(index, String topic) {
    if (isPressedTitle.value == index) {
      isPressed.value = false;
      isPressedTitle.value = -1;
    } else {
      isPressed.value = true;
      isPressedTitle.value = index;
      this.topic.value = topic;
    }
  }
}
