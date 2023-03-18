import 'dart:developer';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:remood/app/data/models/report_point.dart';

class ReportController extends GetxController {
  // The current date
  DateTime now = DateTime.now();

  // The current date is formated
  RxString date = DateFormat('dd/MM/yyyy').format(DateTime.now()).obs;

  // The mood percentage
  RxInt percentage = 0.obs;

  // The average mood
  RxString avgMood = "0".obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  // Simulate the process of fetching data
  void fetchData() async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    num t = 0;
    num m = 0;
    if (reportPoint.point.length == 0) {
      percentage.value = 0;
    } else {
      for (int i = 0; i < reportPoint.point.length; i++) {
        t = t + reportPoint.point[i] * reportPoint.weight[i];
        m = m + reportPoint.weight[i];
      }
      percentage.value = (t / m).round();
    }
    avgMood.value = "Happy";
  }

  // Previous date
  RxString previousDate() {
    now = now.subtract(const Duration(days: 1));
    date(DateFormat('dd/MM/yyyy').format(now));
    log('previous date: $date & $now');
    return date;
  }

  // Next date
  RxString nextDate() {
    now = now.add(const Duration(days: 1));
    date(DateFormat('dd/MM/yyyy').format(now));
    log('next date: $date & $now');
    return date;
  }
}
