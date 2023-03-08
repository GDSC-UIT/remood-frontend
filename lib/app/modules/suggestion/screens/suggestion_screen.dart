import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/modules/suggestion/widgets/card_article.dart';
import 'package:remood/app/modules/suggestion/widgets/list_article.dart';
import 'package:remood/app/modules/suggestion/widgets/list_card_blog.dart';
import 'package:remood/app/modules/suggestion/widgets/list_title.dart';
import 'package:remood/app/modules/suggestion/widgets/row_text.dart';
import 'package:remood/app/modules/suggestion/widgets/stack_appbar.dart';

class SuggestionScreen extends StatelessWidget {
  const SuggestionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.BackgroundColor,
      body: SafeArea(
        right: false,
        left: false,
        child: Column(
          children: [
            StackSearchBar(),
            SizedBox(
              height: _screenHeight * 0.019,
            ),
            ListTitle(),
            SizedBox(
              height: 20,
            ),
            ListArticle(),
            Spacer(),
            RowText(),
            SizedBox(
              height: 9,
            ),
            ListCardBlog(),
            SizedBox(
              height: 45,
            )
          ],
        ),
      ),
    );
  }
}
