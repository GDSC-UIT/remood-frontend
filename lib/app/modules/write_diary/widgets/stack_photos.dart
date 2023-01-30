import 'package:flutter/material.dart';
import 'package:remood/app/core/values/app_colors.dart';

class StackPhotos extends StatelessWidget {
  const StackPhotos({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
            width: screenWidth * 0.731,
            height: screenHeight * 0.174,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.primary)),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  //select photos
                },
                child: Container(
                    width: screenWidth * 0.413,
                    height: screenHeight * 0.124,
                    decoration: BoxDecoration(
                      color: AppColors.primary42,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.camera_alt,
                          color: AppColors.darkgrey,
                        ),
                        Text(
                          'Select photos',
                          style: TextStyle(
                              fontSize: 10, color: AppColors.darkgrey),
                        )
                      ],
                    )),
              ),
            )),
// 'Photos' Tag
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
              'Photos',
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
