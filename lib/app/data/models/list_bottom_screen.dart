import 'package:flutter/cupertino.dart';
import 'package:remood/app/modules/home/screens/calendar_screen.dart';
import 'package:remood/app/modules/read_diary/screens/read_diary_screen.dart';
import 'package:remood/app/modules/report/screens/report_screen.dart';
import 'package:remood/app/modules/setting/screens/setting_screen.dart';

class Screens {
  List<Widget> ListScreens = [
    const CalendarScreen(),
    const ReadDiaryScreen(),
    const ReportScreen(),
    const SettingScreen(),
  ];
}
