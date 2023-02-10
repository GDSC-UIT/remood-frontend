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
    final controller = Get.put(SettingController());
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      body: SafeArea(
        child: Column(
          children: [
            const StackSettingAppbar(title: "Select language"),
            const SizedBox(height: 16.0),
            // English
            const ListTileLaguage(index: 0),
            // Vietnamese
            const ListTileLaguage(index: 1),
            // Japanese
            const ListTileLaguage(index: 2),
            // Save button
            // TODO: Save the current selected value - Language choice
            const ConfirmButton(label: "Save"),
            SizedBox(
              height: screenHeight * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
