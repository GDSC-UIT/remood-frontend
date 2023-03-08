import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/text_style.dart';

class CardArticle extends StatelessWidget {
  Color color;
  int index;
  CardArticle({super.key, required this.color, required this.index});

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      Positioned(
        bottom: 0,
        child: Container(
          width: _screenWidth * 0.9,
          height: _screenHeight * 0.095,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                    0.05,
                    0.5,
                    0.9
                  ],
                  colors: [
                    color.withOpacity(0.5),
                    Color.fromRGBO(0, 0, 0, 0.3),
                    color.withOpacity(0.5)
                  ]),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25))),
          child: Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Container(
                width: _screenWidth * 0.1,
                height: _screenHeight * 0.05,
                decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(10)),
              ),
              SizedBox(
                width: 7.5,
              ),
              Container(
                  width: _screenWidth * 0.627,
                  height: _screenHeight * 0.074,
                  child: Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Text(
                      "[Tittle] Lorem ipsum dolor sit amet consectetur.",
                      style: CustomTextStyle.suggestionTitleArticle(),
                    ),
                  )),
              SizedBox(
                width: 14,
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
