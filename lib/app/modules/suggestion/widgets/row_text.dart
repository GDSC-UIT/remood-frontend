import 'package:flutter/cupertino.dart';
import 'package:remood/app/core/values/text_style.dart';

class RowText extends StatelessWidget {
  const RowText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(
          width: 35,
        ),
        Text(
          "Blogs",
          style: CustomTextStyle.suggestionBlogsText(),
        ),
        const Spacer(),
        Text(
          "View all",
          style: CustomTextStyle.suggestionViewAllText(),
        ),
        const SizedBox(
          width: 11,
        ),
      ],
    );
  }
}
