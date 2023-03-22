import 'package:flutter/cupertino.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/data/services/media_query_service.dart';

class RowText extends StatelessWidget {
  const RowText({super.key});

  @override
  Widget build(BuildContext context) {
    var pctWidth = MediaQueryService().pctWidth(context);

    return Row(
      children: [
        SizedBox(
          width: pctWidth * 35,
        ),
        Text(
          "Blogs",
          style: CustomTextStyle.suggestionBlogsText(),
        ),
        const Spacer(),
        // Text(
        //   "View all",
        //   style: CustomTextStyle.suggestionViewAllText(),
        // ),
        SizedBox(
          width: pctWidth * 11,
        ),
      ],
    );
  }
}
