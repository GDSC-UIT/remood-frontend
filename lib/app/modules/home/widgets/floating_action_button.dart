import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/modules/home/home_controller.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    HomeController pressButton = Get.find();

    return SizedBox(
      width: screenWidth * 0.19,
      height: screenHeight * 0.09,
      child: FittedBox(
        child: Obx(
          () => FloatingActionButton(
            onPressed: (() {
              pressButton.onPressedButton(context);
            }),
            backgroundColor: pressButton.ispressed.value
                ? AppColors.mainColor
                : Colors.white,
            foregroundColor: Colors.black,
            child: Image.asset(
              Assets.smile,
              width: 30,
            ),
          ),
        ),
      ),
    );
  }
}
