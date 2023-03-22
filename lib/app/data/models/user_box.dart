import 'package:hive/hive.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/data/models/user.dart';

class UserBox {
  static User user = User(
    name: "Untitled",
    avtURL: Assets.settingUserAvt1,
  );

  final _mybox = Hive.box<User>('user');
  void createInitialData() {
    user = User(
      name: "cute pie",
      avtURL: Assets.settingUserAvt1,
    );
  }

  void loadData() {
    user = _mybox.get("user")!;
  }

  void updateDatabase() {
    _mybox.put("user", user);
  }
}
