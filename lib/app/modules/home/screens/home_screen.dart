import 'package:flutter/material.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/data/models/list_bottom_screen.dart';
import 'package:remood/app/modules/home/home_controller.dart';
import 'package:remood/app/modules/home/widgets/bottom_bar.dart';
import 'package:remood/app/modules/home/widgets/floating_action_button.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    HomeController changeScreen = Get.find();
    int currentIndex = 0;
    Screens listScreens = Screens();
    // double _screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      // floating ActionButton
      floatingActionButton: FloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // bottom navigation bar
      bottomNavigationBar: const BottomBar(),
      // body screen
      body: Obx(
        () => IndexedStack(
          index: changeScreen.current.value,
          children: listScreens.ListScreens,
        ),
      ),
    );
  }
}
