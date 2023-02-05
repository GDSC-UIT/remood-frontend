import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/marked_date.dart';
import 'package:flutter_calendar_carousel/classes/multiple_marked_dates.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/modules/home/home_controller.dart';
import 'package:remood/app/modules/home/widgets/button_today_diary.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    HomeController calendarController = Get.find();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 60),
          child: Container(
              width: _screenWidth * 0.87,
              height: _screenHeight * 0.53,
              child: Obx(
                () => CalendarCarousel(
                  iconColor: AppColors.mainColor,
                  headerTextStyle: const TextStyle(
                      color: AppColors.mainColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                  weekdayTextStyle: const TextStyle(
                      color: AppColors.weekendColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                  daysTextStyle: TextStyle(
                      color: AppColors.weekendColor,
                      fontWeight: FontWeight.w700),
                  weekendTextStyle: TextStyle(
                      color: AppColors.weekendColor,
                      fontWeight: FontWeight.w700),
                  todayButtonColor: AppColors.mainColor,
                  todayBorderColor: AppColors.mainColor,
                  onDayPressed: ((p0, p1) => calendarController.changedate(p0)),
                  selectedDateTime: calendarController.currentdate.value,
                  selectedDayBorderColor: AppColors.mainColor,
                  selectedDayButtonColor: AppColors.mainColor,
                ),
              )),
        ),
        SizedBox(
          height: _screenHeight * 0.11,
        ),
// button (today's diary)
        const ButtonDiary(),
      ],
    );
  }
}
