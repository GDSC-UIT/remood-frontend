import 'package:flutter/material.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/data/services/media_query_service.dart';
import 'package:remood/app/modules/suggestion/widgets/list_article.dart';
import 'package:remood/app/modules/suggestion/widgets/list_card_blog.dart';
import 'package:remood/app/modules/suggestion/widgets/list_title.dart';
import 'package:remood/app/modules/suggestion/widgets/row_text.dart';
import 'package:remood/app/modules/suggestion/widgets/stack_appbar.dart';

class SuggestionScreen extends StatelessWidget {
  const SuggestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    var pctWidth = MediaQueryService().pctWidth(context);
    var pctHeight = MediaQueryService().pctHeight(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        right: false,
        left: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const StackSearchBar(),
            SizedBox(
              height: screenHeight * 0.019,
            ),
            const ListTitle(),
            SizedBox(
              height: pctHeight * 16,
            ),
            Padding(
              padding: EdgeInsets.only(left: pctWidth * 35),
              child: Text(
                "Top Blogs",
                style: CustomTextStyle.suggestionBlogsText(),
              ),
            ),
            SizedBox(
              height: pctHeight * 5,
            ),
            const ListArticle(),
            const Spacer(),
            const RowText(),
            SizedBox(
              height: pctHeight * 9,
            ),
            const ListCardBlog(),
            SizedBox(
              height: pctHeight * 33,
            )
          ],
        ),
      ),
    );
  }
}
