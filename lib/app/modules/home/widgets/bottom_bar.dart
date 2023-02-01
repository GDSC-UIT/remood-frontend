import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: _screenHeight * 0.11,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(45), topRight: Radius.circular(45)),
        child: Obx(
          () => BottomNavigationBar(
            unselectedItemColor: AppColors.unselecttedIcon,
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
