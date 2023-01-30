import 'package:flutter/material.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/modules/setting/widgets/container_monday.dart';
import 'package:remood/app/modules/setting/widgets/container_sunday.dart';
import 'package:remood/app/modules/setting/widgets/stack_setting_appbar.dart';

class StartOfTheWeekScreen extends StatelessWidget {
  const StartOfTheWeekScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      body: SafeArea(
        child: Column(
          children: const [
            StackSettingAppbar(title: "Start of the week"),
            SizedBox(height: 30.0),
            // Sunday is the first day
            ContainerFirstDaySunday(),
            SizedBox(height: 37.0),
            // Monday is the first day
            ContainerFirstDayMonday(),
          ],
        ),
      ),
    );
  }
}
