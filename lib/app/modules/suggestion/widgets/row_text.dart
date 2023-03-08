import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:remood/app/core/values/text_style.dart';

class RowText extends StatelessWidget {
  const RowText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 35,
        ),
        Text(
          "Blogs",
          style: CustomTextStyle.suggestionBlogsText(),
        ),
        Spacer(),
        Text(
          "View all",
          style: CustomTextStyle.suggestionViewAllText(),
        ),
        SizedBox(
          width: 11,
        ),
      ],
    );
  }
}
