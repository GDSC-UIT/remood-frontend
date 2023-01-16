import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/global_widgets/bottombar.dart';

class FloatingButton extends StatefulWidget {
  const FloatingButton({super.key});
  @override
  State<FloatingButton> createState() => _FloatingButtonState();
}

class _FloatingButtonState extends State<FloatingButton> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    void _onPressed() {
      setState(() {
        isPressed = !isPressed;
      });
    }

    return Container(
      width: _screenWidth * 0.19,
      height: _screenHeight * 0.09,
      child: FittedBox(
        child: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _onPressed,
          backgroundColor: isPressed ? AppColors.MainColor : Colors.white,
          foregroundColor: Colors.black,
        ),
      ),
    );
  }
}
