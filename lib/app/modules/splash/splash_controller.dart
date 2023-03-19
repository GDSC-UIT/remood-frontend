import 'package:get/get.dart';
import 'package:is_first_run/is_first_run.dart';

class SplashController extends GetxController {
  Future<bool> isFirstOnboard() async {
    bool isFirstCall = await IsFirstRun.isFirstRun();
    return isFirstCall;
  }
}
