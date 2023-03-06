import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:remood/app/data/models/diary.dart';
import 'package:remood/app/data/models/setting.dart';
import 'package:remood/app/data/models/topic.dart';
import 'package:remood/app/data/models/user.dart';
import 'package:remood/app/modules/setting/setting_binding.dart';

import '/app/core/values/app_strings.dart';
import '/app/data/services/localization_service.dart';
import '/app/routes/app_pages.dart';
import '/app/routes/app_routes.dart';

// Setup local notification
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin(); // instance of flutterLocalNotificationsPlugin
const AndroidInitializationSettings androidInitializationSettings =
    AndroidInitializationSettings('@mipmap/ic_launcher'); // for android
InitializationSettings initializationSettings = const InitializationSettings(
  android: androidInitializationSettings,
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive
    ..registerAdapter(DiaryAdapter())
    ..registerAdapter(CardTopicAdapter())
    ..registerAdapter(UserAdapter())
    ..registerAdapter(SettingAdapter());
  Future.wait([
    Hive.openBox<List>('mybox'),
    Hive.openBox<User>('user'),
    Hive.openBox<Setting>('setting'),
  ]);

  // Setup local notification
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: SettingBinding(),
      title: AppStrings.appName,
      initialRoute: AppRoutes.splash,
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      defaultTransition: Transition.cupertino,
    );
  }
}
