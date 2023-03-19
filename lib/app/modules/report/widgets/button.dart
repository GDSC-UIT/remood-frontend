import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/routes/app_routes.dart';

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.suggestion);
      },
      child: Container(
        width: screenWidth * 0.517,
        height: screenHeight * 0.058,
        decoration: BoxDecoration(
            color: AppColors.buttonDiary,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [BoxShadow(offset: Offset(0, 1))]),
        child: Center(
          child: Text(
            "Remood’s suggestion",
            style: CustomTextStyle.suggestionButtonText()
                .copyWith(color: AppColors.primary),
          ),
        ),
      ),
    );
  }
}
