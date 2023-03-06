import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/routes/app_routes.dart';

class SuggestionButton extends StatelessWidget {
  const SuggestionButton({super.key});

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.suggestion);
      },
      child: Container(
          width: _screenWidth * 0.83,
          height: _screenHeight * 0.058,
          decoration: BoxDecoration(
              color: AppColors.MainColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [BoxShadow(offset: Offset(0, 1))]),
          child: Center(
            child: Text(
              "Remood’s suggestion",
              style: CustomTextStyle.suggestionButtonText(),
            ),
          )),
    );
  }
}
