import 'package:flutter/material.dart';
import 'package:remood/app/data/models/diary.dart';
import 'package:intl/intl.dart';

class DiaryCard extends StatelessWidget {
  Diary diary;
  DiaryCard({super.key, required this.diary});

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: _screenWidth * 0.723,
      height: _screenHeight * 0.167,
      decoration: BoxDecoration(
        color: Color(diary.diaryColor),
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
                  IconData(
                    diary.icon,
                    fontFamily: 'MaterialIcons',
                  ),
                  color: Color(diary.diaryColor).withOpacity(1),
                ),
                const SizedBox(
                  width: 7,
                ),
                Text(DateFormat('dd/MM/yyyy').format(diary.date),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    )),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(child: SingleChildScrollView(child: Text(diary.diary))),
          ],
        ),
      ),
    );
  }
}