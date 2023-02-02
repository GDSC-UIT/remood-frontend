import 'package:remood/app/data/models/language.dart';
import 'package:remood/app/modules/freshmood/sad_screens/screens/final_negative_screen.dart';

abstract class AppRoutes {
  static const home = '/home';
  static const auth = '/auth';
  static const splash = '/splash';
  static const onboarding = '/onboarding';
  static const writediary = '/home/writediary';
  static const happyfreshmood = '/home/happyfreshmood';
  static const sadfreshmood = '/home/sadfreshmood';
  static const choosefreshmood = '/home/sadfreshmood/choose';
  static const readDiaryFreshmood =
      '/home/sadfreshmood/choose/readDiaryFreshmood';
  static const finalNegativeScreen =
      '/home/sadfreshmood/choose/readDiaryFreshmood/finalNegativeScreen';
  static const report = '/home/report';
  static const setting = '/home/setting';
  static const starOfTheWeek = '/home/setting/startOfTheWeek';
  static const language = '/home/setting/language';
  static const notification = '/home/setting/notification';
  static const privacy = '/home/setting/privacy';
  static const manageTopics = '/home/setting/manageTopics';
  static const pinnedDiaries = '/home/setting/pinnedDiaries';
  static const security = '/home/setting/security';
  static const contactUs = '/home/setting/contactUs';
  static const faq = '/home/setting/faq';
}
