import 'package:flutter/material.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/modules/setting/widgets/container_monday.dart';
import 'package:remood/app/modules/setting/widgets/container_sunday.dart';
import 'package:remood/app/modules/setting/widgets/stack_setting_appbar.dart';

class StartOfTheWeek extends StatelessWidget {
  const StartOfTheWeek({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      body: SafeArea(
        child: Container(
          color: AppColors.backgroundPage,
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
      ),
    );
  }
}

class ContainerInactivedButton extends StatelessWidget {
  const ContainerInactivedButton({
    Key? key,
    required this.active,
    required this.label,
  }) : super(key: key);
  final Function active;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => active,
      child: Container(
        alignment: Alignment.center,
        width: 268,
        height: 46,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.0,
            color: AppColors.mainColor,
          ),
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.transparent,
        ),
        child: Text(
          label,
          style: CustomTextStyle.timeNumber(AppColors.mainColor),
        ),
      ),
    );
  }
}
