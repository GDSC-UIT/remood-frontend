import 'package:flutter/cupertino.dart';

class SettingButton {
  /// icons can be
  /// a String (Setting button icon)
  /// or a CardTopic (a topic card icon)
  final icon;
  String title;
  String? screen;
  SettingButton(
      {required this.icon, required this.title, required this.screen});
}
