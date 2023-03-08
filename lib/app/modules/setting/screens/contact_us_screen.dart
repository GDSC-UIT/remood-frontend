import 'package:flutter/material.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/data/services/contact_service.dart';
import 'package:remood/app/modules/setting/widgets/stack_setting_appbar.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String appBarTitle = "Contact Us";
    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      body: SafeArea(
        child: Column(
          children: [
            StackSettingAppbar(
              title: appBarTitle,
            ),
            const SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  ///Introduction
                  ContactService.getIntro,
                  const SizedBox(
                    height: 20.0,
                  ),

                  /// Address
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 24,
                          height: 24,
                          child: Image.asset(Assets.addressMarker)),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Flexible(
                        child: Text(
                          ContactService.address,
                          style: CustomTextStyle.normalText(Colors.black),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 9.0,
                  ),

                  /// Phone number
                  Row(
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: Image.asset(Assets.phone),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        ContactService.phoneNumber,
                        style: CustomTextStyle.normalText(Colors.black),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
