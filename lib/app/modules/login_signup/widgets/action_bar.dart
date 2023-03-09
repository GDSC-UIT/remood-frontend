import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/modules/setting/setting_controller.dart';

class LoginBar extends StatelessWidget {
  const LoginBar({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingController settingController = Get.find();

    var pctWidth = settingController.pctWidth(context);
    var pctHeight = settingController.pctHeight(context);

    return Container(
      color: Colors.transparent,
      child: Stack(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Image.asset(Assets.arrowBack))
            ],
          ),
          // Logo
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SizedBox(
                  width: 103 * pctWidth,
                  height: 38 * pctHeight,
                  child: Image.asset(Assets.logoText),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
