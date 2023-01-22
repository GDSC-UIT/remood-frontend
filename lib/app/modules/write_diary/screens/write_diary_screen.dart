import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/modules/write_diary/widgets/stack_note.dart';
import 'package:remood/app/modules/write_diary/widgets/stack_photos.dart';
import 'package:remood/app/modules/write_diary/widgets/stack_tag.dart';
import 'package:remood/app/modules/write_diary/widgets/stack_topic.dart';

class WriteDiaryScreen extends StatelessWidget {
  final ValueNotifier<int> currentIndex = ValueNotifier(0);
  WriteDiaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.backgroundColor,
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              SizedBox(
                height: screenHeight * 0.0542,
              ),
              Container(
                child: ListTile(
                  leading: SizedBox(width: screenWidth * 0.053),
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
                    icon: const Icon(Icons.close),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeight * 0.04,
              ),
              const StackTopic(),
              SizedBox(
                height: screenHeight * 0.043,
              ),
              StackTag(currentIndex: currentIndex),
              SizedBox(
                height: screenHeight * 0.043,
              ),
              const StackPhotos(),
              SizedBox(
                height: screenHeight * 0.043,
              ),
              const StackNote(),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              SizedBox(
                width: screenWidth * 0.88,
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                    log(currentIndex.value.toString());
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
