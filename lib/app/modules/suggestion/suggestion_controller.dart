import 'package:get/get.dart';

class SuggestionController extends GetxController {
  RxInt isPressedTitle = (-1).obs;
  void pressTitle(index) {
    isPressedTitle.value = index;
  }
}
