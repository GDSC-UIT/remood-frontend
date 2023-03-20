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
          question: "How do I use Freshmood feature? ",
          answer:
              "To use this feature, you can drag the mood bar, then click on the small icon to navigate to the next page",
          isRead: false.obs),
      FAQ(
          question: "I’m not getting my reminder\nnotifications",
          answer:
              "If you choose ‘do not allow’ during the initial notification setting, your reminders may fail to deliver. Please go to [Settings > Notification > Remood] on your phone settings and allow access.",
          isRead: false.obs),
      FAQ(
          question: "Other",
          answer:
              "If you could not find the answer to your question, please send an email to [thuyhienphanthi2004@gmail.com]. We'll do our best to respond to your message as soon as possible.",
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
            const SizedBox(height: 13),
// FAQs
            Expanded(
              child: ListView(
                children: List.generate(
                  faqList.length,
                  (index) {
                    return Obx(
                      () => Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.064, vertical: 5),
                        child: Column(
                          children: [
                            // Question
                            GestureDetector(
                              onTap: () => showAnswer(index),
                              behavior: HitTestBehavior.opaque,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: AppColors.faqAnswer,
                                    borderRadius: faqList[index].isRead.value
                                        ? const BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          )
                                        : BorderRadius.circular(10)),
                                // padding:
                                //     EdgeInsets.fromLTRB(px24w, px24h, px24w, 0),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 11),
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
                                          ? const Icon(
                                              Icons.keyboard_arrow_down)
                                          : const Icon(Icons.keyboard_arrow_up),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            // Ansqer
                            faqList[index].isRead.value
                                ? Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 11,
                                    ),
                                    decoration: const BoxDecoration(
                                        color: AppColors.faqAnswer,
                                        borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10))),
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 15),
                                      child: Text(
                                        faqList[index].answer,
                                        style: CustomTextStyle.normalText(
                                            AppColors.settingFaqAnswer),
                                      ),
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
            ),
          ],
        ),
      ),
    );
  }
}
