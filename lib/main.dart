import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:remood/app/data/models/diary.dart';
import 'package:remood/app/data/models/topic.dart';
import 'package:remood/app/data/services/notification_service.dart';
import 'package:remood/app/modules/setting/setting_binding.dart';
import 'package:flutter/services.dart';
import '/app/core/values/app_strings.dart';
import '/app/data/services/localization_service.dart';
import '/app/routes/app_pages.dart';
import '/app/routes/app_routes.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive
    ..registerAdapter(DiaryAdapter())
    ..registerAdapter(CardTopicAdapter());
  //..registerAdapter(reportPointAdapter());
  await Hive.openBox('mybox');

  /// Initialize local notification plugin
  NotificationService().initNotification();

  /// Initialize date formating
  initializeDateFormatting();

  /// Initialize timezone
  NotificationService.configureLocalTimeZone();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Force the layout to stick to portrait
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
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
