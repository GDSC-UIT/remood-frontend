import 'package:flutter/material.dart';
import 'package:remood/app/core/values/app_colors.dart';

class StackTag extends StatelessWidget {
  const StackTag({super.key});

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: _screenWidth * 0.731,
          height: _screenHeight * 0.09,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.Primary)),
        ),
        Positioned(
          top: -30,
          left: -26,
          child: Container(
            width: _screenWidth * 0.224,
            height: _screenHeight * 0.061,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.Primary),
            ),
            child: const Center(
                child: Text(
              'Tag',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.Primary,
                  fontSize: 18),
            )),
          ),
        ),
      ],
    );
  }
}
