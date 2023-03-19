import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/modules/setting/setting_controller.dart';
import 'package:remood/app/modules/setting/widgets/confirm_button.dart';
import 'package:remood/app/modules/setting/widgets/listtile_language.dart';
import 'package:remood/app/modules/setting/widgets/stack_setting_appbar.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller
    final SettingController controller = Get.find();

    // Data
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    var saveLanguage = controller.saveLanguage;

    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      body: SafeArea(
        child: Column(
          children: [
            const StackSettingAppbar(title: "Select language"),
            const SizedBox(height: 16.0),
            // Languages
            Column(
              children: List.generate(
                controller.lanList.length,
                (index) => ListTileLaguage(index: index),
              ),
            ),
            // Save button
            // TODO: Save the current selected value - Language choice
            ConfirmButton(
              label: "Save",
              func: saveLanguage,
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
