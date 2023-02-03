import 'package:flutter/material.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/modules/setting/widgets/stack_setting_appbar.dart';

class CreateNewTopicScreen extends StatelessWidget {
  const CreateNewTopicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String appBarTitle = "Create new topic";
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
