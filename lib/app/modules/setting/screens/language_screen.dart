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

    var lanList = [
      Language(label: "English", actived: true),
      Language(label: "Tiếng Việt", actived: false),
      Language(label: "日本語", actived: false),
    ];

    var styleActivedLan = CustomTextStyle.reportHeading()
        .copyWith(color: Colors.black, fontSize: 16);
    var styleInactivedLan =
        CustomTextStyle.onboardingText(Colors.black).copyWith(fontSize: 16);
    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      body: SafeArea(
        child: Column(
          children: [
            const StackSettingAppbar(title: "Select language"),
            const SizedBox(height: 16.0),
            ListTileLaguage(
                lanList: lanList, index: 0, styleLan: styleActivedLan),
            ListTileLaguage(
                lanList: lanList, index: 1, styleLan: styleInactivedLan),
            ListTileLaguage(
                lanList: lanList, index: 2, styleLan: styleInactivedLan),
          ],
        ),
      ),
    );
  }
}
