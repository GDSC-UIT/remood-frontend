import 'dart:developer';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ReportController extends GetxController {
  DateTime now = DateTime.now();
  RxString date = DateFormat('dd/MM/yyyy').format(DateTime.now()).obs;

  RxString formatDate(DateTime date) =>
      DateFormat('dd/MM/yyyy').format(date).obs;

  RxString nextDate(ReportController reportController) {
    now = now.add(const Duration(days: 1));
    date = reportController.formatDate(now);
    return reportController.formatDate(now);
  }
}
