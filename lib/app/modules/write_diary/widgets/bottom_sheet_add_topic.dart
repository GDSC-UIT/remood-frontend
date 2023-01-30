import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/data/models/list_selected_color_topic.dart';
import 'package:remood/app/data/models/list_selected_icons_topic.dart';

class SheetAddTopic extends StatelessWidget {
  const SheetAddTopic({super.key});

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    ListSelectedIcons listSelectedIcons = ListSelectedIcons();
    ListSelectedColor listSelectedColor = ListSelectedColor();
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
                      color: AppColors.greyscale,
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
                  bottom: BorderSide(color: AppColors.greyscale),
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
            SizedBox(height: _screenHeight * 0.0135),
// Icon gridview
            SizedBox(
              width: _screenWidth * 0.89,
              height: _screenHeight * 0.13,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                  crossAxisSpacing: _screenWidth * 0.067,
                  mainAxisSpacing: _screenHeight * 0.035,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    width: _screenWidth * 0.093,
                    height: _screenHeight * 0.043,
                    decoration: BoxDecoration(
                      color: AppColors.grey22,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      listSelectedIcons.selectedIcons[index],
                      color: AppColors.darkBlue,
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: _screenHeight * 0.01,
            ),
// "Color"
            Padding(
              padding: EdgeInsets.only(
                  left: _screenWidth * 0.064, right: _screenWidth * 0.8),
              child: const Text(
                "Color",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: _screenHeight * 0.0135),
// selected Icon color
            SizedBox(
              width: _screenWidth * 0.89,
              height: _screenHeight * 0.13,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                  crossAxisSpacing: _screenWidth * 0.067,
                  mainAxisSpacing: _screenHeight * 0.035,
                ),
                itemCount: 12,
                itemBuilder: (context, index) {
                  return Container(
                    width: _screenWidth * 0.093,
                    height: _screenHeight * 0.043,
                    decoration: BoxDecoration(
                      color: listSelectedColor.selectedColors[index],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: _screenHeight * 0.187,
            ),
// Done button
            SizedBox(
              width: _screenWidth * 0.88,
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(AppColors.mainColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                ),
                child: const Text('Done'),
              ),
            ),
          ],
        ));
  }
}
