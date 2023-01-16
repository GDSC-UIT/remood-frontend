import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/global_widgets/bottombar.dart';
import 'package:remood/app/global_widgets/floating_action_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.BackgroundColor,
      floatingActionButton: Container(
        width: _screenWidth * 0.19,
        height: _screenHeight * 0.09,
        child: const FittedBox(
          child: FloatingButton(),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: SizedBox(
        height: _screenHeight * 0.11,
        child: const ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45)),
          child: BottomNavigation(),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: _screenHeight * 0.714,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: _screenWidth * 0.277),
            child: SizedBox(
              width: _screenWidth * 0.445,
              height: _screenHeight * 0.063,
              child: ElevatedButton.icon(
                icon: const Icon(
                  Icons.edit,
                  color: AppColors.brown,
                ),
                label: const Text(
                  'Today\'s diary',
                  style: TextStyle(color: AppColors.brown, fontSize: 18),
                ),
                onPressed: () {
                  // today's diary
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(245, 222, 176, 1)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
