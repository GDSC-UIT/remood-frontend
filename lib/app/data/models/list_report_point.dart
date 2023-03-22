import 'package:hive/hive.dart';

class ListReportPoint {
  static List listReportPoint = [];
  final _mybox = Hive.box('mybox');
  void createInitialize() {
    listReportPoint = [];
  }

  void loadData() {
    listReportPoint = _mybox.get("listreportpoint")!;
  }

  void updateDatabase() {
    _mybox.put("listreportpoint", listReportPoint);
  }
}
