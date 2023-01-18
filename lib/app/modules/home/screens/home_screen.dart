import 'package:flutter/material.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/data/models/list_bottom_screen.dart';
import 'package:remood/app/global_widgets/floating_action_button.dart';
import 'package:remood/app/modules/home/widgets/button_today_diary.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Screens _listScreens = Screens();
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.BackgroundColor,
// floating ActionButton
      floatingActionButton: const FloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
// bottom navigation bar
      bottomNavigationBar: SizedBox(
        height: _screenHeight * 0.11,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45)),
          child: BottomNavigationBar(
            selectedItemColor: AppColors.MainColor,
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
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
      ),
// body screen
      body: _listScreens.ListScreens[_currentIndex],
    );
  }
}
