import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/data/models/language.dart';
import 'package:remood/app/modules/setting/setting_controller.dart';
import 'package:remood/app/modules/setting/widgets/listtile_language.dart';
import 'package:remood/app/modules/setting/widgets/stack_setting_appbar.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettingController());
    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      body: SafeArea(
        child: Column(
          children: const [
            StackSettingAppbar(title: "Select language"),
            SizedBox(height: 16.0),
            // English
            ListTileLaguage(index: 0),
            // Vietnamese
            ListTileLaguage(index: 1),
            // Japanese
            ListTileLaguage(index: 2),
          ],
        ),
      ),
    );
  }
}
