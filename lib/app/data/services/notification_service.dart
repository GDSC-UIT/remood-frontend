import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:permission_handler/permission_handler.dart';
// ignore: depend_on_referenced_packages
import 'package:timezone/data/latest.dart' as tz;
// ignore: depend_on_referenced_packages
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  /// Initialize notification
  initializeNotification() async {
    _configureLocalTimeZone();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings("ic_launcher");

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  // ignore: unused_element
  /// Set right date and time for notifications
  tz.TZDateTime convertTime(int hour, int minutes) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduleDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minutes,
    );
    if (scheduleDate.isBefore(now)) {
      scheduleDate = scheduleDate.add(const Duration(days: 1));
    }
    return scheduleDate;
  }

  Future<void> _configureLocalTimeZone() async {
    tz.initializeTimeZones();
    final String timeZone = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZone));
  }

  /// Schedule a daily notification at selected time
  static Future<void> scheduleDailyAtTimeNotification(
    BuildContext context,
    TimeOfDay time,
  ) async {
    final Time scheduledTime = Time(time.hour, time.minute, 0);

    AndroidNotificationDetails androidPlatformChannelSpecifics =
        const AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      'your_channel_description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      // sound: RawResourceAndroidNotificationSound('notification_sound.mp3'), // Notification sound
      // icon: 'icon_notification_replace', // Notification icon
      playSound: true,
      onlyAlertOnce: true,
      enableVibration: true,
    );
    NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    debugPrint(DateTime.now().toString());
    debugPrint(time.toString());
    debugPrint("${scheduledTime.hour} ${scheduledTime.minute}");

    // ignore: deprecated_member_use
    await flutterLocalNotificationsPlugin.showDailyAtTime(
      0,
      'Scheduled Notification',
      'This notification was scheduled at ${time.format(context)}',
      scheduledTime,
      platformChannelSpecifics,
      payload: "New payload",
    );
  }

  /// Select the time to send notification
  static Future<void> selectTime(BuildContext context, TimeOfDay time) async {
    // ignore: use_build_context_synchronously
    await scheduleDailyAtTimeNotification(context, time);
  }
}
