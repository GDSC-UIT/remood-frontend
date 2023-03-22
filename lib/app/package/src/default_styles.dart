import 'package:flutter/material.dart';

const TextStyle defaultHeaderTextStyle = TextStyle(
  fontSize: 20.0,
  color: Colors.blue,
);
const TextStyle defaultPrevDaysTextStyle = TextStyle(
  color: Colors.grey,
  fontSize: 14.0,
);
const TextStyle defaultNextDaysTextStyle = TextStyle(
  color: Colors.grey,
  fontSize: 14.0,
);
const TextStyle defaultDaysTextStyle = TextStyle(
  color: Colors.black,
  fontSize: 14.0,
);
const TextStyle defaultTodayTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 14.0,
);
const TextStyle defaultSelectedDayTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 14.0,
);
const TextStyle defaultWeekdayTextStyle = TextStyle(
  color: Colors.deepOrange,
  fontSize: 14.0,
);
const TextStyle defaultWeekendTextStyle = TextStyle(
  color: Colors.pinkAccent,
  fontSize: 14.0,
);
const TextStyle defaultInactiveDaysTextStyle = TextStyle(
  color: Colors.black38,
  fontSize: 14.0,
);
final TextStyle defaultInactiveWeekendTextStyle = TextStyle(
  color: Colors.pinkAccent.withOpacity(0.6),
  fontSize: 14.0,
);
final Widget defaultMarkedDateWidget = Container(
  margin: const EdgeInsets.symmetric(horizontal: 1.0),
  color: Colors.blueAccent,
  height: 4.0,
  width: 4.0,
);
