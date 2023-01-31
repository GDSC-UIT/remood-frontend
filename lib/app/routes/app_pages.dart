import 'package:get/get.dart';
import 'package:remood/app/modules/read_diary/screens/read_diary_screen.dart';
import 'package:remood/app/modules/report/report_binding.dart';
import 'package:remood/app/modules/report/report_controller.dart';
import 'package:remood/app/modules/report/screens/report_screen.dart';
import 'package:remood/app/modules/setting/setting_binding.dart';
import 'package:remood/app/modules/write_diary/diary_binding.dart';
import 'package:remood/app/modules/write_diary/screens/write_diary_screen.dart';
import 'package:remood/app/modules/onboarding/onboarding_binding.dart';
import 'package:remood/app/modules/onboarding/screens/onboarding_screen.dart';
import '/app/modules/home/home_binding.dart';
import '/app/modules/home/screens/home_screen.dart';
import '/app/routes/app_routes.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      bindings: [HomeBinding(), ReportBinding(), SettingBinding()],
    ),
    GetPage(
      name: AppRoutes.writediary,
      page: () => WriteDiaryScreen(),
      binding: DiaryBinding(),
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingScreen(),
      bindings: [OnboardingBinding(), SettingBinding()],
    ),
    GetPage(
      name: AppRoutes.report,
      page: () => const ReportScreen(),
      binding: ReportBinding(),
    ),
  ];
}
