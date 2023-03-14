import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/data/models/report_controller.dart';
import 'package:remood/app/data/services/media_query_service.dart';
import 'package:remood/app/modules/home/home_controller.dart';
import 'package:remood/app/modules/home/widgets/floating_action_button.dart';
import 'package:remood/app/routes/app_routes.dart';
import 'package:http/http.dart' as http;

class FreshmoodPercent extends StatefulWidget {
  const FreshmoodPercent({super.key});

  @override
  State<FreshmoodPercent> createState() => _FreshmoodPercentState();
}

class _FreshmoodPercentState extends State<FreshmoodPercent> {
  HomeController tokenController = Get.find();
  var url = "https://remood-backend.onrender.com/api/review-notes/";

  createData(int point) async {
    var response = await http.post(Uri.parse(url),
        headers: {
          'Authorization': 'Bearer ${tokenController.token.value}',
        },
        body: jsonEncode(<String, dynamic>{
          'point': point,
        }));
    print(response.statusCode);
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    var pctWidth = MediaQueryService().pctWidth(context);
    var pctHeight = MediaQueryService().pctHeight(context);
    Future<reportController>? futureReport;
    HomeController sliderController = Get.find();
    return Scaffold(
      backgroundColor: AppColors.barrierColor,
      body: Padding(
        padding: EdgeInsets.only(bottom: screenHeight * 0.063),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
//"How was your day ?"
            const DefaultTextStyle(
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: Colors.white),
              child: Text(
                "How was your day ?",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
// container
            Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Container(
                width: screenWidth * 0.723,
                height: screenHeight * 0.134,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16)),
                child: Obx(
                  () => Column(
                    children: [
                      const SizedBox(
                        height: 9,
                      ),
// icon feelings
                      GestureDetector(
                        onTap: (() {
                          sliderController.valueSlider.value < 40
                              ? Get.toNamed(AppRoutes.sadfreshmood)
                              : Get.toNamed(AppRoutes.happyfreshmood);
                          sliderController.floatingcontainer.remove();
                          sliderController.ispressed.value = false;
                          createData(sliderController.valueSlider.value);
                        }),
                        child: SizedBox(
                          width: 41.35 * pctWidth,
                          height: 41.35 * pctHeight,
                          child: Image.asset(
                            sliderController.valueSlider.value < 20
                                ? Assets.depressed
                                : sliderController.valueSlider.value < 40
                                    ? Assets.sad
                                    : sliderController.valueSlider.value < 60
                                        ? Assets.normal
                                        : sliderController.valueSlider.value <
                                                80
                                            ? Assets.fun
                                            : Assets.happy,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
// Slider
                      Slider(
                          value: sliderController.valueSlider.value.toDouble(),
                          min: 0,
                          max: 100,
                          thumbColor: Colors.white,
                          activeColor: sliderController.valueSlider.value < 20
                              ? AppColors.depressedFace
                              : sliderController.valueSlider.value < 40
                                  ? AppColors.sadFace
                                  : sliderController.valueSlider.value < 60
                                      ? AppColors.normalFace
                                      : sliderController.valueSlider.value < 80
                                          ? AppColors.smileFace
                                          : AppColors.happyFace,
                          onChanged: ((value) =>
                              sliderController.onChangeSlider(value.toInt()))),
                    ],
                  ),
                ),
              ),
            ),
// Arrow clipper
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
          ],
        ),
      ),
//floating button
      floatingActionButton: FloatingButton(
        onChange: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
// bottomNavigationBar
      bottomNavigationBar: SizedBox(
        height: screenHeight * 0.11,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(45), topRight: Radius.circular(45)),
          child: Obx(
            () => BottomNavigationBar(
              unselectedItemColor: AppColors.unselecttedIcon,
              selectedItemColor: AppColors.unselecttedIcon,
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
              currentIndex: sliderController.current.value,
              onTap: (index) {
                sliderController.changeBottomScreen(index);
                Get.toNamed(AppRoutes.home);
                sliderController.floatingcontainer.remove();
                sliderController.ispressed.value = false;
              },
            ),
          ),
        ),
      ),
    );
  }
}

// ArrowClipper
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
