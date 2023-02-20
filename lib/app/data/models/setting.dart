import 'package:hive/hive.dart';
part 'setting.g.dart';

@HiveType(typeId: 3)
class Setting {
  // The first day of the week is Sunday or not
  @HiveField(0)
  bool isSundayFirstDayOfWeek;

  // System language
  @HiveField(1)
  int language;

  // Notification function is turn on or not
  @HiveField(2)
  bool isOnNotification;

  // PIN lock is turned on or not
  @HiveField(3)
  bool isOnPINLock;

  Setting({
    required this.isSundayFirstDayOfWeek,
    required this.language,
    required this.isOnNotification,
    required this.isOnPINLock,
  });
}
