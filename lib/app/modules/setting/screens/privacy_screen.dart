import 'package:flutter/material.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/data/services/privacy_service.dart';
import 'package:remood/app/modules/setting/widgets/stack_setting_appbar.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const StackSettingAppbar(title: "Privacy"),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                children: [
                  Text(
                    "Term of Use",
                    style: CustomTextStyle.reportHeading()
                        .copyWith(color: Colors.black, fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    PrivacyService.intro,
                    style: CustomTextStyle.normalText(
                      const Color(0xFFB3B1B0),
                    ).copyWith(fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(height: 16),
                  Column(
                    children: List.generate(
                      PrivacyService.contents.length,
                      (index) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${index + 1}. ${PrivacyService.contents[index].heading}",
                            style: CustomTextStyle.normalText(
                              const Color(0xFFB3B1B0),
                            ).copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          Text(
                            PrivacyService.contents[index].body,
                            style: CustomTextStyle.normalText(
                              const Color(0xFFB3B1B0),
                            ),
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    PrivacyService.conclusion,
                    style: CustomTextStyle.normalText(
                      const Color(0xFFB3B1B0),
                    ).copyWith(fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
