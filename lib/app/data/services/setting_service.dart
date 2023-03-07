import 'package:get/get.dart';
import 'package:remood/app/data/models/setting.dart';

class SettingService extends GetxController {
  static Rx<Setting> setting = Setting(
    isSundayFirstDayOfWeek: false,
    isOnNotification: false,
    hour: 0,
    minute: 0,
    ampm: 0,
    isOnPINLock: false,
    language: 0,
  ).obs;
}
