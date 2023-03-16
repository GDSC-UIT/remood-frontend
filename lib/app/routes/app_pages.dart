import 'package:get/get.dart';
import 'package:remood/app/modules/freshmood/happy_screens/happy_screen_binding.dart';
import 'package:remood/app/modules/freshmood/happy_screens/screens/happy_screen.dart';
import 'package:remood/app/modules/freshmood/sad_screens/sad_screen_binding.dart';
import 'package:remood/app/modules/freshmood/sad_screens/screens/choose_screen.dart';
import 'package:remood/app/modules/freshmood/sad_screens/screens/final_negative_screen.dart';
import 'package:remood/app/modules/freshmood/sad_screens/screens/read_diary.dart';
import 'package:remood/app/modules/freshmood/sad_screens/screens/sad_screen.dart';
import 'package:remood/app/modules/login_signup/login_binding.dart';
import 'package:remood/app/modules/login_signup/screens/comfirm_password.dart';
import 'package:remood/app/modules/login_signup/screens/create_new_account.dart';
import 'package:remood/app/modules/login_signup/screens/forgot_password.dart';
import 'package:remood/app/modules/login_signup/screens/login.dart';
import 'package:remood/app/modules/login_signup/screens/login_screen.dart';
import 'package:remood/app/modules/read_diary/read_diary_binding.dart';
import 'package:remood/app/modules/report/report_binding.dart';
import 'package:remood/app/modules/report/screens/report_screen.dart';
import 'package:remood/app/modules/setting/screens/change_password.dart';
import 'package:remood/app/modules/setting/screens/contact_us_screen.dart';
import 'package:remood/app/modules/setting/screens/faq_screen.dart';
import 'package:remood/app/modules/setting/screens/language_screen.dart';
import 'package:remood/app/modules/setting/screens/manage_topics_screen.dart';
import 'package:remood/app/modules/setting/screens/mt_change_color_topic_screen.dart';
import 'package:remood/app/modules/setting/screens/mt_change_icon_topic_screen.dart';
import 'package:remood/app/modules/setting/screens/mt_create_new_topic_screen.dart';
import 'package:remood/app/modules/setting/screens/mt_rename_topic_screen.dart';
import 'package:remood/app/modules/setting/screens/mt_topic_detail_screen.dart';
import 'package:remood/app/modules/setting/screens/notification_screen.dart';
import 'package:remood/app/modules/setting/screens/pinned_diaries_screen.dart';
import 'package:remood/app/modules/setting/screens/privacy_screen.dart';
import 'package:remood/app/modules/setting/screens/security_screen.dart';
import 'package:remood/app/modules/setting/screens/setting_screen.dart';
import 'package:remood/app/modules/setting/screens/start_of_the_week_screen.dart';
import 'package:remood/app/modules/setting/setting_binding.dart';
import 'package:remood/app/modules/suggestion/screens/suggestion_screen.dart';
import 'package:remood/app/modules/suggestion/suggestion_binding.dart';
import 'package:remood/app/modules/write_diary/diary_binding.dart';
import 'package:remood/app/modules/write_diary/screens/write_diary_screen.dart';
import 'package:remood/app/modules/onboarding/onboarding_binding.dart';
import 'package:remood/app/modules/onboarding/screens/onboarding_screen.dart';
import '/app/modules/home/home_binding.dart';
import '../modules/home/screens/home_screen.dart';
import '/app/routes/app_routes.dart';

abstract class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      bindings: [
        HomeBinding(),
        ReadDiaryBinding(),
        ReportBinding(),
        SettingBinding()
      ],
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
      name: AppRoutes.suggestion,
      page: () => const SuggestionScreen(),
      binding: SuggestionBinding(),
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
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingScreen(),
      bindings: [OnboardingBinding(), SettingBinding()],
    ),
    GetPage(
      name: AppRoutes.loginScreen,
      page: () => const LogInScreen(),
      bindings: [LogInBinding(), HomeBinding()],
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LogIn(),
      bindings: [LogInBinding(), HomeBinding()],
    ),
    GetPage(
      name: AppRoutes.createnewAccount,
      page: () => CreateNewAccount(),
      bindings: [LogInBinding(), HomeBinding()],
    ),
    GetPage(
      name: AppRoutes.forgotPassword,
      page: () => ForgotPassWord(),
      bindings: [LogInBinding(), HomeBinding()],
    ),
    GetPage(
      name: AppRoutes.comfirmPassword,
      page: () => ComfirmPassword(),
      bindings: [LogInBinding(), HomeBinding()],
    ),
    GetPage(
      name: AppRoutes.report,
      page: () => const ReportScreen(),
      binding: ReportBinding(),
    ),
    GetPage(
      name: AppRoutes.setting,
      page: () => const SettingScreen(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: AppRoutes.language,
      page: () => const LanguageScreen(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: AppRoutes.starOfTheWeek,
      page: () => const StartOfTheWeekScreen(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: AppRoutes.notification,
      page: () => const NotificationScreen(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: AppRoutes.privacy,
      page: () => const PrivacyScreen(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: AppRoutes.manageTopics,
      page: () => const ManageTopicsScreen(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: AppRoutes.pinnedDiaries,
      page: () => const PinnedDiariesScreen(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: AppRoutes.security,
      page: () => const SecurityScreen(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: AppRoutes.contactUs,
      page: () => const ContactUsScreen(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: AppRoutes.faq,
      page: () => const FAQScreen(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: AppRoutes.topicDetail,
      page: () => const TopicDetailScreen(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: AppRoutes.createNewTopic,
      page: () => const CreateNewTopicScreen(),
      bindings: [DiaryBinding(), SettingBinding()],
    ),
    GetPage(
      name: AppRoutes.renameTopic,
      page: () => const RenameTopicScreen(),
      bindings: [SettingBinding(), DiaryBinding()],
    ),
    GetPage(
      name: AppRoutes.changeIconTopic,
      page: () => const ChangeIconTopicScreen(),
      bindings: [SettingBinding(), DiaryBinding()],
    ),
    GetPage(
      name: AppRoutes.changeColorTopic,
      page: () => const ChangeColorTopicScreen(),
      bindings: [SettingBinding(), DiaryBinding()],
    ),
    GetPage(
        name: AppRoutes.changePassword,
        page: (() => const ChangePassword()),
        bindings: [SettingBinding(), HomeBinding()]),
  ];
}
