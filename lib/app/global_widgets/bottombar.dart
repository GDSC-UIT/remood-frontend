import 'package:flutter/material.dart';
import 'package:remood/app/core/values/app_colors.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
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
              icon: Icon(Icons.settings, size: 24),
              label: 'None',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings, size: 24),
              label: 'None',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings, size: 24),
              label: 'None',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings, size: 24),
              label: 'None',
            ),
          ],
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              print('$index');
            });
          },
        ),
      ),
    );
  }
}
