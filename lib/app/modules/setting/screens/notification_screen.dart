import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/modules/setting/setting_controller.dart';
import 'package:remood/app/modules/setting/widgets/stack_setting_appbar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingController());
    int hour = 21;
    int minute = 30;

    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      body: SafeArea(
        child: Column(
          children: [
            const StackSettingAppbar(title: "Notification"),
            const SizedBox(height: 20),

            // Turn on/off the reminder
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Reminder ON/OFF',
                    style: CustomTextStyle.reportHeading()
                        .copyWith(color: Colors.black, fontSize: 16),
                  ),
                  Obx(() => CupertinoSwitch(
                        activeColor: AppColors.mainColor,
                        value: controller.selected.value,
                        onChanged: (_) {
                          controller.switchOnChange();
                        },
                      )),
                ],
              ),
            ),
            const SizedBox(height: 13.0),

            // Clock
            Padding(
              padding: const EdgeInsets.only(right: 14.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      log("Show dialog");
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            title: Text("This is a dialog"),
                            actions: [],
                          );
                        },
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 36,
                      width: 75,
                      decoration: BoxDecoration(
                        color: AppColors.settingNotificationClockBg,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        "$hour : $minute",
                        style: CustomTextStyle.normalText(AppColors.mainColor)
                            .copyWith(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}