import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:remood/app/core/values/app_colors.dart';

class Sheet extends StatelessWidget {
  const Sheet({super.key});

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return Container(
        height: _screenHeight * 0.82,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Column(
          children: [
// "Add your topic"
            Padding(
              padding: EdgeInsets.only(
                top: _screenHeight * 0.044,
                left: _screenWidth * 0.064,
                right: _screenWidth * 0.613,
              ),
              child: const Text(
                "Add your topic",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: _screenHeight * 0.015,
            ),
// Textfield
            SizedBox(
              width: _screenWidth * 0.872,
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: AppColors.Greyscale,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                ),
                style: const TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: _screenHeight * 0.03,
            ),
// Underline
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.Greyscale),
                ),
              ),
            ),
            SizedBox(
              height: _screenHeight * 0.015,
            ),
//"Icon"
            Padding(
              padding: EdgeInsets.only(
                  left: _screenWidth * 0.064, right: _screenWidth * 0.8),
              child: const Text(
                "Icon",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ));
  }
}
