import 'package:hive/hive.dart';
part 'user.g.dart';

@HiveType(typeId: 2)
class User {
  @HiveField(0)
  String name;

  @HiveField(1)
  String avtURL;

  User({required this.name, required this.avtURL});
}
