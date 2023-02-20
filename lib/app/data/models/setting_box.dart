import 'package:hive/hive.dart';
import 'package:remood/app/data/models/setting.dart';

class SettingBox {
  static Setting setting = Setting(
    isSundayFirstDayOfWeek: false,
    language: 0,
    isOnNotification: false,
    isOnPINLock: false,
  );

  final _mybox = Hive.box<Setting>('setting');
  void createInitialData() {
    setting = Setting(
      isSundayFirstDayOfWeek: false,
      language: 0,
      isOnNotification: false,
      isOnPINLock: false,
    );
  }

  void loadData() {
    setting = _mybox.get("setting")!;
  }

  void updateDatabase() {
    _mybox.put("setting", setting);
  }
}
