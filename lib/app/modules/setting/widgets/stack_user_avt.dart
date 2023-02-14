import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/modules/setting/setting_controller.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Controller
    final SettingController controller = Get.find();

    // Data
    var avatarURL = controller.avatar;

    return Stack(children: [
      // User avatar
      Center(
        child: Obx(
          () => Image.asset(avatarURL.value),
        ),
      ),

      // Edit button
      // TODO: Edit-avt function
      Align(
        alignment: Alignment.topRight,
        child: GestureDetector(
          onTap: () {
            log("Changed avt.");
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Choose a avatar"),
                actions: [
                  Wrap(
                    children: [
                      GestureDetector(
                        onTap: () =>
                            controller.editAvatar(Assets.settingUserAvt1),
                        child: Image.asset(Assets.settingUserAvt1),
                      ),
                      GestureDetector(
                        onTap: () =>
                            controller.editAvatar(Assets.settingUserAvt2),
                        child: Image.asset(Assets.settingUserAvt2),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
          child: Container(
            width: 20.83,
            height: 19.65,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: Colors.white,
            ),
            child: Image.asset(Assets.edit),
          ),
        ),
      ),
    ]);
  }
}
