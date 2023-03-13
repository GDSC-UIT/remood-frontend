import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/text_style.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({super.key, required this.label, this.func});
  final String label;
  final Function? func;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double width = screenWidth * 0.872;
    double height = 60;
    Color boxColor = AppColors.mainColor;
    double borderRadius = 30.5;

    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              if (func != null) {
                func!();
              }

              Get.back();
            },
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
          ),
        ],
      ),
    );
  }
}
