import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/app_strings.dart';
import 'package:remood/app/modules/freshmood/freshmood_widgets/back_button.dart';
import 'package:remood/app/modules/freshmood/sad_screens/sad_screen_controller.dart';
import 'package:remood/app/routes/app_routes.dart';

class ChooseScreen extends StatelessWidget {
  const ChooseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    SadController sadController = Get.find();
    return Scaffold(
      backgroundColor: AppColors.BackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
// back button
          const BackButtonContainer(),
          SizedBox(
            height: _screenHeight * 0.281,
          ),
          const Center(
            child: Text(
              "You want to....",
              style: TextStyle(
                  color: AppColors.Primary,
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
            ),
          ),
          SizedBox(
            height: _screenHeight * 0.03,
          ),
// choice freshmood
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: ListView.separated(
                  itemBuilder: ((context, index) => GestureDetector(
                        onTap: () {
                          sadController.changeChoice(index);
                          Get.toNamed(AppRoutes.readDiaryFreshmood);
                        },
                        child: Obx(
                          () => Container(
                            height: _screenHeight * 0.07,
                            decoration: BoxDecoration(
                                color:
                                    sadController.currentChoice.value == index
                                        ? AppColors.MainColor
                                        : Colors.white,
                                borderRadius: BorderRadius.circular(23),
                                boxShadow: const [
                                  BoxShadow(blurRadius: 1, offset: Offset(1, 1))
                                ]),
                            child: Center(
                                child: Text(
                              AppStrings.nameChoiceFreshmood[index],
                              style: TextStyle(
                                  color:
                                      sadController.currentChoice.value == index
                                          ? Colors.white
                                          : AppColors.Primary,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            )),
                          ),
                        ),
                      )),
                  separatorBuilder: ((context, index) => const SizedBox(
                        height: 16,
                      )),
                  itemCount: 2),
            ),
          )
        ],
      ),
    );
  }
}
