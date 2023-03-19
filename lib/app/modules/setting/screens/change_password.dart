import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/global_widgets/my_textfield.dart';
import 'package:remood/app/modules/home/home_controller.dart';
import 'package:remood/app/modules/setting/widgets/stack_setting_appbar.dart';
import 'package:http/http.dart' as http;
import 'package:remood/app/routes/app_routes.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double width = screenWidth * 0.872;
    double height = 60;
    Color boxColor = AppColors.mainColor;
    double borderRadius = 30.5;
    TextEditingController oldPassword = TextEditingController();
    TextEditingController newPassword = TextEditingController();
    HomeController tokenController = Get.find();
    void changePassword(String newpassword, String oldpassword) async {
      showDialog(
          context: context,
          builder: ((context) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }));
      final response = await http.put(
          Uri.parse(
              "https://remood-backend.onrender.com/api/users/password?old-password=$oldpassword&new-password=$newpassword"),
          headers: {
            "Authorization": "Bearer ${tokenController.token}",
          });
      if (response.statusCode == 200) {
        print(response.body);
        Get.back();
        Get.toNamed(AppRoutes.home);
      } else {
        print("Failed");
      }
    }

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const StackSettingAppbar(title: "Change password"),
            const SizedBox(
              height: 25.0,
            ),
            MyTextField(
                hintText: "Old password",
                obscureText: true,
                controller: oldPassword),
            const SizedBox(
              height: 24,
            ),
            MyTextField(
                hintText: "New password",
                obscureText: true,
                controller: newPassword),
            const Spacer(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      changePassword(
                          newPassword.text.trim(), oldPassword.text.trim());
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
                        "Save",
                        style: CustomTextStyle.h2(Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            )
          ],
        ),
      ),
    );
  }
}
