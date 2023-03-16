import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/data/models/report_controller.dart';
import 'package:remood/app/data/models/report_point.dart';
import 'package:remood/app/modules/home/home_controller.dart';
import 'package:remood/app/modules/report/report_controller.dart';
import 'package:remood/app/modules/report/widgets/button.dart';
import 'package:remood/app/modules/report/widgets/container_info.dart';
import 'package:remood/app/modules/report/widgets/mood_percentage.dart';
import 'package:http/http.dart' as http;

import 'package:remood/app/modules/report/widgets/show_date.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ReportController controller = Get.find();
    HomeController tokenController = Get.find();
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    ReportController reportController = Get.find();

    Future<reportPoint> fetchApi() async {
      int timeStamp = (DateTime.now().millisecondsSinceEpoch) ~/ 1000;

      var response = await http.get(
          Uri.parse(
              'https://remood-backend.onrender.com/api/day-reviews/day?day=$timeStamp'),
          headers: {'Authorization': 'Bearer ${tokenController.token.value}'});
      if (response.statusCode == 200) {
        // Save response's status
        reportController.isResponse200(true);
        log(timeStamp.toString());
        log(response.body);

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
        // Save response's status
        reportController.isResponse200(false);
        throw Exception('Failed to load point');
      }
    }

    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            FutureBuilder(
              future: fetchApi(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const ContainerInfo();
                }
                return Column(
                  children: [
                    // Heading
                    Text(
                      "Report",
                      style: CustomTextStyle.reportHeading(),
                    ),

                    // The date show data
                    ShowDate(controller: controller),
                  ],
                );
              },
            ),
            SizedBox(
              height: screenHeight * 0.09,
            ),

            // Mood percentage of the day
            MoodPercentage(
              fetchAPI: fetchApi,
            ),

            SizedBox(
              height: screenHeight * 0.145,
            ),
            const Button(),
          ],
        ),
      ),
    );
  }
}
