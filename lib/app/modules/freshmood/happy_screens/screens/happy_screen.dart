import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/modules/freshmood/freshmood_widgets/back_button.dart';
import 'package:remood/app/modules/home/home_controller.dart';
import 'package:remood/app/modules/home/widgets/floating_action_button.dart';
import 'package:remood/app/routes/app_routes.dart';

class HappyScreen extends StatelessWidget {
  const HappyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    HomeController changeAsset = Get.find();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
// back button
          BackButtonContainer(),
          SizedBox(
            height: _screenHeight * 0.2,
          ),
// icon feelings
          Padding(
            padding: EdgeInsets.only(left: _screenWidth * 0.43),
            child: Container(
              width: 56,
              height: 56,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Image.asset(
                  changeAsset.valueSlider.value < 60
                      ? Assets.normal
                      : changeAsset.valueSlider.value < 80
                          ? Assets.fun
                          : Assets.happy,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 17,
          ),
// quote
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _screenWidth * 0.18),
            child: Container(
              width: _screenWidth * 0.64,
              height: _screenHeight * 0.297,
              child: Text(
                '"Lorem ipsum dolor sit amet consectetur. Rutrum ut at sit lacus dolor egestas egestas vel turpis. At congue pretium ultrices quam quis pellentesque id. Ullamcorper dictum eget nunc tortor nunc risus natoque. Blandit nisl urna egestas cursus."',
                style: TextStyle(
                  fontSize: 20,
                  color: changeAsset.valueSlider.value < 60
                      ? AppColors.normalFace
                      : changeAsset.valueSlider.value < 80
                          ? AppColors.smileFace
                          : AppColors.happyFace,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
