import 'package:get/get.dart';
import 'package:remood/app/modules/diary/diary_binding.dart';
import 'package:remood/app/modules/diary/screens/write_diary_screen.dart';
import '/app/modules/home/home_binding.dart';
import '/app/modules/home/screens/home_screen.dart';
import '/app/routes/app_routes.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.writediary,
      page: () => const writeDiaryScreen(),
      binding: DiaryBinding(),
    )
  ];
}
