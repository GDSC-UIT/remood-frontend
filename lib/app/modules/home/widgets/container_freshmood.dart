import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;

import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/modules/home/home_controller.dart';
import 'package:remood/app/modules/home/widgets/floating_action_button.dart';

class FreshmoodPercent extends StatefulWidget {
  const FreshmoodPercent({super.key});

  @override
  State<FreshmoodPercent> createState() => _FreshmoodPercentState();
}

class _FreshmoodPercentState extends State<FreshmoodPercent> {
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    HomeController sliderController = Get.find();
    return Positioned(
        bottom: _screenHeight * 0.067,
        left: _screenWidth * 0.139,
        child: BackdropFilter(
          filter: ui.ColorFilter.mode(AppColors.barrierColor, BlendMode.darken),
          child: Column(
            children: [
              const DefaultTextStyle(
                child: Text(
                  "How was your day ?",
                ),
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              Material(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  width: _screenWidth * 0.723,
                  height: _screenHeight * 0.134,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)),
                  child: Obx(
                    () => Column(
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: 42,
                          height: 42,
                          child: Image.asset(
                            Assets.smile,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Slider(
                            value: sliderController.valueSlider.value,
                            min: 0,
                            max: 100,
                            thumbColor: Colors.white,
                            activeColor: sliderController.valueSlider.value < 20
                                ? AppColors.depressedFace
                                : sliderController.valueSlider.value < 40
                                    ? AppColors.sadFace
                                    : sliderController.valueSlider.value < 60
                                        ? AppColors.normalFace
                                        : sliderController.valueSlider.value <
                                                80
                                            ? AppColors.smileFace
                                            : AppColors.happyFace,
                            onChanged: ((value) =>
                                sliderController.onChangeSlider(value))),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: ClipPath(
                  clipper: ArrowClipper(),
                  child: Container(
                    height: 20,
                    width: 30,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const FloatingButton(),
            ],
          ),
        ));
    ;
  }
}

class ArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width / 2, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
