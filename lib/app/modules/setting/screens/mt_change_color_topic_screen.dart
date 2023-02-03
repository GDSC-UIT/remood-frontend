import 'package:flutter/material.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/data/models/setting_button.dart';
import 'package:remood/app/modules/setting/widgets/stack_setting_appbar.dart';

class ChangeColorTopicScreen extends StatelessWidget {
  const ChangeColorTopicScreen({super.key, required this.topic});
  final SettingButton topic;

  @override
  Widget build(BuildContext context) {
    String appBarTitle = "Change color";
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
