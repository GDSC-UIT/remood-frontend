import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/modules/setting/screens/security_pin_lock_screen.dart';
import 'package:remood/app/modules/setting/setting_controller.dart';
import 'package:remood/app/modules/setting/widgets/stack_setting_appbar.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SettingController>();
    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      body: SafeArea(
        child: Column(
          children: [
            const StackSettingAppbar(title: "Security"),
            const SizedBox(
              height: 25.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GestureDetector(
                onTap: () {
                  log("PIN lock");
                  Get.to(const PINLock());
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
                    child: Image.asset(Assets.password),
                  ),
                  trailing: Image.asset(Assets.arrowRight),
                  title: Text(
                    'PIN lock',
                    style: CustomTextStyle.normalText(Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
