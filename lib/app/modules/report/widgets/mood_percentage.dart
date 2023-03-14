import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/data/models/report_point.dart';
import 'package:remood/app/modules/home/home_controller.dart';
import 'package:remood/app/modules/report/report_controller.dart';
import 'package:http/http.dart' as http;

class MoodPercentage extends StatefulWidget {
  const MoodPercentage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ReportController controller;

  @override
  State<MoodPercentage> createState() => _MoodPercentageState();
}

class _MoodPercentageState extends State<MoodPercentage> {
  HomeController tokenController = Get.find();

  Future<reportPoint> fetchApi() async {
    int timeStamp = (DateTime.now().millisecondsSinceEpoch) ~/ 1000;

    var response = await http.get(
        Uri.parse(
            'https://remood-backend.onrender.com/api/day-reviews/day?day=$timeStamp'),
        headers: {'Authorization': 'Bearer ${tokenController.token.value}'});
    if (response.statusCode == 200) {
      print(timeStamp);
      print(response.body);
      return reportPoint.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load point');
    }
  }

  @override
  Widget build(BuildContext context) {
    /// Data
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Container(
          height: screenHeight * 0.34,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(36),
              color: AppColors.reportContainer),
        ),
        Positioned(
          top: screenHeight * 0.043,
          left: screenWidth * 0.29,
          child: SizedBox(
              width: screenWidth * 0.42,
              height: screenHeight * 0.193,
              child: Image.asset(Assets.reportPercentage)),
        ),
        FutureBuilder(
            future: fetchApi(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return Positioned(
                  top: screenHeight * 0.05,
                  left: screenWidth * 0.3,
                  child: Container(
                    alignment: Alignment.center,
                    width: 151,
                    height: 146,
                    child: Text(
                      "${snapshot.data!.data!.dayReview!.point!.toInt()}%",
                      style:
                          CustomTextStyle.customh2(const Color(0xFF8F753F), 48),
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Positioned(
                  top: screenHeight * 0.11,
                  left: screenWidth * 0.43,
                  child: const SpinKitFadingCircle(
                    color: AppColors.mainColor,
                    size: 50.0,
                  ));
            })),
        Positioned(
          bottom: 7,
          left: screenWidth * 0.323,
          child: Obx(() => Text(
                '${widget.controller.avgMood}',
                style: CustomTextStyle.textReport(),
              )),
        ),
      ],
    );
  }
}
