import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:remood/app/data/models/register_email.dart';

class LogInController extends GetxController {
  final _mybox = Hive.box<List>('mybox');
  RegisterEmail hiveboxRegisterEmail = RegisterEmail();
  @override
  void onInit() {
    if (_mybox.get("registerEmail") == null) {
      hiveboxRegisterEmail.createInitialData();
    } else {
      hiveboxRegisterEmail.loadData();
    }
    super.onInit();
  }
}
