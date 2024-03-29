import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/utils/utils.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/data/models/setting_box.dart';
import 'package:remood/app/modules/setting/setting_controller.dart';
import 'package:remood/app/routes/app_routes.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ColButtonList extends StatelessWidget {
  const ColButtonList({
    Key? key,
    required this.list,
  }) : super(key: key);
  final List list;

  @override
  Widget build(BuildContext context) {
    // Controller
    final controller = Get.find<SettingController>();

    // Data
    List settingList = list;
    TextStyle settingLabelStyle = controller.settingLabelStyle;

    return Column(
      children: List.generate(
        settingList.length,
        (index) => GestureDetector(
          onTap: () async {
            log(settingList[index].label);

            // Có screen thì chuyển đến screen đó
            if (settingList[index].screen != null) {
              // LOAD LASTEST DATA

              // Language
              if (settingList[index].screen == AppRoutes.language) {
                controller.activeLanguage(SettingBox.setting.language);
              }

              // Notification
              if (settingList[index].screen == AppRoutes.notification) {
                controller.actived(SettingBox.setting.isOnNotification);
                controller.hour(SettingBox.setting.hour);
                controller.minute(SettingBox.setting.minute);
                controller.ampm(SettingBox.setting.ampm);
                log("setting");
                log(SettingBox.setting.hour.toString());
                log(SettingBox.setting.minute.toString());
                log(SettingBox.setting.ampm.toString());
              }

              // Feedback
              if (settingList[index].screen == AppRoutes.feedback) {
                // Check for internet
                Utils.isInternetConnected(
                    await InternetConnectionChecker().hasConnection);
              }

              Get.toNamed(settingList[index].screen);
            }
          },
          child: ListTile(
            // Setting option icon
            leading: Container(
              padding: const EdgeInsets.all(10.0),
              width: 42,
              height: 42,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.settingIconBg,
              ),
              child: Image.asset(
                settingList[index].icon,
              ),
            ),

            // Right arrow icon
            trailing: SizedBox(
              width: 25,
              height: 25,
              child: Image.asset(Assets.arrowRight),
            ),

            // Setting option title
            title: Text(
              settingList[index].label,
              style: settingLabelStyle,
            ),
          ),
        ),
      ),
    );
  }
}
