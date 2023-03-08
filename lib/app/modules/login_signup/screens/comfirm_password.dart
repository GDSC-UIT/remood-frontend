import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/modules/login_signup/widgets/account_question.dart';
import 'package:remood/app/modules/login_signup/widgets/action_bar.dart';
import 'package:remood/app/modules/login_signup/widgets/my_textfield.dart';
import 'package:remood/app/modules/login_signup/widgets/slogan.dart';
import 'package:remood/app/modules/login_signup/widgets/title.dart';
import 'package:remood/app/routes/app_routes.dart';

class ComfirmPassword extends StatelessWidget {
  const ComfirmPassword({super.key});

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // logibar
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: LoginBar(),
            ),
            SizedBox(
              height: _screenHeight * 0.062,
            ),

            //title login
            titleLogin(text: "Forgot      Password"),
            SizedBox(
              height: _screenHeight * 0.031,
            ),

            // slogan
            const Slogan(),
            SizedBox(
              height: _screenHeight * 0.043,
            ),
            MyTextField(hintText: "New password", obscureText: true),
            SizedBox(
              height: _screenHeight * 0.031,
            ),
            MyTextField(hintText: "Comfirm password", obscureText: true),
            SizedBox(
              height: _screenHeight * 0.28,
            ),
            AccountQuestion(
                question: "Have an account?",
                button: "Login",
                route: AppRoutes.login),
            SizedBox(
              height: _screenHeight * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: _screenWidth * 0.059),
              child: GestureDetector(
                onTap: () {
                  Get.offAllNamed(AppRoutes.home);
                },
                child: Container(
                    height: _screenHeight * 0.064,
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Center(
                      child: Text(
                        "Reset password",
                        style: CustomTextStyle.TextLogin(Colors.white),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
