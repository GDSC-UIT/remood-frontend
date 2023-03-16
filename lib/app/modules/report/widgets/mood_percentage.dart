import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
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
  ReportController reportController = Get.find();

  Future<reportPoint> fetchApi() async {
    int timeStamp = (DateTime.now().millisecondsSinceEpoch) ~/ 1000;

    var response = await http.get(
        Uri.parse(
            'https://remood-backend.onrender.com/api/day-reviews/day?day=$timeStamp'),
        headers: {'Authorization': 'Bearer ${tokenController.token.value}'});
    if (response.statusCode == 200) {
      print(timeStamp);
      print(response.body);

      // Save percentate into controller
      reportController.percentage(reportPoint
          .fromJson(jsonDecode(response.body))
          .data!
          .dayReview!
          .point!
          .toInt());

      // Save average mood text base on percentage
      if (reportController.percentage.value < 20) {
        reportController.avgMood("Depressed");
      } else if (reportController.percentage.value < 40) {
        reportController.avgMood("Sad");
      } else if (reportController.percentage.value < 60) {
        reportController.avgMood("Normal");
      } else if (reportController.percentage.value < 80) {
        reportController.avgMood("Happy");
      } else if (reportController.percentage.value <= 100) {
        reportController.avgMood("Very happy");
      }

      log(reportController.percentage.value.toString());
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

        /// Average mood percentage
        FutureBuilder(
          future: fetchApi(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Positioned(
                top: screenHeight * 0.043,
                left: screenWidth * 0.29,
                child: CircularPercentIndicator(
                  radius: 80,
                  lineWidth: 16.0,
                  animation: true,
                  progressColor: AppColors.mainColor,
                  percent: reportController.percentage.value / 100.0,
                  center: Text(
                    "${reportController.percentage.value}%",
                    style:
                        CustomTextStyle.customh2(const Color(0xFF8F753F), 40),
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              // return Text("${snapshot.error}");
              return const SizedBox();
            }
            return Positioned(
              top: screenHeight * 0.11,
              left: screenWidth * 0.43,
              child: const SpinKitFadingCircle(
                color: AppColors.mainColor,
                size: 50.0,
              ),
            );
          },
        ),

        /// Mood average text
        Positioned(
          bottom: 7,
          width: screenWidth,
          // left: screenWidth * 0.323,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Obx(
                () => Text(
                  '${widget.controller.avgMood}',
                  style: CustomTextStyle.textReport(),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
