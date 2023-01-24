import 'dart:developer';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ReportController extends GetxController {
  DateTime now = DateTime.now();
  RxString date = DateFormat('dd/MM/yyyy').format(DateTime.now()).obs;

  RxString previousDate() {
    now = now.subtract(const Duration(days: 1));
    date(DateFormat('dd/MM/yyyy').format(now));
    log('previous date: $date & $now');
    return date;
  }

  RxString nextDate() {
    now = now.add(const Duration(days: 1));
    date(DateFormat('dd/MM/yyyy').format(now));
    log('next date: $date & $now');
    return date;
  }
}
