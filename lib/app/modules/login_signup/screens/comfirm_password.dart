import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/modules/login_signup/login_controller.dart';
import 'package:remood/app/modules/login_signup/widgets/account_question.dart';
import 'package:remood/app/modules/login_signup/widgets/action_bar.dart';
import 'package:remood/app/modules/login_signup/widgets/my_textfield.dart';
import 'package:remood/app/modules/login_signup/widgets/slogan.dart';
import 'package:remood/app/modules/login_signup/widgets/title.dart';
import 'package:remood/app/routes/app_routes.dart';

class ComfirmPassword extends StatefulWidget {
  const ComfirmPassword({super.key});

  @override
  State<ComfirmPassword> createState() => _ComfirmPasswordState();
}

class _ComfirmPasswordState extends State<ComfirmPassword> {
  TextEditingController passwordcontroller = TextEditingController();

  TextEditingController comfirmpasswordcontroller = TextEditingController();
  LogInController logInController = Get.find<LogInController>();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.backgroundPage,
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
            titleLogin(text: "Forgot\nPassword"),
            SizedBox(
              height: screenHeight * 0.031,
            ),

            // slogan
            const Slogan(),
            SizedBox(
              height: screenHeight * 0.043,
            ),
            MyTextField(
              hintText: "New password",
              obscureText: true,
              controller: passwordcontroller,
            ),
            MyTextField(
              hintText: "New password",
              obscureText: true,
              controller: passwordcontroller,
            ),
            SizedBox(
              height: screenHeight * 0.031,
            ),
            MyTextField(
              hintText: "Comfirm password",
              obscureText: true,
              controller: comfirmpasswordcontroller,
            ),
            MyTextField(
              hintText: "Comfirm password",
              obscureText: true,
              controller: comfirmpasswordcontroller,
            ),
            SizedBox(
              height: screenHeight * 0.28,
            ),
            AccountQuestion(
                question: "Have an account?",
                button: "Login",
                route: AppRoutes.login),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.059),
              child: GestureDetector(
                onTap: () {
                  Get.offAllNamed(AppRoutes.home);
                },
                child: Container(
                    height: screenHeight * 0.064,
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
