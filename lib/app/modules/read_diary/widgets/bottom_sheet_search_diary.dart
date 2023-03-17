import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/modules/read_diary/read_diary_controller.dart';

class SheetSearchDiary extends StatelessWidget {
  const SheetSearchDiary({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    ReadDiaryController searchDiary = Get.find();
    return Container(
      height: screenHeight * 0.82,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
// "Diary"
          Padding(
            padding: EdgeInsets.only(
              top: screenHeight * 0.039,
              left: screenWidth * 0.064,
            ),
            child: const Text(
              "Diary",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
// Textfield search
          Center(
            child: SizedBox(
              width: screenWidth * 0.872,
              child: TextField(
                onChanged: (value) => searchDiary.searchTitleDiary(value),
                controller: searchDiary.searchController,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: AppColors.greyscale,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                    prefixIcon: const Icon(Icons.search),
                    hintText: "Search your Diary topic"),
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
          const SizedBox(
            height: 24,
          ),
// underline
          Container(
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColors.greyscale),
              ),
            ),
          ),
// done button
          SizedBox(
            height: screenHeight * 0.55,
          ),
// done button
          Center(
            child: SizedBox(
              width: screenWidth * 0.88,
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
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
          ),
        ],
      ),
    );
  }
}
