import 'package:hive/hive.dart';
import 'package:remood/app/data/models/diary.dart';
import 'package:get/get.dart';

class PinnedDiary {
  static RxList<Diary> listPinnedDiary = <Diary>[].obs;
  final _mybox = Hive.box<List>('mybox');
  void createInitialData() {
    listPinnedDiary = <Diary>[].obs;
  }

  void loadData() {
    listPinnedDiary = _mybox.get("pinneddiary")!.cast<Diary>().obs;
  }

  void updateDatabase() {
    _mybox.put("pinneddiary", listPinnedDiary);
  }
}
