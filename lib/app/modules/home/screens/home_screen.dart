import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/global_widgets/bottombar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.BackgroundColor,
      bottomNavigationBar: SizedBox(
        height: _screenHeight * 0.11,
        child: const ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45)),
          child: BottomNavigation(),
        ),
      ),
    );
  }
}
