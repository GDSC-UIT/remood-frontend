import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/data/models/list_pinned_diary.dart';
import 'package:remood/app/data/services/media_query_service.dart';
import 'package:remood/app/global_widgets/card_diary.dart';
import 'package:remood/app/routes/app_routes.dart';

class PinnedDiariesScreen extends StatelessWidget {
  const PinnedDiariesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    String appBarTitle = "Pinned diaries";
    return Scaffold(
      backgroundColor: AppColors.backgroundPage,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 24),
                  child: GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.home);
                    },
                    child: Container(
                      height: 46,
                      width: 46,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 1.0,
                              offset: Offset(1, 1),
                            )
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 5),
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 17,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 28.0),
                  alignment: Alignment.topCenter,
                  child: Text(
                    appBarTitle,
                    style: CustomTextStyle.h2(Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: _screenHeight * 0.037,
            ),
            Expanded(
              child: Obx(
                () => ListView.separated(
                    padding: EdgeInsets.symmetric(
                        horizontal: 31 * MediaQueryService().pctWidth(context)),
                    itemBuilder: ((context, index) =>
                        DiaryCard(diary: PinnedDiary.listPinnedDiary[index])),
                    separatorBuilder: (context, index) => SizedBox(
                          height: _screenHeight * 0.0197,
                        ),
                    itemCount: PinnedDiary.listPinnedDiary.length),
              ),
            )
          ],
        ),
      ),
    );
  }
}
