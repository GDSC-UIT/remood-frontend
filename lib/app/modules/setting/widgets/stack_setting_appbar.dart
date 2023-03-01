import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/global_widgets/back_button.dart';

class StackSettingAppbar extends StatelessWidget {
  const StackSettingAppbar({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackButtonContainer(),
        Container(
          padding: const EdgeInsets.only(top: 28.0),
          alignment: Alignment.topCenter,
          child: Text(
            title,
            style: CustomTextStyle.h2(Colors.black),
          ),
        ),
      ],
    );
  }
}
