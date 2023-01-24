import 'package:get/get.dart';
import 'package:remood/app/modules/freshmood/freshmood_binding.dart';
import 'package:remood/app/modules/freshmood/screens/freshmood_screen.dart';
import 'package:remood/app/modules/read_diary/read_diary_binding.dart';
import 'package:remood/app/modules/write_diary/diary_binding.dart';
import 'package:remood/app/modules/write_diary/screens/write_diary_screen.dart';
import '/app/modules/home/home_binding.dart';
import '/app/modules/home/screens/home_screen.dart';
import '/app/routes/app_routes.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
      bindings: [HomeBinding(), ReadDiaryBinding()],
    ),
    GetPage(
      name: AppRoutes.writediary,
      page: () => WriteDiaryScreen(),
      binding: DiaryBinding(),
    ),
    GetPage(
      name: AppRoutes.freshmood,
      page: () => const FreshmoodScreen(),
      binding: FreshmoodBinding(),
    ),
  ];
}
