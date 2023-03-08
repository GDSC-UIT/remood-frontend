import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/modules/setting/setting_controller.dart';
import 'package:remood/app/modules/setting/widgets/col_button_list.dart';
import 'package:remood/app/modules/setting/widgets/stack_user_avt.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller
    final SettingController settingController = Get.find();

    // Data
    var user = settingController.user;
    // var setting = settingController.setting;
    var username = settingController.nickname;
    var isEditableName = settingController.isEditableName;

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
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
// Page name
                    Text(
                      "Settings Page",
                      style: CustomTextStyle.h2(AppColors.settingPageName)
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
                    isEditableName.value
                        ? Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 100.0),
                            child: TextField(
                              controller: settingController.nameController,
                              autofocus: true,
                              decoration: InputDecoration(
                                focusColor: AppColors.mainColor,
                                hintText: "Enter a nickname",
                                hintStyle: CustomTextStyle.normalText(
                                  const Color(0xFF777777),
                                ),
                              ),
                              onSubmitted: (value) {
                                settingController.editNickName();
                              },
                            ),
                          )
                        : Text(
                            user.value.name,
                            style: CustomTextStyle.customh2(
                                AppColors.settingUserName, 20.0),
                          ),

                    // Change nickname button
                    !isEditableName.value
                        ? GestureDetector(
                            onTap: () {
                              log("Changed nickname!");
                              settingController.editNickName();
                            },
                            child: Text(
                              "Change nickname",
                              style:
                                  CustomTextStyle.h2(AppColors.settingUserName)
                                      .copyWith(
                                          fontSize: 7,
                                          decoration: TextDecoration.underline),
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),

// Setting Functions
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                children: [
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Settings",
                    style: CustomTextStyle.h2(Colors.black),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ColButtonList(list: settingController.settingList),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    "Help",
                    style: CustomTextStyle.h2(Colors.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ColButtonList(list: settingController.helpList),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
