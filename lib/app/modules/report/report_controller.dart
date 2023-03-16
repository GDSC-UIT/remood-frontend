import 'dart:developer';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:remood/app/data/models/report_point.dart';
import 'package:http/http.dart' as http;
import 'package:remood/app/modules/home/home_controller.dart';

class ReportController extends GetxController {
  // The current date
  DateTime now = DateTime.now();

  // The current date is formated
  RxString date = DateFormat('dd/MM/yyyy').format(DateTime.now()).obs;

  // The mood percentage
  RxInt percentage = 0.obs;

  // The average mood
  RxString avgMood = "".obs;

  // Show that report fetch API successfully or not
  RxBool isResponse200 = true.obs;

  @override
  Future<void> onInit() async {
    await fetchApi();
    super.onInit();
  }

  Future<reportPoint> fetchApi() async {
    int timeStamp = (DateTime.now().millisecondsSinceEpoch) ~/ 1000;

    var response = await http.get(
        Uri.parse(
            'https://remood-backend.onrender.com/api/day-reviews/day?day=$timeStamp'),
        headers: {'Authorization': 'Bearer ${HomeController().token.value}'});
    if (response.statusCode == 200) {
      // Save response's status
      isResponse200(true);
      log(timeStamp.toString());
      log(response.body);

      // Save percentate into controller
      percentage(reportPoint
          .fromJson(jsonDecode(response.body))
          .data!
          .dayReview!
          .point!
          .toInt());

      // Save average mood text base on percentage
      if (percentage.value < 20) {
        avgMood("Depressed");
      } else if (percentage.value < 40) {
        avgMood("Sad");
      } else if (percentage.value < 60) {
        avgMood("Normal");
      } else if (percentage.value < 80) {
        avgMood("Happy");
      } else if (percentage.value <= 100) {
        avgMood("Very happy");
      }

      log(percentage.value.toString());
      return reportPoint.fromJson(jsonDecode(response.body));
    } else {
      // Save response's status
      isResponse200(false);
      throw Exception('Failed to load point');
    }
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
