import 'package:flutter/material.dart';

class MediaQueryService {
  double designWidth = 375;
  double designHeight = 812;

  /// Percentage of width and height
  /// of design screen and real screen
  double pctWidth(context) => MediaQuery.of(context).size.width / designWidth;
  double pctHeight(context) =>
      MediaQuery.of(context).size.height / designHeight;
}
