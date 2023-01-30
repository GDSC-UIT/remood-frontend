import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/data/models/list_bottom_screen.dart';
import 'package:remood/app/data/models/list_positive_diary.dart';
import 'package:remood/app/modules/home/home_controller.dart';
import 'package:remood/app/modules/home/widgets/bottom_bar.dart';
import 'package:remood/app/modules/home/widgets/container_freshmood.dart';
import 'package:remood/app/modules/home/widgets/floating_action_button.dart';
import 'package:remood/app/modules/home/widgets/button_today_diary.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    HomeController changeScreen = Get.find();
    int currentIndex = 0;
    Screens _listScreens = Screens();
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.BackgroundColor,
      // floating ActionButton
      floatingActionButton: const FloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottom navigation bar
      bottomNavigationBar: const BottomBar(),
      // body screen
      body: Obx(
        () => IndexedStack(
          index: changeScreen.current.value,
          children: _listScreens.ListScreens,
        ),
      ),
    );
  }
}
