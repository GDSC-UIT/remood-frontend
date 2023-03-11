import 'package:flutter/material.dart';

class MediaQueryService {
  static double designWidth = 375;
  static double designHeight = 812;

  /// Percentage of width and height
  /// of design screen and real screen
  static double pctWidth(context) =>
      MediaQuery.of(context).size.width / designWidth;
  static double pctHeight(context) =>
      MediaQuery.of(context).size.height / designHeight;
}
