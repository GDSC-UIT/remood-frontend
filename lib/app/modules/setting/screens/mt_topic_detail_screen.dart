import 'package:flutter/cupertino.dart';
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
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    String appBarTitle = controller.currentTopic.value.label;
    bool isCreateNewTopicScreen =
        appBarTitle == controller.createNewTopic[0].label;

    Widget? showIconDelete() {
      /// Create-new-topic screen doesn't have delete icon
      /// at the top right corner
      return !isCreateNewTopicScreen ? const Icon(Icons.delete_outline) : null;
    }

    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                StackSettingAppbar(
                  title: appBarTitle,
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.033,
                    right: screenWidth * 0.053,
                  ),
                  alignment: Alignment.topRight,
                  child: showIconDelete(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
