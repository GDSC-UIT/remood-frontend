import 'package:flutter/material.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/core/values/text_style.dart';

class ContainerNoInternet extends StatelessWidget {
  const ContainerNoInternet({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(Assets.sad),
          Text(
            "Oops!",
            style: CustomTextStyle.h3(AppColors.primary).copyWith(fontSize: 40),
            textAlign: TextAlign.center,
          ),
          Text(
            "No Internet connection found. \n"
            "Check your connection and try again!",
            style:
                CustomTextStyle.normalText(Colors.black).copyWith(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
