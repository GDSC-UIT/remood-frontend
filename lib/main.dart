import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:remood/app/modules/setting/setting_binding.dart';
import 'package:remood/app/data/models/diary.dart';
import 'package:remood/app/data/models/topic.dart';
import '/app/core/values/app_strings.dart';
import '/app/data/services/localization_service.dart';
import '/app/routes/app_pages.dart';
import '/app/routes/app_routes.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive
    ..registerAdapter(DiaryAdapter())
    ..registerAdapter(CardTopicAdapter());
  await Hive.openBox<List>('mybox');
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
      initialRoute: AppRoutes.home,
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      defaultTransition: Transition.cupertino,
    );
  }
}
