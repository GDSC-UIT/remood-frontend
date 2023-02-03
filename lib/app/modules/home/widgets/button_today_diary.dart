import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/routes/app_routes.dart';

class ButtonDiary extends StatelessWidget {
  const ButtonDiary({super.key});

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _screenWidth * 0.277),
      child: SizedBox(
        width: _screenWidth * 0.445,
        height: _screenHeight * 0.063,
        child: ElevatedButton.icon(
          icon: const Icon(
            Icons.edit,
            color: AppColors.Primary,
          ),
          label: const Text(
            'Today\'s diary',
            style: TextStyle(color: AppColors.Primary, fontSize: 18),
          ),
          onPressed: () {
            // today's diary
            Get.toNamed(AppRoutes.writediary);
          },
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(AppColors.buttonDiary),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
