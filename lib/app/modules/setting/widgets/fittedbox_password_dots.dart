import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/modules/setting/setting_controller.dart';

class FittedboxPasswordDots extends StatelessWidget {
  const FittedboxPasswordDots({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Controller
    final SettingController controller = Get.find();

    // Data
    var isActiveDot = controller.isActiveDot;

    return FittedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          4,
          (index) => Padding(
            padding: const EdgeInsets.all(0),
            child: Obx(() => Container(
                  width: 12,
                  height: 12,
                  margin: const EdgeInsets.only(right: 5.5, left: 5.5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: isActiveDot(index)
                        ? AppColors.mainColor
                        : AppColors.darkgrey,
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
