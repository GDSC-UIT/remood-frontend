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
    double _screenWidth = MediaQuery.of(context).size.width;
    double _screenHeight = MediaQuery.of(context).size.height;
    var pctHeight = MediaQueryService().pctHeight(context);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: _screenHeight * 0.303,
        ),
        Container(
          height: _screenHeight * 0.255,
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
                        width: _screenWidth * 0.64,
                        height: _screenHeight * 0.08743,
                        child: FittedBox(
                            fit: BoxFit.fill,
                            child: Image.asset(Assets.remoodSuggestion))),
                    Positioned(
                      top: pctHeight * -46,
                      left: _screenWidth * 0.584,
                      child: SizedBox(
                          width: _screenWidth * 0.432,
                          height: _screenHeight * 0.195,
                          child: Image.asset(Assets.remoodLogo)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        BackButtonContainer(),
        // search bar
        Positioned(
          bottom: 0,
          left: _screenWidth * 0.064,
          child: Container(
            width: _screenWidth * 0.872,
            height: _screenHeight * 0.073,
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
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        )
      ],
    );
  }
}
