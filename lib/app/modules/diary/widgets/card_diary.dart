import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:remood/app/data/models/diary.dart';
import 'package:intl/intl.dart';

class DiaryCard extends StatelessWidget {
  Diary positiveDiary;
  DiaryCard({super.key, required this.positiveDiary});

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: _screenWidth * 0.723,
      height: _screenHeight * 0.167,
      decoration: BoxDecoration(
        color: positiveDiary.diaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  positiveDiary.icon,
                  color: positiveDiary.diaryColor.withOpacity(1),
                ),
                Text(DateFormat('dd/MM/yyyy').format(positiveDiary.date)),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
                child: SingleChildScrollView(child: Text(positiveDiary.diary))),
          ],
        ),
      ),
    );
  }
}
