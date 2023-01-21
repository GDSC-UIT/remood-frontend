import 'package:flutter/material.dart';
import 'package:remood/app/core/values/app_colors.dart';

class StackNote extends StatelessWidget {
  const StackNote({super.key});

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: _screenWidth * 0.731,
          height: _screenHeight * 0.236,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.Primary)),
// contain text field
          child: Center(
            child: Container(
              height: _screenHeight * 0.167,
              width: _screenWidth * 0.621,
              decoration: BoxDecoration(
                  color: AppColors.Primary42,
                  borderRadius: BorderRadius.circular(10)),
// text field
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration.collapsed(hintText: 'Add note'),
                  style: TextStyle(fontSize: 10),
                  maxLines: 12,
                  minLines: 1,
                ),
              ),
            ),
          ),
        ),
// 'Note' container
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
              'Note',
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