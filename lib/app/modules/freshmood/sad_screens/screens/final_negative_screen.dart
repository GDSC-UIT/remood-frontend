import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/modules/freshmood/freshmood_widgets/back_button.dart';
import 'package:remood/app/routes/app_routes.dart';

class FinalNegativeScreen extends StatelessWidget {
  const FinalNegativeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.BackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BackButtonContainer(),
          SizedBox(
            height: _screenHeight * 0.28,
          ),
          const Center(
              child: Text(
            "Why would you stop when you have been through all of this before?",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.Primary,
                fontWeight: FontWeight.w700,
                fontSize: 25),
          )),
          SizedBox(
            height: 27,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.home);
              },
              child: Container(
                width: _screenWidth * 0.84,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(23),
                    boxShadow: [
                      BoxShadow(blurRadius: 1, offset: Offset(1, 1))
                    ]),
                child: const Center(
                  child: Text(
                    "Okay",
                    style: TextStyle(
                        color: AppColors.Primary,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
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
