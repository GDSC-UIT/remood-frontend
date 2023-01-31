import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/global_widgets/switch_button.dart';
import 'package:remood/app/modules/setting/setting_controller.dart';
import 'package:remood/app/modules/setting/widgets/stack_setting_appbar.dart';

class FittedboxPasswordDots extends StatelessWidget {
  const FittedboxPasswordDots({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          4,
          (index) => Container(
            width: 12,
            height: 12,
            margin: const EdgeInsets.only(right: 5.5, left: 5.5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.darkgrey,
            ),
          ),
        ),
      ),
    );
  }
}
