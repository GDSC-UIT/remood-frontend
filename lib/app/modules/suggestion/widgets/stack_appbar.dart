import 'package:flutter/material.dart';
import 'package:remood/app/core/values/app_colors.dart';
import 'package:remood/app/core/values/assets_images.dart';
import 'package:remood/app/core/values/text_style.dart';
import 'package:remood/app/data/services/media_query_service.dart';
import 'package:remood/app/global_widgets/back_button.dart';

class StackSearchBar extends StatelessWidget {
  const StackSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    var pctWidth = MediaQueryService().pctWidth(context);
    var pctHeight = MediaQueryService().pctHeight(context);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: screenHeight * 0.303,
        ),
        Container(
          height: screenHeight * 0.255,
          decoration: const BoxDecoration(
            color: AppColors.suggestionSearchBar,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: pctHeight * 10),
            child: Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SizedBox(
                        width: screenWidth * 0.64,
                        height: screenHeight * 0.08743,
                        child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.asset(Assets.remoodSuggestion))),
                    Positioned(
                      top: -24,
                      left: screenWidth * 0.604,
                      child: SizedBox(
                          width: screenWidth * 0.29867,
                          height: screenHeight * 0.12808,
                          child: Image.asset(Assets.logo)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        const BackButtonContainer(),
        // search bar
        Positioned(
          bottom: 0,
          left: screenWidth * 0.064,
          child: Container(
            width: screenWidth * 0.872,
            height: screenHeight * 0.073,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppColors.greyscale,
                  ),
                  hintText: "Search for...",
                  hintStyle: CustomTextStyle.searchFor(),
                ),
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ),
        )
      ],
    );
  }
}
