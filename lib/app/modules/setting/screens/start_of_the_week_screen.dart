import 'package:flutter/material.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/modules/setting/widgets/confirm_button.dart';
import 'package:remood/app/modules/setting/widgets/container_monday.dart';
import 'package:remood/app/modules/setting/widgets/container_sunday.dart';
import 'package:remood/app/modules/setting/widgets/stack_setting_appbar.dart';

class StartOfTheWeekScreen extends StatelessWidget {
  const StartOfTheWeekScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      body: SafeArea(
        child: Column(
          children: [
            const StackSettingAppbar(title: "Start of the week"),
            const SizedBox(height: 30.0),

            // Sunday is the first day
            const ContainerFirstDaySunday(),
            const SizedBox(height: 37.0),

            // Monday is the first day
            const ContainerFirstDayMonday(),

            // Save button
            const ConfirmButton(label: "Save"),
            SizedBox(
              height: screenHeight * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
