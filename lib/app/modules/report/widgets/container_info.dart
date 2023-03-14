import 'package:flutter/material.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/data/services/media_query_service.dart';

class ContainerInfo extends StatelessWidget {
  const ContainerInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var pctWidth = MediaQueryService().pctWidth(context);
    var pctHeight = MediaQueryService().pctHeight(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: pctWidth * 7.0,
        vertical: pctHeight * 4.0,
      ),
      width: pctWidth * 343,
      height: pctHeight * 79,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.check_circle,
            color: Colors.white,
          ),
          SizedBox(
            width: pctWidth * 4,
          ),
          Expanded(
            child: Text(
              "Hey there! It looks like you haven't used this feature on Remood yet. "
              "Give it a try and let us know what you think!",
              style: CustomTextStyle.normalText(Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
