import 'package:hive/hive.dart';
import 'package:remood/app/data/models/diary.dart';
import 'package:get/get.dart';

class PinnedDiary {
  static List<Diary> listPinnedDiary = <Diary>[];
  final _mybox = Hive.box('mybox');
  void createInitialData() {
    listPinnedDiary = <Diary>[].obs;
  }

  void loadData() {
    listPinnedDiary = _mybox.get("pinneddiary") == null
        ? []
        : _mybox.get("pinneddiary")!.cast<Diary>();
  }

  void updateDatabase() {
    _mybox.put("pinneddiary", listPinnedDiary);
  }
}
