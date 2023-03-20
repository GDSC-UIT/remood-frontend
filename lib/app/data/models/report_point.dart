import 'package:hive/hive.dart';

class reportPoint {
  static List<int> point = [];
  static List<num> weight = [];
  static DateTime checkDate = DateTime.utc(1, 1, 1970);

  int? percentage;

  DateTime? date;
  reportPoint({this.date, this.percentage});

  static void caculateFeeling(int value) {
    num s = 0.0036 * value * value - 0.36 * value + 10;
    weight.add(s);
    print(point.length);
    print(weight.length);
  }

  final _mybox = Hive.box('mybox');
  void creatInitialList() {
    point = [];
    weight = [];
  }

  void createInitialDatetime() {
    checkDate = DateTime.utc(1, 1, 1970);
  }

  void loadDataList() {
    point = _mybox.get("point")!;
    weight = _mybox.get("weight")!.cast<num>();
  }

  void loadDataDatetime() {
    checkDate = _mybox.get("checkdate")!;
  }

  void updateDatabaseList() {
    _mybox.put("point", point);
    _mybox.put("weight", weight);
  }

  void updateDatabaseDatetime() {
    _mybox.put("checkdate", checkDate);
  }
}
