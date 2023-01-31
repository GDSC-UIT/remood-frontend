import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/global_widgets/switch_button.dart';
import 'package:remood/app/modules/setting/setting_controller.dart';
import 'package:remood/app/modules/setting/widgets/fittedbox_password_dots.dart';
import 'package:remood/app/modules/setting/widgets/stack_setting_appbar.dart';
import 'package:passcode_screen/passcode_screen.dart';

class PINLock extends StatelessWidget {
  const PINLock({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SettingController>();

    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      body: SafeArea(
          child: Column(
        children: [
          Stack(
            children: [
              // Appbar
              const StackSettingAppbar(title: "PIN lock"),

              // Switch button
              Container(
                padding: const EdgeInsets.only(top: 21.5, right: 14.0),
                alignment: Alignment.topRight,
                child: const SwitchButton(),
              ),
            ],
          ),
          // Title
          Text(
            "Enter your PIN",
            style: CustomTextStyle.normalText(Colors.black),
          ),

          // Password (4 characters)
          const FittedboxPasswordDots(),

          // Numeric keyboard
          // PasscodeScreen(
          //   title: const Text("PIN lock"),
          //   passwordEnteredCallback: (text) {},
          //   cancelButton: const Icon(CupertinoIcons.xmark),
          //   deleteButton: const Icon(CupertinoIcons.delete_left),
          //   shouldTriggerVerification: stream,
          // )
        ],
      )),
    );
  }
}
