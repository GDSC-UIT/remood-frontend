import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/data/models/topic.dart';
import 'package:remood/app/global_widgets/card_topic.dart';
import 'package:remood/app/modules/setting/setting_controller.dart';

class ContainerTopiProps extends StatelessWidget {
  const ContainerTopiProps({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SettingController>();

    return Column();
  }
}
