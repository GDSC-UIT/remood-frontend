import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/data/models/list_report_point.dart';
import 'package:remood/app/modules/report/report_controller.dart';
import 'package:remood/app/modules/report/widgets/button.dart';
import 'package:remood/app/modules/report/widgets/container_info.dart';
import 'package:remood/app/modules/report/widgets/mood_percentage.dart';
import 'package:http/http.dart' as http;

import 'package:remood/app/modules/report/widgets/show_date.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ReportController());
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    final _mybox = Hive.box<List>('mybox');
    ListReportPoint hiveBox = ListReportPoint();
    @override
    void initState() {
      if (_mybox.get("listreportpoint") == null) {
        hiveBox.createInitialize();
      } else {
        hiveBox.loadData();
      }
      super.initState();
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
