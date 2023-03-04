import 'package:flutter/material.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/package/classes/marked_date.dart';
import 'package:remood/app/package/classes/multiple_marked_dates.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/modules/home/home_controller.dart';
import 'package:remood/app/modules/home/widgets/button_today_diary.dart';
import 'package:remood/app/package/flutter_calendar_carousel.dart';

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
              height: _screenHeight * 0.594,
              child: CalendarCarousel(
                dayPadding: 0,
                iconColor: AppColors.daySelected,
                headerTextStyle: const TextStyle(
                    color: AppColors.daySelected,
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
                weekdayTextStyle: const TextStyle(
                    color: AppColors.weekendColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
                daysTextStyle: CustomTextStyle.dayCalendar(),
                weekendTextStyle: TextStyle(
                    color: AppColors.weekendColor, fontWeight: FontWeight.w700),
                dayButtonColor: AppColors.dayCalendarColor,
                todayButtonColor: AppColors.dayCalendarColor,
                todayBorderColor: AppColors.daySelected,
                showOnlyCurrentMonthDate: true,
                childAspectRatio: 0.75,
                daysHaveCircularBorder: true,
                showIconBehindDayText: false,
                customDayBuilder: (isSelectable,
                        index,
                        isSelectedDay,
                        isToday,
                        isPrevMonthDay,
                        textStyle,
                        isNextMonthDay,
                        isThisMonthDay,
                        day) =>
                    Column(
                  children: [
                    Text(
                      day.day.toString(),
                      style: isToday
                          ? CustomTextStyle.todayCalendar()
                          : CustomTextStyle.dayCalendar(),
                    ),
                    Container()
                  ],
                ),
              )),
        ),
        SizedBox(
          height: _screenHeight * 0.08,
        ),
// button (today's diary)
        const ButtonDiary(),
      ],
    );
  }
}
