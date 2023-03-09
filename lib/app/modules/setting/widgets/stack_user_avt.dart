import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/data/models/user_box.dart';
import 'package:remood/app/data/services/media_query_service.dart';
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
    var pctWidth = MediaQueryService.pctWidth(context);
    var pctHeight = MediaQueryService.pctHeight(context);
    var avatarURLs = controller.avatars;
    var user = controller.user;

    return Stack(
      children: [
        // User avatar
        Center(
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: Obx(
              () => Image.asset(user.value.avtURL),
            ),
          ),
        ),

        // Edit button
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
                          onTap: () {
                            controller.editAvatar(index);
                            log("${UserBox.user.name} ${UserBox.user.avtURL}");
                          },
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
      ],
    );
  }
}
