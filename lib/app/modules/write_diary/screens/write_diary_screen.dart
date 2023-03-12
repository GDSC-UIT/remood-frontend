import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/data/models/diary.dart';
import 'package:remood/app/data/models/list_negative_diary.dart';
import 'package:remood/app/data/models/list_positive_diary.dart';
import 'package:remood/app/global_widgets/card_diary.dart';
import 'package:remood/app/modules/home/home_binding.dart';
import 'package:remood/app/modules/home/home_controller.dart';
import 'package:remood/app/modules/write_diary/diary_controller.dart';
import 'package:remood/app/modules/write_diary/widgets/stack_note.dart';
import 'package:remood/app/modules/write_diary/widgets/stack_photos.dart';
import 'package:remood/app/modules/write_diary/widgets/stack_tag.dart';
import 'package:remood/app/modules/write_diary/widgets/stack_topic.dart';
import 'package:remood/app/routes/app_routes.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class WriteDiaryScreen extends StatefulWidget {
  WriteDiaryScreen({super.key});

  @override
  State<WriteDiaryScreen> createState() => _WriteDiaryScreenState();
}

class _WriteDiaryScreenState extends State<WriteDiaryScreen> {
  final ValueNotifier<int> currentIndex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    HomeController dateController = Get.find();
    DiaryController diaryController = Get.find();
    void createDiary() async {
      print(dateController.token);
      final response = await http.post(
        Uri.parse("https://remood-backend.onrender.com/api/diary-notes/"),
        headers: {"Authorization": "Bearer ${dateController.token.value}"},
        body: jsonEncode(<String, dynamic>{
          "tag": diaryController.current.value == 0 ? "positive" : "negative",
          "topic": diaryController.titleDiary.value.trim(),
          "content": diaryController.diaryNote.text.trim(),
          "media": [
            diaryController.image == null ? null : diaryController.image!.path
          ],
        }),
      );
      print(response.body);
      if (response.statusCode == 200)
        print("sucessfull");
      else
        print("failed");
    }

    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColors.BackgroundColor,
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              SizedBox(
                height: _screenHeight * 0.0542,
              ),
              Container(
                child: ListTile(
                  leading: SizedBox(width: _screenWidth * 0.053),
                  title: Center(
                      child: Text(
                    DateFormat('dd/MM/yyyy')
                        .format(dateController.currentdate.value),
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  )),
                  trailing: IconButton(
                    onPressed: () {
                      // return homepage
                      Get.toNamed(AppRoutes.home);
                    },
                    icon: const Icon(Icons.close),
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
              StackTag(currentIndex: currentIndex),
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
                    diaryController.addDate = dateController.currentdate.value;
                    if (diaryController.diaryNote.text.isEmpty) {
                      Get.back();
                    } else {
                      diaryController.image = null;
                      createDiary();
                      diaryController.addDiary();
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
