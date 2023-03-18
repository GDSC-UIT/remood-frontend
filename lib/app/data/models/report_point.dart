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

  static void CheckDate(DateTime date) {
    if (date != checkDate) {}
  }
}
