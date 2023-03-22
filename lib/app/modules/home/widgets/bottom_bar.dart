import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/modules/home/home_controller.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeController changeScreen = Get.find();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight * 0.11,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(45), topRight: Radius.circular(45)),
        child: Obx(
          () => BottomNavigationBar(
            unselectedItemColor: AppColors.unselecttedIcon,
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
    );
  }
}
