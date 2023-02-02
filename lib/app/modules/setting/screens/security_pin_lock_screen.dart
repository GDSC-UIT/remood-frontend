import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/global_widgets/switch_button.dart';
import 'package:remood/app/modules/setting/setting_controller.dart';
import 'package:remood/app/modules/setting/widgets/fittedbox_password_dots.dart';
import 'package:remood/app/modules/setting/widgets/stack_setting_appbar.dart';

class PINLock extends StatelessWidget {
  const PINLock({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SettingController>();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    var numpadData = [];

    Widget numpadGrid() {
      return Container(
        alignment: Alignment.center,
        width: screenWidth * 0.8,
        child: Wrap(
          runAlignment: WrapAlignment.center,
          spacing: 29,
          runSpacing: 48,
          children: [
            Container(
              width: 66,
              height: 66,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50.0)),
            ),
            Container(
              width: 66,
              height: 66,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50.0)),
            ),
            Container(
              width: 66,
              height: 66,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50.0)),
            ),
            Container(
              width: 66,
              height: 66,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50.0)),
            ),
            Container(
              width: 66,
              height: 66,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50.0)),
            ),
            Container(
              width: 66,
              height: 66,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50.0)),
            ),
            Container(
              width: 66,
              height: 66,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50.0)),
            ),
            Container(
              width: 66,
              height: 66,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50.0)),
            ),
            Container(
              width: 66,
              height: 66,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50.0)),
            ),
            Container(
              width: 66,
              height: 66,
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(50.0)),
            ),
            Container(
              width: 66,
              height: 66,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50.0)),
            ),
            Container(
              width: 66,
              height: 66,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: const Icon(CupertinoIcons.delete_left),
            ),
          ],
        ),
      );
    }

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
            const SizedBox(
              height: 17,
            ),

            // Title
            Text(
              "Enter your PIN",
              style: CustomTextStyle.normalText(Colors.black),
            ),
            const SizedBox(
              height: 25.0,
            ),

            // Password (4 characters)
            const FittedboxPasswordDots(),
            const SizedBox(
              height: 48,
            ),

            // Numeric keyboard
            numpadGrid(),
          ],
        ),
      ),
    );
  }
}
