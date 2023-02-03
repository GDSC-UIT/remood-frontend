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

    /// -1 is whitespace
    /// -2 is delete button
    /// the others is numpad data
    var numpadData = [1, 2, 3, 4, 5, 6, 7, 8, 9, -1, 0, -2];

    Widget confirmButton() {
      double width = screenWidth * 0.872;
      double height = 60;
      Color boxColor = AppColors.mainColor;
      double borderRadius = 30.5;
      String label = "Done";
      return GestureDetector(
        onTap: () => Get.back(),
        child: Container(
          alignment: Alignment.center,
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: boxColor,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: Text(
            label,
            style: CustomTextStyle.h2(Colors.white),
          ),
        ),
      );
    }

    Widget numpadButton(int index) {
      double width = 66;
      double height = 66;
      double borderRadius = 50.0;
      Color boxColor = AppColors.settingNumpadButton;
      Widget? child = Text(
        "$index",
        style: CustomTextStyle.h2(Colors.white).copyWith(fontSize: 24.0),
      );

      if (index == -1) {
        boxColor = Colors.transparent;
        child = null;
      } else if (index == -2) {
        child = Icon(
          CupertinoIcons.delete_left,
          color: boxColor,
        );
        boxColor = Colors.transparent;
      }
      return Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: boxColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: child,
      );
    }

    Widget numpadGrid() {
      double widthContainer = 270;
      double spacing = 29;
      double runSpacing = 48;
      return Container(
        alignment: Alignment.center,
        width: widthContainer,
        child: Wrap(
          runAlignment: WrapAlignment.center,
          spacing: spacing,
          runSpacing: runSpacing,
          children: List.generate(
            numpadData.length,
            (index) => numpadButton(numpadData[index]),
          ),
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
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.021,
                    right: screenWidth * 0.053,
                  ),
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

            // Done button
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  confirmButton(),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
