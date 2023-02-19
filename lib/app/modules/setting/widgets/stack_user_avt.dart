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
    var pctWidth = controller.pctWidth(context);
    var pctHeight = controller.pctHeight(context);
    var avatarURL = controller.avatar;
    var avatarURLs = controller.avatars;

    return Stack(children: [
      // User avatar
      Center(
        child: Obx(
          () => Image.asset(avatarURL.value),
        ),
      ),

      // Edit button
      // TODO: ----Doing---- Edit-avt function
      // Update the way of measuring width and height
      // Update size of avatars
      Align(
        alignment: Alignment.topRight,
        child: GestureDetector(
          onTap: () {
            log("Changed avt.");
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Choose an avatar"),
                actionsAlignment: MainAxisAlignment.start,
                actions: [
                  Wrap(
                    alignment: WrapAlignment.start,
                    children: List.generate(
                      avatarURLs.length,
                      (index) => GestureDetector(
                        onTap: () => controller.editAvatar(avatarURLs[index]),
                        child: Container(
                          padding: const EdgeInsets.all(5.0),
                          width: 56 * pctWidth,
                          height: 56 * pctHeight,
                          child: Image.asset(avatarURLs[index]),
                        ),
                      ),
                    ),
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
