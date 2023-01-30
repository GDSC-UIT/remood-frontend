import 'package:flutter/material.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/data/models/list_bottom_screen.dart';
import 'package:remood/app/modules/home/home_controller.dart';
import 'package:remood/app/modules/home/widgets/floating_action_button.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // int currentIndex = 0;
    Screens _listScreens = Screens();
    // double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    HomeController changeScreen = Get.find();
    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
// floating ActionButton
      floatingActionButton: const FloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
// bottom navigation bar
      bottomNavigationBar: SizedBox(
        height: _screenHeight * 0.11,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45)),
          child: Obx(
            () => BottomNavigationBar(
              selectedItemColor: AppColors.mainColor,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_month),
                  label: 'None',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.article),
                  label: 'None',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.signal_cellular_alt),
                  label: 'None',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'None',
                ),
              ],
              currentIndex: changeScreen.current.value,
              onTap: (index) {
                changeScreen.changeBottomScreen(index);
              },
            ),
          ),
        ),
      ),
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
