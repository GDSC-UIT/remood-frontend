import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/data/models/setting_box.dart';
import 'package:remood/app/modules/setting/setting_controller.dart';
import 'package:remood/app/routes/app_routes.dart';

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
          onTap: () {
            log(settingList[index].label);

            // Tránh lỗi khi chưa có screen
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
              }

              Get.toNamed(settingList[index].screen);
            }
          },
          child: ListTile(
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
            trailing: Image.asset(Assets.arrowRight),
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
