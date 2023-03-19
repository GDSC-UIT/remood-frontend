import 'package:flutter/material.dart';

class MarkedDate implements MarkedDateInterface {
  final Color color;
  final int? id;
  final TextStyle? textStyle;
  final DateTime date;

  MarkedDate({
    required this.color,
    this.id,
    this.textStyle,
    required this.date,
  });

  @override
  bool operator ==(dynamic other) {
    return date == other.date &&
        color == other.color &&
        textStyle == other.textStyle &&
        id == other.id;
  }

  @override
  DateTime getDate() => date;

  @override
  int? getId() => id;

  @override
  Color getColor() => color;

  @override
  TextStyle? getTextStyle() => textStyle;

}

abstract class MarkedDateInterface {
  DateTime getDate();
  Color getColor();
  int? getId();
  TextStyle? getTextStyle();
}
