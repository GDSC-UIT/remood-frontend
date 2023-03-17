import 'package:flutter/material.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/text_style.dart';
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
    return Scaffold(
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
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35),
              child: Text(
                "Top Blogs",
                style: CustomTextStyle.suggestionBlogsText(),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const ListArticle(),
            const Spacer(),
            const RowText(),
            const SizedBox(
              height: 9,
            ),
            const ListCardBlog(),
            const SizedBox(
              height: 35,
            )
          ],
        ),
      ),
    );
  }
}
