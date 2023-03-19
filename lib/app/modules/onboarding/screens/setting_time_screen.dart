import 'package:flutter/material.dart';
import 'package:remood/app/core/values/app_colors.dart';

import 'package:remood/app/global_widgets/time_picker.dart';
import 'package:remood/app/modules/onboarding/widgets/action_bar_schedule.dart';
import 'package:remood/app/modules/onboarding/widgets/intro_button_schedule.dart';
import 'package:remood/app/modules/onboarding/widgets/time_title.dart';

class SettingTimeScreen extends StatelessWidget {
  const SettingTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// Data
    var boxDecoration = BoxDecoration(
      boxShadow: const [
        BoxShadow(
          spreadRadius: 1,
          blurRadius: 10.0,
          color: Color(0xfff2f2f2),
        ),
      ],
      borderRadius: BorderRadius.circular(10.0),
      color: Colors.white,
    );

    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  // Onboarding content
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Time Setting Title
                      const TimeTitle(),
                      const SizedBox(height: 26.0),

                      // Time picker
                      Container(
                        decoration: boxDecoration,
                        padding: const EdgeInsets.all(5.0),
                        height: 139.0,
                        width: 254.0,
                        child: const TimePicker(),
                      ),
                      const SizedBox(height: 18.0),
                    ],
                  ),
                  // Action bar
                  const ActionBarSchedule(),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      //Onboarding button
                      OnboardingButtonSchedule(),
                      SizedBox(height: 20.0)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
