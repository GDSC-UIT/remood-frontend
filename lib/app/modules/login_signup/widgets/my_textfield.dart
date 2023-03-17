import 'package:flutter/material.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/text_style.dart';

class MyTextField extends StatelessWidget {
  String hintText;
  bool obscureText = false;
  MyTextField({super.key, required this.hintText, required this.obscureText});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.064),
        child: TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: AppColors.greyscale,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: AppColors.mainColor,
              ),
            ),
            hintText: hintText,
            hintStyle: CustomTextStyle.HintTextLogin(),
          ),
          style: CustomTextStyle.InputTextLogin(),
        ));
  }
}
