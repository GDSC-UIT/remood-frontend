
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/modules/setting/setting_controller.dart';
import 'package:remood/app/modules/setting/widgets/stack_setting_appbar.dart';

class TopicDetailScreen extends StatelessWidget {
  const TopicDetailScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final SettingController controller = Get.find();
    String appBarTitle = controller.currentTopic.value.label;

    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      body: SafeArea(
        child: Column(
          children: [
            StackSettingAppbar(
              title: appBarTitle.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
