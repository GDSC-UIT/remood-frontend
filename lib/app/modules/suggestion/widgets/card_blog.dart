import 'package:flutter/material.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/text_style.dart';

class CardBlog extends StatelessWidget {
  const CardBlog({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          width: screenWidth * 0.533,
          height: screenHeight * 0.213,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.144),
            child: Text(
              "Lorem ipsum dolor sit amet consectetur.",
              style: CustomTextStyle.suggestionTitle(),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
          width: screenWidth * 0.533,
          height: screenHeight * 0.128,
          decoration: const BoxDecoration(
            color: AppColors.grey,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
        )
      ],
    );
  }
}
