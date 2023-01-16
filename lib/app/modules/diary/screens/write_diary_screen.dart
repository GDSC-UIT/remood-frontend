import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/modules/diary/widgets/stack_note.dart';
import 'package:remood/app/modules/diary/widgets/stack_photos.dart';
import 'package:remood/app/modules/diary/widgets/stack_tag.dart';
import 'package:remood/app/modules/diary/widgets/stack_topic.dart';

class WriteDiaryScreen extends StatelessWidget {
  const WriteDiaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: AppColors.BackgroundColor,
        body: Column(
          children: [
            SizedBox(
              height: _screenHeight * 0.0542,
            ),
            Container(
              child: ListTile(
                leading: SizedBox(width: _screenWidth * 0.053),
                title: const Center(
                    child: Text(
                  'DateTime',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                )),
                trailing: IconButton(
                  onPressed: () {
                    // return homepage
                    Get.back();
                  },
                  icon: const Icon(Icons.exit_to_app),
                ),
              ),
            ),
            SizedBox(
              height: _screenHeight * 0.04,
            ),
            const StackTopic(),
            SizedBox(
              height: _screenHeight * 0.043,
            ),
            const StackTag(),
            SizedBox(
              height: _screenHeight * 0.043,
            ),
            const StackPhotos(),
            SizedBox(
              height: _screenHeight * 0.043,
            ),
            const StackNote(),
            SizedBox(
              height: _screenHeight * 0.02,
            ),
            SizedBox(
              width: _screenWidth * 0.88,
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(AppColors.MainColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                ),
                child: const Text('Done'),
              ),
            ),
          ],
        ));
  }
}
