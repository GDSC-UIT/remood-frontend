import 'package:flutter/material.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/data/services/media_query_service.dart';

class TimeTitle extends StatelessWidget {
  const TimeTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pctWidth = MediaQueryService().pctWidth(context);
    var pctHeight = MediaQueryService().pctHeight(context);

    return Container(
      width: pctWidth * 292,
      height: pctHeight * 56,
      decoration: BoxDecoration(
        color: AppColors.onboardingBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Choose time to get notification",
              style: CustomTextStyle.h2(AppColors.textBrown)),
        ],
      ),
    );
  }
}
