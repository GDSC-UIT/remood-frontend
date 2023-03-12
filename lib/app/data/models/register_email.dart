import 'package:hive/hive.dart';

class RegisterEmail {
  static List<String> registerEmail = [];
  final _mybox = Hive.box<List>('mybox');
  void createInitialData() {
    registerEmail = [
      "duong@gmail.com",
    ];
  }

  void loadData() {
    registerEmail = _mybox.get("registerEmail")!.cast<String>();
  }

  void updateDatabase() {
    _mybox.put("registerEmail", registerEmail);
  }
}
