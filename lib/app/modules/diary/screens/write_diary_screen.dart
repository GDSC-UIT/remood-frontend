import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/global_widgets/bottombar.dart';
import 'package:remood/app/global_widgets/floating_action_button.dart';
import 'package:remood/app/modules/diary/widgets/stack_note.dart';
import 'package:remood/app/modules/diary/widgets/stack_photos.dart';
import 'package:remood/app/modules/diary/widgets/stack_tag.dart';
import 'package:remood/app/modules/diary/widgets/stack_topic.dart';

class writeDiaryScreen extends StatelessWidget {
  const writeDiaryScreen({super.key});

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
                title: Center(
                    child: Text(
                  'DateTime',
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                )),
                trailing: IconButton(
                  onPressed: () {
                    // return homepage
                    Get.back();
                  },
                  icon: Icon(Icons.exit_to_app),
                ),
              ),
            ),
            SizedBox(
              height: _screenHeight * 0.04,
            ),
            StackTopic(),
            SizedBox(
              height: _screenHeight * 0.043,
            ),
            StackTag(),
            SizedBox(
              height: _screenHeight * 0.043,
            ),
            StackPhotos(),
            SizedBox(
              height: _screenHeight * 0.043,
            ),
            StackNote(),
            SizedBox(
              height: _screenHeight * 0.02,
            ),
            SizedBox(
              width: _screenWidth * 0.88,
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text('Done'),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(AppColors.MainColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
