import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/data/models/register_email.dart';
import 'package:remood/app/modules/login_signup/login_controller.dart';
import 'package:remood/app/modules/login_signup/widgets/account_question.dart';
import 'package:remood/app/modules/login_signup/widgets/action_bar.dart';
import 'package:remood/app/modules/login_signup/widgets/my_textfield.dart';
import 'package:remood/app/modules/login_signup/widgets/slogan.dart';
import 'package:remood/app/modules/login_signup/widgets/title.dart';
import 'package:remood/app/routes/app_routes.dart';
import 'package:http/http.dart' as http;

class CreateNewAccount extends StatefulWidget {
  const CreateNewAccount({super.key});

  @override
  State<CreateNewAccount> createState() => _CreateNewAccountState();
}

class _CreateNewAccountState extends State<CreateNewAccount> {
  TextEditingController emailcontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

  TextEditingController usenamecontroller = TextEditingController();
  LogInController logInController = Get.find<LogInController>();

  @override
  Widget build(BuildContext context) {
    LogInController registerController = LogInController();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    void createNewData(String email, String usename, String password) async {
      showDialog(
          context: context,
          builder: ((context) => const Center(
                child: CircularProgressIndicator(),
              )));
      try {
        final response = await http.post(
          Uri.parse('https://remood-backend.onrender.com/api/users/'),
          body: jsonEncode(<String, String>{
            "username": usename,
            "email": email,
            "password": password,
          }),
        );
        print(response.body);
        if (response.statusCode == 200) {
          print(response.body);
          var data = jsonDecode(response.body.toString());
          RegisterEmail.registerEmail.add(data['data']['user']['email']);
          print(RegisterEmail.registerEmail);
          logInController.hiveboxRegisterEmail.updateDatabase();
          Get.toNamed(AppRoutes.login);
        } else {
          Get.back();
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text("Registation failed")));
        }
      } catch (e) {
        print(e);
      }
    }

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
            titleLogin(text: "Create new account"),
            SizedBox(
              height: screenHeight * 0.031,
            ),

            // slogan
            const Slogan(),
            SizedBox(
              height: screenHeight * 0.043,
            ),
            MyTextField(
              controller: usenamecontroller,
              hintText: "Usename",
              obscureText: false,
            ),
            SizedBox(
              height: screenHeight * 0.031,
            ),
            MyTextField(
              hintText: "Email",
              obscureText: false,
              controller: emailcontroller,
            ),
            SizedBox(
              height: screenHeight * 0.031,
            ),
            MyTextField(
              hintText: "Password",
              obscureText: true,
              controller: passwordcontroller,
            ),
            SizedBox(
              height: screenHeight * 0.18,
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
                  createNewData(emailcontroller.text, usenamecontroller.text,
                      passwordcontroller.text);
                },
                child: Container(
                    height: screenHeight * 0.064,
                    decoration: BoxDecoration(
                      color: AppColors.mainColor,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Center(
                      child: Text(
                        "Sign up",
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
