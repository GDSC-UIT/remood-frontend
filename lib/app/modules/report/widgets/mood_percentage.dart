import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/data/models/list_report_point.dart';
import 'package:remood/app/data/models/report_point.dart';
import 'package:remood/app/modules/home/home_controller.dart';
import 'package:remood/app/modules/report/report_controller.dart';

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
  final _mybox = Hive.box('mybox');
  reportPoint hiveBox = reportPoint();
  ListReportPoint hiveBoxPoint = ListReportPoint();
  @override
  void initState() {
    if (_mybox.get("point") == null || _mybox.get("weight") == null) {
      hiveBox.creatInitialList();
    } else {
      hiveBox.loadDataList();
    }
    if (_mybox.get("checkdate") == null) {
      hiveBox.createInitialDatetime();
    } else {
      hiveBox.loadDataDatetime();
    }
    if (_mybox.get("listreportpoint") == null) {
      hiveBoxPoint.createInitialize();
    } else {
      hiveBoxPoint.loadData();
      debugPrint("\n${ListReportPoint.listReportPoint}\n");
    }
    widget.controller.fetchData(context);
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
        Positioned(
          top: screenHeight * 0.043,
          left: screenWidth * 0.29,
          child: Obx(
            () => CircularPercentIndicator(
              radius: 80,
              lineWidth: 16.0,
              animation: true,
              progressColor: AppColors.mainColor,
              percent: widget.controller.percentage.value / 100.0,
              center: Obx(
                () => Text(
                  "${widget.controller.percentage.value}%",
                  style: CustomTextStyle.customh2(const Color(0xFF8F753F), 40),
                ),
              ),
            ),
          ),
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
