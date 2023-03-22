import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/text_style.dart';

class CardArticle extends StatelessWidget {
  Color color;
  String image;
  String title;
  CardArticle({
    super.key,
    required this.image,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(image), fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      Positioned(
        bottom: 0,
        child: Container(
          width: screenWidth * 0.9,
          height: screenHeight * 0.095,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [
                    0.05,
                    0.5,
                    0.9
                  ],
                  colors: [
                    color.withOpacity(0.5),
                    const Color.fromRGBO(0, 0, 0, 0.3),
                    color.withOpacity(0.5)
                  ]),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))),
          child: Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              Container(
                width: screenWidth * 0.1,
                height: screenHeight * 0.05,
                decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(10)),
              ),
              const SizedBox(
                width: 7.5,
              ),
              SizedBox(
                  width: screenWidth * 0.627,
                  height: screenHeight * 0.074,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      title,
                      style: CustomTextStyle.suggestionTitleArticle(),
                    ),
                  )),
              const SizedBox(
                width: 14,
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
