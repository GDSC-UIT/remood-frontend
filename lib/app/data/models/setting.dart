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

  // Hour to push notification
  @HiveField(3)
  int hour;

  // Minute to push notification
  @HiveField(4)
  int minute;

  // Am/pm to push notification
  @HiveField(5)
  int ampm;

  // PIN lock is turned on or not
  @HiveField(6)
  bool isOnPINLock;

  Setting({
    required this.isSundayFirstDayOfWeek,
    required this.language,
    required this.isOnNotification,
    required this.hour,
    required this.minute,
    required this.ampm,
    required this.isOnPINLock,
  });
}
