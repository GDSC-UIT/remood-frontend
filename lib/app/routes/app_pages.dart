import 'package:get/get.dart';
import 'package:remood/app/modules/freshmood/happy_screens/happy_screen_binding.dart';
import 'package:remood/app/modules/freshmood/happy_screens/screens/happy_screen.dart';
import 'package:remood/app/modules/freshmood/sad_screens/sad_screen_binding.dart';
import 'package:remood/app/modules/freshmood/sad_screens/screens/choose_screen.dart';
import 'package:remood/app/modules/freshmood/sad_screens/screens/final_negative_screen.dart';
import 'package:remood/app/modules/freshmood/sad_screens/screens/read_diary.dart';
import 'package:remood/app/modules/freshmood/sad_screens/screens/sad_screen.dart';
import 'package:remood/app/modules/read_diary/read_diary_binding.dart';
import 'package:remood/app/modules/write_diary/diary_binding.dart';
import 'package:remood/app/modules/write_diary/screens/write_diary_screen.dart';
import '/app/modules/home/home_binding.dart';
import '../modules/home/screens/home_screen.dart';
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
      name: AppRoutes.happyfreshmood,
      page: () => const HappyScreen(),
      bindings: [HappyBinding(), HomeBinding()],
    ),
    GetPage(
      name: AppRoutes.sadfreshmood,
      page: () => const SadScreen(),
      bindings: [SadBinding(), HomeBinding()],
    ),
    GetPage(
        name: AppRoutes.choosefreshmood,
        page: () => const ChooseScreen(),
        binding: SadBinding()),
    GetPage(
        name: AppRoutes.readDiaryFreshmood,
        page: (() => ReadDiaryFreshmood()),
        binding: SadBinding()),
    GetPage(
      name: AppRoutes.finalNegativeScreen,
      page: () => FinalNegativeScreen(),
      binding: SadBinding(),
    ),
  ];
}
