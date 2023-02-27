import 'package:hive/hive.dart';
import 'package:remood/app/data/models/diary.dart';

class PinnedDiary {
  static List<Diary> listPinnedDiary = [];
  final _mybox = Hive.box<List>('mybox');
  void loadData() {
    listPinnedDiary = _mybox.get("pinneddiary")!.cast<Diary>();
  }

  void updateDatabase() {
    _mybox.put("pinneddiary", listPinnedDiary);
  }
}
