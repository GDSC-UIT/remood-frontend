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
    int flag = 0;
    for (int i = 0; i < ListReportPoint.listReportPoint.length; i++) {
      if (ListReportPoint.listReportPoint[i].date!.day == now.day &&
          ListReportPoint.listReportPoint[i].date!.month == now.month &&
          ListReportPoint.listReportPoint[i].date!.year == now.year) {
        ListReportPoint.listReportPoint[i].percentage = percentage.value;
        hiveBoxPoint.updateDatabase();
        print(ListReportPoint.listReportPoint[i].percentage);
        flag = 1;
      }
    }
    if (flag == 0) {
      ListReportPoint.listReportPoint
          .add(reportPoint(date: DateTime.now(), percentage: percentage.value));
      hiveBoxPoint.updateDatabase();
    }
  }

  // Previous date
  RxString previousDate() {
    now = now.subtract(const Duration(days: 1));
    date(DateFormat('dd/MM/yyyy').format(now));
    int flag = 0;
    for (int i = 0; i < ListReportPoint.listReportPoint.length; i++) {
      if (ListReportPoint.listReportPoint[i].date!.day == now.day &&
          ListReportPoint.listReportPoint[i].date!.month == now.month &&
          ListReportPoint.listReportPoint[i].date!.year == now.year) {
        percentage.value = ListReportPoint.listReportPoint[i].percentage!;

        flag = 1;
        break;
      }
    }
    if (flag == 0) percentage.value = 0;

    log('previous date: $date & $now');
    return date;
  }

  // Next date
  RxString nextDate() {
    now = now.add(const Duration(days: 1));
    date(DateFormat('dd/MM/yyyy').format(now));
    int flag = 0;
    for (int i = 0; i < ListReportPoint.listReportPoint.length; i++) {
      if (ListReportPoint.listReportPoint[i].date!.day == now.day &&
          ListReportPoint.listReportPoint[i].date!.month == now.month &&
          ListReportPoint.listReportPoint[i].date!.year == now.year) {
        percentage.value = ListReportPoint.listReportPoint[i].percentage!;

        flag = 1;
        break;
      }
    }
    if (flag == 0) percentage.value = 0;
    log('next date: $date & $now');
    return date;
  }
}
