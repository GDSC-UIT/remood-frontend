import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/global_widgets/bottombar.dart';
import 'package:remood/app/global_widgets/floating_action_button.dart';

class writeDiaryScreen extends StatelessWidget {
  const writeDiaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: AppColors.BackgroundColor,
        body: Column(
          children: [],
        ));
  }
}
