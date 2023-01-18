import 'package:flutter/material.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/global_widgets/bottombar.dart';
import 'package:remood/app/global_widgets/floating_action_button.dart';
import 'package:remood/app/modules/home/widgets/button_today_diary.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
// floating ActionButton
      floatingActionButton: const FloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
// bottom navigation bar
      bottomNavigationBar: const BottomNavigation(),
// body screen
      body: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.714,
          ),
// button (today's diary)
          const ButtonDiary(),
        ],
      ),
    );
  }
}
