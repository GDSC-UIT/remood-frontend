import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/data/models/setting_function.dart';
import 'package:remood/app/modules/setting/widgets/listtile_help_func.dart';
import 'package:remood/app/modules/setting/widgets/listtile_setting_func.dart';
import 'package:remood/app/modules/setting/widgets/stack_user_avt.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String username = "cute pie";
    var settingList = [
      SettingFunc(icon: Assets.calendar, title: "Start of the week"),
      SettingFunc(icon: Assets.language, title: "Language"),
      SettingFunc(icon: Assets.notification, title: "Notification"),
      SettingFunc(icon: Assets.dangerCircle, title: "Privacy"),
      SettingFunc(icon: Assets.category, title: "Manage topics"),
      SettingFunc(icon: Assets.password, title: "Security"),
    ];
    var helpList = [
      SettingFunc(icon: Assets.call, title: "Contact Us"),
      SettingFunc(icon: Assets.document, title: "FAQ"),
    ];

    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      body: SafeArea(
        right: false,
        left: false,
        child: Column(
          children: [
            // User info
            Container(
              height: 167,
              width: 375,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.0),
                  color: AppColors.settingUserBg),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Page name
                  Text(
                    "Settings Page",
                    style: CustomTextStyle.mainStyle(AppColors.settingPageName)
                        .copyWith(fontSize: 15),
                  ),
                  const SizedBox(height: 10.0),

                  // User avatar
                  Container(
                    width: 77.26,
                    height: 72.86,
                    decoration: BoxDecoration(
                      color: AppColors.settingUserAvtBg,
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: const UserAvatar(),
                  ),

                  // User name
                  Text(
                    username,
                    style: CustomTextStyle.customMainStyle(
                        AppColors.settingUserName, 20.0),
                  ),

                  // Change nickname button
                  GestureDetector(
                    onTap: () {
                      log("Changed nickname!");
                    },
                    child: Text(
                      "Change nickname",
                      style:
                          CustomTextStyle.mainStyle(AppColors.settingUserName)
                              .copyWith(
                                  fontSize: 7,
                                  decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Settings",
                      style: CustomTextStyle.mainStyle(Colors.black),
                    ),
                    Expanded(
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 6,
                        itemBuilder: (_, index) {
                          return ListTileSettingFunc(
                              settingList: settingList, index: index);
                        },
                      ),
                    ),
                    Text(
                      "Help",
                      style: CustomTextStyle.mainStyle(Colors.black),
                    ),
                    SizedBox(
                      height: 135,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: helpList.length,
                        itemBuilder: (_, index) {
                          return ListTileHelpFunc(
                              helpList: helpList, index: index);
                        },
                      ),
                    ),
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
