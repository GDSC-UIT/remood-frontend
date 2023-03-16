import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/modules/write_diary/diary_controller.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class StackPhotos extends StatefulWidget {
  const StackPhotos({super.key});

  @override
  State<StackPhotos> createState() => _StackPhotosState();
}

class _StackPhotosState extends State<StackPhotos> {
  DiaryController photoController = Get.find();
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() {
        photoController.image = imageTemporary;
      });
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: screenWidth * 0.731,
          height: screenHeight * 0.174,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.primary)),
          child: Center(
            child: GestureDetector(
              onTap: () {
                //select photos
                pickImage();
                // Get.defaultDialog(
                //   content: Text(
                //       "width: ${(_screenWidth * 0.413)} \n height: ${_screenHeight * 0.124}"),
                // );
              },
              child: Container(
                width: screenWidth * 0.413,
                height: screenHeight * 0.124,
                decoration: BoxDecoration(
                  color: AppColors.primary42,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: photoController.image != null
                    ? Image.file(
                        photoController.image!,
                        width: 151,
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.camera_alt,
                            color: AppColors.darkgrey,
                          ),
                          Text(
                            'Select photos',
                            style: TextStyle(
                                fontSize: 10, color: AppColors.darkgrey),
                          )
                        ],
                      ),
              ),
            ),
          ),
        ),
// 'Photos' Tag
        Positioned(
          top: -30,
          left: -26,
          child: Container(
            width: screenWidth * 0.224,
            height: screenHeight * 0.061,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.primary),
            ),
            child: const Center(
                child: Text(
              'Photos',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                  fontSize: 18),
            )),
          ),
        ),
      ],
    );
  }
}
