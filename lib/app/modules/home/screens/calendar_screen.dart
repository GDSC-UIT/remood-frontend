import 'package:flutter/material.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/modules/home/home_controller.dart';
import 'package:remood/app/modules/home/widgets/button_today_diary.dart';
import 'package:remood/app/package/flutter_calendar_carousel.dart';
import 'package:remood/app/modules/setting/setting_controller.dart';

import 'package:remood/app/data/services/setting_service.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    // TODO: ----Stuck---- Load start of the week automatically

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 60),
          child: SizedBox(
              width: screenWidth * 0.87,
              height: screenHeight * 0.594,
              child: CalendarCarousel(
                firstDayOfWeek:
                    SettingService.setting.value.isSundayFirstDayOfWeek ? 0 : 1,
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
                weekendTextStyle: const TextStyle(
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
          height: screenHeight * 0.08,
        ),
// button (today's diary)
        const ButtonDiary(),
      ],
    );
  }
}
