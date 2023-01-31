import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:remood/app/modules/setting/setting_binding.dart';
import '/app/core/values/app_strings.dart';
import '/app/data/services/localization_service.dart';
import '/app/routes/app_pages.dart';
import '/app/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      initialRoute: AppRoutes.onboarding,
      locale: LocalizationService.locale,
      fallbackLocale: LocalizationService.fallbackLocale,
      translations: LocalizationService(),
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      defaultTransition: Transition.cupertino,
    );
  }
}
