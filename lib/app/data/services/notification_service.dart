import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:remood/app/data/models/setting_box.dart';
// ignore: depend_on_referenced_packages
import 'package:timezone/data/latest.dart' as tz;
// ignore: depend_on_referenced_packages
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  /// Initialize notification
  Future<void> initNotification() async {
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin(); // instance of flutterLocalNotificationsPlugin

    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings('ic_launcher'); // for android

    InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) async {},
    );
  }

  /// Initialize timezone
  static Future<void> configureLocalTimeZone() async {
    tz.initializeTimeZones();
    final String timeZone = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZone));
  }

  /// Show status (on/off) of scheduled notification
  static bool actived = SettingBox.setting.isOnNotification;

  /// Set right date and time for notifications
  tz.TZDateTime convertTime(TimeOfDay time) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduleDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );
    if (scheduleDate.isBefore(now)) {
      scheduleDate = scheduleDate.add(const Duration(days: 1));
    }
    return scheduleDate;
  }

  /// Detail of the notification
  notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'your_channel_id',
        'your_channel_name',
        channelDescription: 'your_channel_description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
        // sound: RawResourceAndroidNotificationSound('notification_sound.mp3'), // Notification sound
        playSound: true,
        onlyAlertOnce: true,
        enableVibration: true,
      ),
    );
  }

  /// Schedule a daily notification at selected time
  Future<void> scheduleDailyAtTimeNotification(
    TimeOfDay time,
  ) async {
    debugPrint('------DateTime.now(): ${DateTime.now().toString()}');
    debugPrint('------Scheduled time: ${time.toString()}');
    debugPrint('------Timezone: ${tz.local}');

    actived
        ? await flutterLocalNotificationsPlugin.zonedSchedule(
            0,
            "It's time to check-in!",
            'Please take a few minutes to prioritize your Mental Health with us',
            convertTime(time),
            await notificationDetails(),
            androidAllowWhileIdle: true,
            uiLocalNotificationDateInterpretation:
                UILocalNotificationDateInterpretation.absoluteTime,
            matchDateTimeComponents: DateTimeComponents.time,
          )
        : null;
  }

  Future<void> cancelAllNotfication() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
