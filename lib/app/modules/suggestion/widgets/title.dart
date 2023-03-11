import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/modules/suggestion/suggestion_controller.dart';

class TitleContainer extends StatelessWidget {
  RxInt currentIndex;
  int index;
  String text;
  TitleContainer(
      {super.key,
      required this.text,
      required this.currentIndex,
      required this.index});

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return Obx(
      () => Container(
        width: _screenWidth * 0.363,
        decoration: BoxDecoration(
            color: currentIndex.value == index
                ? AppColors.titleSelected
                : Colors.white,
            borderRadius: BorderRadius.circular(34)),
        child: Center(
            child: Text(
          text,
          style: CustomTextStyle.suggestionTitle(),
        )),
      ),
    );
  }
}
