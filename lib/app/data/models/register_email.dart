import 'package:hive/hive.dart';

class RegisterEmail {
  static List<String> registerEmail = [];
  final _mybox = Hive.box('mybox');
  void createInitialData() {
    registerEmail = [
      "duong@gmail.com",
    ];
  }

  void loadData() {
    registerEmail = _mybox.get("registerEmail")!;
  }

  void updateDatabase() {
    _mybox.put("registerEmail", registerEmail);
  }
}
