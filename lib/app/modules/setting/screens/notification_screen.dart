import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/data/services/notification_service.dart';
import 'package:remood/app/global_widgets/time_picker.dart';
import 'package:remood/app/modules/setting/setting_controller.dart';
import 'package:remood/app/modules/setting/widgets/confirm_button.dart';
import 'package:remood/app/modules/setting/widgets/stack_setting_appbar.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller
    final controller = Get.put(SettingController());

    // Data
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    var saveNotification = controller.saveNotification;
    var saveTime = controller.saveTimeSetting;

    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      body: SafeArea(
        child: Column(
          children: [
            const StackSettingAppbar(title: "Notification"),
            const SizedBox(height: 20),

            // Turn on/off the reminder with a switch
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
                  Obx(
                    () => CupertinoSwitch(
                      activeColor: AppColors.mainColor,
                      value: controller.actived.value,
                      onChanged: (_) async {
                        /// Nếu switch đang tắt,
                        /// đã có quyền (isGranted = true) thì có thể turn on/off
                        /// chưa có quyền (isDenied = true) thì askPermissionThen()
                        /// nếu được cấp quyền thì cập nhật db,
                        /// không thì không làm gì hết
                        ///
                        /// Nếu đang bật, thì có thể turn on/off lun
                        if (controller.actived.value) {
                          controller.switchOnChange();
                        } else {
                          var status = await Permission.notification.status;
                          if (status.isDenied) {
                            // ignore: use_build_context_synchronously
                            await NotificationService.askPermissionThen(
                                context);
                          } else if (status.isGranted) {
                            controller.switchOnChange();
                          }
                        }
                      },
                    ),
                  ),
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
                      // hour from 1 to 12 and controller index from 0 to 11
                      controller.hourController = FixedExtentScrollController(
                          initialItem: controller.hour.value - 1);
                      controller.minuteController = FixedExtentScrollController(
                          initialItem: controller.minute.value);
                      controller.ampmController = FixedExtentScrollController(
                          initialItem: controller.ampm.value);
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            actions: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const TimePicker(),
                                    const SizedBox(height: 12),
                                    GestureDetector(
                                      onTap: () {
                                        log("Set up alarm");
                                        saveTime();

                                        Get.back();
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 44,
                                        width: 246,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: AppColors.mainColor),
                                        child: Text(
                                          "Done",
                                          style:
                                              CustomTextStyle.h2(Colors.white)
                                                  .copyWith(fontSize: 16),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
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
                      child: Obx(
                        () => Text(
                          "${controller.getHour} : ${controller.getMin}",
                          style: CustomTextStyle.normalText(AppColors.mainColor)
                              .copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ConfirmButton(
              label: "Save",
              func: saveNotification,
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
