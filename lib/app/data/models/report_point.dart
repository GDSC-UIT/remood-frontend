import 'package:hive/hive.dart';

class reportPoint {
  static List<int> point = [];
  static List<num> weight = [];
  static DateTime checkDate = DateTime.utc(1, 1, 1970);
  static void caculateFeeling(int value) {
    num s = 0.0036 * value * value - 0.36 * value + 10;
    weight.add(s);
    print(point.length);
    print(weight.length);
  }

  final _mybox = Hive.box<List>('mybox');
  final _mybox2 = Hive.box<DateTime>('mybox2');
  void creatInitialList() {
    point = [];
    weight = [];
  }

  void createInitialDatetime() {
    checkDate = DateTime.utc(1, 1, 1970);
  }

  void loadDataList() {
    point = _mybox.get("point")!.cast<int>();
    weight = _mybox.get("weight")!.cast<num>();
  }

  void loadDataDatetime() {
    checkDate = _mybox2.get("checkdate")!;
  }

  void updateDatabaseList() {
    _mybox.put("point", point);
    _mybox.put("weight", weight);
  }

  void updateDatabaseDatetime() {
    _mybox2.put("checkdate", checkDate);
  }
}
