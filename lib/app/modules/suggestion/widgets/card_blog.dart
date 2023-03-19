import 'package:flutter/material.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/text_style.dart';

class CardBlog extends StatelessWidget {
  String image;
  String title;
  CardBlog({super.key, required this.image, required this.title});

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
              title,
              style: CustomTextStyle.suggestionTitle(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
          width: screenWidth * 0.533,
          height: screenHeight * 0.128,
          decoration: BoxDecoration(
            image:
                DecorationImage(image: NetworkImage(image), fit: BoxFit.fill),
            color: AppColors.grey,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
        )
      ],
    );
  }
}
