import 'package:flutter/material.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/data/models/setting_button.dart';
import 'package:remood/app/modules/setting/widgets/stack_setting_appbar.dart';

class ChangeIconTopicScreen extends StatelessWidget {
  const ChangeIconTopicScreen({super.key, required this.topic});
  final SettingButton topic;

  @override
  Widget build(BuildContext context) {
    String appBarTitle = "Change icon";
    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      body: SafeArea(
        child: Column(
          children: [
            StackSettingAppbar(
              title: appBarTitle,
            ),
          ],
        ),
      ),
    );
  }
}
