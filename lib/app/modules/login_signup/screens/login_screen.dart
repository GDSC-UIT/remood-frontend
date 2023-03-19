import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/modules/login_signup/login_controller.dart';
import 'package:remood/app/modules/login_signup/widgets/action_bar.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/modules/login_signup/widgets/slogan.dart';
import 'package:remood/app/modules/login_signup/widgets/title.dart';
import 'package:remood/app/routes/app_routes.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    LogInController logInController = Get.find<LogInController>();
    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 25),
            child: LoginBar(),
          ),
          SizedBox(
            height: screenHeight * 0.062,
          ),
          titleLogin(text: "Welcome to Remood!"),
          SizedBox(
            height: screenHeight * 0.031,
          ),
          const Slogan(),
          SizedBox(
            height: screenHeight * 0.043,
          ),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.064),
            child: GestureDetector(
              onTap: (() {
                Get.toNamed(AppRoutes.login);
              }),
              child: Container(
                width: screenWidth * 0.88,
                height: screenHeight * 0.064,
                decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Text(
                    "Log in",
                    style: CustomTextStyle.TextLogin(Colors.white),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.031,
          ),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.064),
            child: GestureDetector(
              onTap: (() {
                Get.offAllNamed(AppRoutes.home);
              }),
              child: Container(
                width: screenWidth * 0.88,
                height: screenHeight * 0.064,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.mainColor),
                    borderRadius: BorderRadius.circular(15)),
                child: Center(
                  child: Text(
                    "Use as a guest",
                    style: CustomTextStyle.TextLogin(AppColors.mainColor),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
