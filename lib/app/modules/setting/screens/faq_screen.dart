import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/data/models/faq.dart';
import 'package:remood/app/modules/setting/widgets/stack_setting_appbar.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String appBarTitle = "FAQ";
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double px24h = screenHeight * 0.0295;
    double px24w = screenWidth * 0.064;
    double px16h = screenHeight * 0.0197;

    // FAQs data
    List<FAQ> faqList = [
      FAQ(
          question: "Security",
          answer:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris interdum sapien sodales mi sagittis hendrerit. Curabitur ut lectus nec orci cursus rhoncus. ",
          isRead: false.obs),
      FAQ(
          question: "Security",
          answer:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris interdum sapien sodales mi sagittis hendrerit. Curabitur ut lectus nec orci cursus rhoncus. ",
          isRead: false.obs),
      FAQ(
          question: "Security",
          answer:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris interdum sapien sodales mi sagittis hendrerit. Curabitur ut lectus nec orci cursus rhoncus. ",
          isRead: false.obs),
      FAQ(
          question: "Security",
          answer:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris interdum sapien sodales mi sagittis hendrerit. Curabitur ut lectus nec orci cursus rhoncus. ",
          isRead: false.obs),
      FAQ(
          question: "Security",
          answer:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris interdum sapien sodales mi sagittis hendrerit. Curabitur ut lectus nec orci cursus rhoncus. ",
          isRead: false.obs),
    ];

    // Show/hide the FAQ answer
    void showAnswer(int index) {
      faqList[index].isRead(!faqList[index].isRead.value);
      log("$index: ${faqList[index].isRead}");
    }

    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      body: SafeArea(
        child: Column(
          children: [
            StackSettingAppbar(
              title: appBarTitle,
            ),

// FAQs
            Column(
              children: List.generate(
                faqList.length,
                (index) {
                  return Obx(
                    () => Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.064),
                      child: Column(
                        children: [
// Question
                          GestureDetector(
                            onTap: () => showAnswer(index),
                            behavior: HitTestBehavior.opaque,
                            child: Container(
                              padding:
                                  EdgeInsets.fromLTRB(px24w, px24h, px24w, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Label
                                  Text(
                                    faqList[index].question,
                                    style: CustomTextStyle.h3(
                                      Colors.black,
                                    ).copyWith(fontSize: 14),
                                  ),

                                  // Arrow-right icon
                                  !faqList[index].isRead.value
                                      ? const Icon(Icons.keyboard_arrow_down)
                                      : const Icon(Icons.keyboard_arrow_up),
                                ],
                              ),
                            ),
                          ),

// Ansqer
                          faqList[index].isRead.value
                              ? Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: px24w,
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: px16h,
                                      ),
                                      Text(
                                        faqList[index].answer,
                                        style: CustomTextStyle.normalText(
                                            AppColors.settingFaqAnswer),
                                      ),
                                    ],
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
