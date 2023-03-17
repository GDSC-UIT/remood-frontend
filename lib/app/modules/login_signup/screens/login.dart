import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/modules/login_signup/widgets/account_question.dart';
import 'package:remood/app/modules/login_signup/widgets/action_bar.dart';
import 'package:remood/app/modules/login_signup/widgets/my_textfield.dart';
import 'package:remood/app/modules/login_signup/widgets/slogan.dart';
import 'package:remood/app/modules/login_signup/widgets/title.dart';
import 'package:remood/app/routes/app_routes.dart';

class LogIn extends StatelessWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // logibar
            const Padding(
              padding: EdgeInsets.only(top: 25),
              child: LoginBar(),
            ),
            SizedBox(
              height: screenHeight * 0.062,
            ),

            //title login
            titleLogin(text: "Welcome to Remood!"),
            SizedBox(
              height: screenHeight * 0.031,
            ),

            // slogan
            const Slogan(),
            SizedBox(
              height: screenHeight * 0.043,
            ),

            // textfield usename
            MyTextField(
              hintText: "Usename",
              obscureText: false,
            ),
            SizedBox(
              height: screenHeight * 0.031,
            ),
            //textfield password
            MyTextField(
              hintText: "Password",
              obscureText: true,
            ),
            const SizedBox(
              height: 4,
            ),
            // forgot password
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.088),
                  child: GestureDetector(
                    onTap: (() {
                      Get.toNamed(AppRoutes.forgotPassword);
                    }),
                    child: Text(
                      "Forgot password",
                      style: CustomTextStyle.FotgotPassWord(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.025,
            ),
            // OR
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.096),
              child: Row(
                children: [
                  const Expanded(
                    child: Divider(thickness: 0.5, color: AppColors.grey),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.093),
                    child: Text(
                      "or",
                      style: CustomTextStyle.OrText(),
                    ),
                  ),
                  const Expanded(
                    child: Divider(thickness: 0.5, color: AppColors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.029,
            ),

            // Google Login
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.114),
              child: Container(
                height: screenHeight * 0.064,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 26,
                      height: 26,
                      child: FittedBox(
                          fit: BoxFit.fill, child: Image.asset(Assets.google)),
                    ),
                    SizedBox(
                      width: screenWidth * 0.051,
                    ),
                    Text(
                      "Continue with Google",
                      style: CustomTextStyle.GoogleLogin(),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.11,
            ),
            // Account question
            AccountQuestion(
              question: "Don’t have an account?",
              button: " Create Account",
              route: AppRoutes.createnewAccount,
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            //log in button
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.059),
              child: Container(
                  height: screenHeight * 0.064,
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Center(
                    child: Text(
                      "Log in",
                      style: CustomTextStyle.TextLogin(Colors.white),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
