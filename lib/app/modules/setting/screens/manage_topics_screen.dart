import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/modules/setting/setting_controller.dart';
import 'package:remood/app/modules/setting/widgets/col_button_list.dart';
import 'package:remood/app/modules/setting/widgets/col_topic_list.dart';
import 'package:remood/app/modules/setting/widgets/stack_setting_appbar.dart';

class ManageTopicsScreen extends StatelessWidget {
  const ManageTopicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingController controller = Get.find();
    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      body: SafeArea(
        child: Column(
          children: [
            const StackSettingAppbar(title: "Manage topics"),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView(
                  children: [
                    ColTopicList(list: controller.topicList),
                    // Create-new-topic button
                    ColTopicList(list: controller.createNewTopic),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
