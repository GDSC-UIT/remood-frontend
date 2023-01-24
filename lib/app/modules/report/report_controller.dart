import 'dart:developer';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
    super.onInit();
    fetchData();
  }

  // Simulate the process of fetching data
  void fetchData() async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    percentage.value = 60;
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
