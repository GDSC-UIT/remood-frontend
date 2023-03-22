import 'dart:developer';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:remood/app/data/models/list_report_point.dart';
import 'package:remood/app/data/models/report_point.dart';

class ReportController extends GetxController {
  reportPoint hiveBox = reportPoint();
  ListReportPoint hiveBoxPoint = ListReportPoint();
  // The current date
  DateTime now = DateTime.now();

  // The current date is formated
  RxString date = DateFormat('dd/MM/yyyy').format(DateTime.now()).obs;
  // The mood percentage
  RxInt percentage = 0.obs;
  int percent = 0;
  // The average mood
  RxString avgMood = "".obs;
  String get getAvgMood => percentage.value < 20
      ? "Despressed"
      : percentage.value < 40
          ? "Sad"
          : percentage.value < 60
              ? "Normal"
              : percentage.value < 80
                  ? "Happy"
                  : percentage.value <= 100
                      ? "Verry happy"
                      : "Undefined";

  // Show that report fetch API successfully or not
  RxBool isResponse200 = true.obs;

  // Simulate the process of fetching data
  void fetchData(context) async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    bool isToday = reportPoint.checkDate.day == DateTime.now().day &&
        reportPoint.checkDate.month == DateTime.now().month &&
        reportPoint.checkDate.year == DateTime.now().year;

    if (!isToday) {
      reportPoint.point.clear();
      reportPoint.weight.clear();
      reportPoint.checkDate = DateTime.now();
      hiveBox.updateDatabaseDatetime();
      hiveBox.updateDatabaseList();
      print(reportPoint.checkDate);
    }
    num t = 0;
    num m = 0;
    if (reportPoint.point.isEmpty) {
      percentage.value = 0;
    } else {
      for (int i = 0; i < reportPoint.point.length; i++) {
        t = t + reportPoint.point[i] * reportPoint.weight[i];
        m = m + reportPoint.weight[i];
      }
      percent = (t / m).round();
    }

    // Set average mood text

    int flag = 0;
    for (int i = 0; i < ListReportPoint.listReportPoint.length; i++) {
      if (ListReportPoint.listReportPoint[i][0].day == DateTime.now().day &&
          ListReportPoint.listReportPoint[i][0].month == DateTime.now().month &&
          ListReportPoint.listReportPoint[i][0].year == DateTime.now().year) {
        ListReportPoint.listReportPoint[i][1] = percent;
        hiveBoxPoint.updateDatabase();
        print(ListReportPoint.listReportPoint[i][1]);
        flag = 1;
      }
    }
    if (flag == 0) {
      ListReportPoint.listReportPoint.add([DateTime.now(), percent]);
      print(ListReportPoint.listReportPoint);
      hiveBoxPoint.updateDatabase();
    }
    if (DateTime.now().day == now.day &&
        DateTime.now().month == now.month &&
        DateTime.now().year == now.year) {
      percentage.value = percent;
    }
    avgMood(getAvgMood);
  }

  // Previous date
  RxString previousDate() {
    now = now.subtract(const Duration(days: 1));
    date(DateFormat('dd/MM/yyyy').format(now));
    int flag = 0;
    for (int i = 0; i < ListReportPoint.listReportPoint.length; i++) {
      if (ListReportPoint.listReportPoint[i][0].day == now.day &&
          ListReportPoint.listReportPoint[i][0].month == now.month &&
          ListReportPoint.listReportPoint[i][0].year == now.year) {
        percentage.value = ListReportPoint.listReportPoint[i][1];

        flag = 1;
        break;
      }
    }
    if (flag == 0) percentage.value = 0;
    avgMood(getAvgMood);
    log('previous date: $date & $now');
    return date;
  }

  // Next date
  RxString nextDate() {
    now = now.add(const Duration(days: 1));
    date(DateFormat('dd/MM/yyyy').format(now));
    int flag = 0;
    for (int i = 0; i < ListReportPoint.listReportPoint.length; i++) {
      if (ListReportPoint.listReportPoint[i][0].day == now.day &&
          ListReportPoint.listReportPoint[i][0].month == now.month &&
          ListReportPoint.listReportPoint[i][0].year == now.year) {
        percentage.value = ListReportPoint.listReportPoint[i][1];

        flag = 1;
        break;
      }
    }
    if (flag == 0) percentage.value = 0;
    avgMood(getAvgMood);
    log('next date: $date & $now');
    return date;
  }
}
