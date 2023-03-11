import 'package:flutter/material.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/data/services/media_query_service.dart';

class FloatingButton extends StatefulWidget {
  const FloatingButton({super.key});
  @override
  State<FloatingButton> createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    var pctWidth = MediaQueryService.pctWidth(context);
    var pctHeight = MediaQueryService.pctHeight(context);
    void onPressed() {
      setState(() {
        isPressed = !isPressed;
      });
    }

    return SizedBox(
      width: 70 * pctWidth,
      height: 69 * pctHeight,
      child: FittedBox(
        child: FloatingActionButton(
          onPressed: onPressed,
          backgroundColor: isPressed ? AppColors.mainColor : Colors.white,
          foregroundColor: Colors.black,
          child: Image.asset(
            Assets.smile,
            width: 30,
          ),
        ),
      ),
    );
  }
}
