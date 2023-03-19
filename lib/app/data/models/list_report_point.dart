import 'package:hive/hive.dart';
import 'package:remood/app/data/models/report_point.dart';

class ListReportPoint {
  static List<reportPoint> listReportPoint = [];
  final _mybox = Hive.box<List>('mybox');
  void createInitialize() {
    listReportPoint = [];
  }

  void loadData() {
    listReportPoint = _mybox.get("listreportpoint")!.cast<reportPoint>();
  }

  void updateDatabase() {
    _mybox.put("listreportpoint", listReportPoint);
  }
}
