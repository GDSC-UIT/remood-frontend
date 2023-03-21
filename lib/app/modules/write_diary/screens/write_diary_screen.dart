import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/modules/home/home_controller.dart';
import 'package:remood/app/modules/write_diary/diary_controller.dart';
import 'package:remood/app/modules/write_diary/widgets/stack_note.dart';
import 'package:remood/app/modules/write_diary/widgets/stack_photos.dart';
import 'package:remood/app/modules/write_diary/widgets/stack_tag.dart';
import 'package:remood/app/modules/write_diary/widgets/stack_topic.dart';
import 'package:remood/app/routes/app_routes.dart';
import 'package:intl/intl.dart';

class WriteDiaryScreen extends StatefulWidget {
  const WriteDiaryScreen({super.key});

  @override
  State<WriteDiaryScreen> createState() => _WriteDiaryScreenState();
}

class _WriteDiaryScreenState extends State<WriteDiaryScreen> {
  final ValueNotifier<int> currentIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    HomeController dateController = Get.find();
    DiaryController diaryController = Get.find();
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.backgroundPage,
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.0542,
              ),
              ListTile(
                leading: SizedBox(width: screenWidth * 0.053),
// Date
                title: Center(
                  child: Text(
                    DateFormat('dd/MM/yyyy')
                        .format(dateController.currentdate.value),
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, fontSize: 20),
                  ),
                ),
// Close button
                trailing: IconButton(
                  onPressed: () {
                    // return homepage
                    Get.toNamed(AppRoutes.home);
                  },
                  icon: const Icon(Icons.close),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.04,
              ),
// Topic list
              const StackTopic(),
              SizedBox(
                height: screenHeight * 0.043,
              ),
// Tag list
              StackTag(currentIndex: currentIndex),
              SizedBox(
                height: screenHeight * 0.043,
              ),
// Photo-upload field
              const StackPhotos(),
              SizedBox(
                height: screenHeight * 0.043,
              ),
// Note field
              const StackNote(),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              SizedBox(
                width: screenWidth * 0.88,
                child: ElevatedButton(
                  onPressed: () {
                    diaryController.addDate = dateController.currentdate.value;
                    if (diaryController.diaryNote.text.isEmpty) {
                      Get.toNamed(AppRoutes.home);
                    } else {
                      if (diaryController.image == null) {
                        diaryController.addDiary();
                      } else {
                        diaryController.addDiary();
                        diaryController.image = null;
                      }

                      Get.toNamed(AppRoutes.home);
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColors.mainColor),
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
          ),
        ));
  }
}
