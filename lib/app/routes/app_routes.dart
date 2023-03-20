abstract class AppRoutes {
  static const home = '/home';
  static const auth = '/auth';
  static const splash = '/splash';
  static const onboarding = '/onboarding';
  static const scheduleNotification = '$onboarding/settingtime';
  static const writediary = '/home/writediary';
  static const happyfreshmood = '/home/happyfreshmood';
  static const suggestion = '/home/suggestion';
  static const sadfreshmood = '/home/sadfreshmood';
  static const choosefreshmood = '/home/sadfreshmood/choose';
  static const readDiaryFreshmood =
      '/home/sadfreshmood/choose/readDiaryFreshmood';
  static const finalNegativeScreen =
      '/home/sadfreshmood/choose/readDiaryFreshmood/finalNegativeScreen';
  static const report = '/home/report';
  static const setting = '/home/setting';
  static const starOfTheWeek = '$setting/startOfTheWeek';
  static const language = '$setting/language';
  static const notification = '$setting/notification';
  static const privacy = '$setting/privacy';
  static const manageTopics = '$setting/manageTopics';
  static const pinnedDiaries = '$setting/pinnedDiaries';
  static const security = '$setting/security';
  static const changePassword = '$security/changepassword';
  static const contactUs = '$setting/contactUs';
  static const faq = '$setting/faq';
  static const feedback = '$setting/feedback';
  static const topicDetail = '$manageTopics/topicDetail';
  static const renameTopic = '$topicDetail/renameTopic';
  static const changeIconTopic = '$topicDetail/changeIconTopic';
  static const changeColorTopic = '$topicDetail/changeColorTopic';
  static const createNewTopic = '$manageTopics/createNewTopic';
}
