import 'package:flutter/material.dart';
import 'package:remood/app/core/values/app_colors.dart';

class StackTopic extends StatelessWidget {
  const StackTopic({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: screenWidth * 0.731,
          height: screenHeight * 0.115,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.primary)),
        ),
        Positioned(
          top: -30,
          left: -26,
          child: Container(
            width: screenWidth * 0.224,
            height: screenHeight * 0.061,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.primary),
            ),
            child: const Center(
                child: Text(
              'Topic',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                  fontSize: 18),
            )),
          ),
        ),
      ],
    );
  }
}
