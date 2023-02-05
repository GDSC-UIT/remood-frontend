import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/modules/setting/setting_controller.dart';

class SwitchButton extends StatelessWidget {
  const SwitchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final SettingController controller = Get.find<SettingController>();
    return Obx(() => CupertinoSwitch(
          activeColor: AppColors.mainColor,
          value: controller.actived.value,
          onChanged: (_) {
            controller.switchOnChange();
          },
        ));
  }
}
