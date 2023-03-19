import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/data/models/list_report_point.dart';
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
  final _mybox = Hive.box<List>('mybox');
  final _mybox2 = Hive.box<DateTime>('mybox2');
  reportPoint hiveBox = reportPoint();
  ListReportPoint hiveBoxPoint = ListReportPoint();
  @override
  void initState() {
    if (_mybox.get("point") == null || _mybox.get("weight") == null) {
      hiveBox.creatInitialList();
    } else {
      hiveBox.loadDataList();
    }
    if (_mybox2.get("checkdate") == null) {
      hiveBox.createInitialDatetime();
    } else {
      hiveBox.loadDataDatetime();
    }
    /*   if (_mybox.get("listreportpoint") == null) {
      hiveBoxPoint.createInitialize();
    } else {
      hiveBoxPoint.loadData();
    }*/
    widget.controller.fetchData();
    super.initState();
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
          future: widget.fetchAPI(),
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
              return Positioned(
                top: screenHeight * 0.043,
                left: screenWidth * 0.29,
                child: CircularPercentIndicator(
                  radius: 80,
                  lineWidth: 16.0,
                  animation: true,
                  progressColor: AppColors.mainColor,
                  percent: 0,
                ),
              );
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
                  '${reportController.avgMood}',
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
