import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/modules/login_signup/widgets/action_bar.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/modules/login_signup/widgets/slogan.dart';
import 'package:remood/app/modules/login_signup/widgets/title.dart';
import 'package:remood/app/routes/app_routes.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 25),
            child: LoginBar(),
          ),
          SizedBox(
            height: _screenHeight * 0.062,
          ),
          titleLogin(text: "Welcome to Remood!"),
          SizedBox(
            height: _screenHeight * 0.031,
          ),
          const Slogan(),
          SizedBox(
            height: _screenHeight * 0.043,
          ),
          Padding(
            padding: EdgeInsets.only(left: _screenWidth * 0.064),
            child: GestureDetector(
              onTap: (() {
                Get.toNamed(AppRoutes.login);
              }),
              child: Container(
                width: _screenWidth * 0.88,
                height: _screenHeight * 0.064,
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
            height: _screenHeight * 0.031,
          ),
          Padding(
            padding: EdgeInsets.only(left: _screenWidth * 0.064),
            child: GestureDetector(
              onTap: (() {
                Get.offAllNamed(AppRoutes.home);
              }),
              child: Container(
                width: _screenWidth * 0.88,
                height: _screenHeight * 0.064,
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
